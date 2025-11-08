require("bible/util/fileHelper")

return {
	findPassage = function(self, bookName, passageInfo)
		local result = {}

		return self:loadBook(bookName)
	end,

	loadBook = function(self, bookName)
		local scripturePath = locateLuaFile(bookName, "bible/scriptures")
    	if scripturePath ~= nil then
    		return { bookFound = require(scripturePath) }
    	else
    		return { bookFound = nil }
    	end
	end,
}
