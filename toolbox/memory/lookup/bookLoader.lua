require("bible/util/fileHelper")

local RESULT = require("toolbox/memory/result")

return {
	load = function(self, bookName)
		local bookPath = locateLuaFile(bookName, "bible/scriptures")
		if bookPath == nil then
			return RESULT:error("Book Not Found: " .. bookName)
		else
			return RESULT:success(require(bookPath))
		end
	end,
}
