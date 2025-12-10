local BOOK_LOADER = require("toolbox/memory/lookup/bookLoader")
local RESULT      = require("toolbox/memory/result")

local enhanceWithNavigatorMethods = function(result)
	result.getName     = function(self) return self end
	result.getVersion  = function(self) return self end
	result.findChapter = function(self, a, b) return self end

	return result
end

local createNavigator = function(bookData)
	return {
		data = bookData,

		getName     = function(self) return self.data.book    end,
		getVersion  = function(self) return self.data.version end,

    	findChapter = function(self, chapterNumber, scriptures)
			for _, c in ipairs(self.data.chapters) do
				if c.chapter == chapterNumber then return RESULT:success(c) end
			end
			return RESULT:error("Chapter not found in " .. self:getName() .. ": " .. chapterNumber)
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
