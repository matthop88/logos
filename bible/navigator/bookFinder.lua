require("bible/util/fileHelper")

return {
	findBook = function(self, bookName)
		local bookPath = locateLuaFile(bookName, "bible/scriptures")
    	if bookPath == nil then
    		return nil
    	else
    		return require(bookPath)
    	end
	end,
}
