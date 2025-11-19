require("bible/util/fileHelper")

local findVerse = function(self, verseNumber)
	for _, v in ipairs(self.verses) do
		if v.verse == verseNumber then
			return v
		end
	end
end

return {
	create = function(self, bookName)
		local bookPath = locateLuaFile(bookName, "bible/scriptures")
    	if bookPath == nil then
    		return nil
    	else
    		local bookData = require(bookPath)
    		-- Create book object with book data in it
    		return {
    			data = bookData,

    			getName = function(self)
    				return self.data.book
    			end,

    			getVersion = function(self)
    				return self.data.version
    			end,

    			findChapter = function(self, chapterNumber, scriptures)
					for _, c in ipairs(self.data.chapters) do
						if c.chapter == chapterNumber then
							c.findVerse = findVerse
							return c
						end
					end
				end,
    		}
    	end
	end,
}
