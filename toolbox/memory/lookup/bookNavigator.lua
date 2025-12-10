local BOOK_LOADER = require("toolbox/memory/lookup/bookLoader")
local RESULT      = require("toolbox/memory/result")

local enhanceWithVerseMethods = function(result)
	if not result:isError() then
		result.display = function(self)
			for _, line in ipairs(self) do
				print(line)
			end
		end
	end

	return result
end

local findVerse = function(self, verseNumber)
	local result
	for _, v in ipairs(self.verses) do
		if v.verse == verseNumber then
			result = RESULT:success(v)
		end
	end
	result = result or RESULT:error("Verse " .. verseNumber .. " not found.")

	return enhanceWithVerseMethods(result)
end

local enhanceWithChapterMethods = function(result)
	if result:isError() then result.findVerse = function(self) return self end
	else                     result.findVerse = findVerse                  end
	return result
end

local enhanceWithNavigatorMethods = function(result)
	result.getName     = function(self) return self end
	result.getVersion  = function(self) return self end
	result.findChapter = function(self, a, b) return enhanceWithChapterMethods(self) end

	return result
end

local createNavigator = function(bookData)
	return {
		data = bookData,

		getName     = function(self) return self.data.book    end,
		getVersion  = function(self) return self.data.version end,

    	findChapter = function(self, chapterNumber, scriptures)
			local result
			for _, c in ipairs(self.data.chapters) do
				if c.chapter == chapterNumber then result = RESULT:success(c) end
			end
			result = result or RESULT:error("Chapter not found in " .. self:getName() .. ": " .. chapterNumber)

			return enhanceWithChapterMethods(result)
		end,
	}
end

return {
	create = function(self, bookName)
		local result = BOOK_LOADER:load(bookName)
		if result:isError() then return enhanceWithNavigatorMethods(result)
		else                     
			local bookData = result:getData()
			return RESULT:success(createNavigator(bookData))
		end
	end,
}
