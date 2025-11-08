require("bible/util/fileHelper")

return {
	findPassage = function(self, bookName, passageInfo)
		return self:loadBook(bookName)
	end,

	loadBook = function(self, bookName)
		local scripturePath = locateLuaFile(bookName, "bible/scriptures")
    	if scripturePath ~= nil then
    		return require(scripturePath)
    	end
	end,
}
