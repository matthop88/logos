require("bible/util/fileHelper")

--[[

New architecture:
passageInfo will have the following structure:

For a single chapter:
{ start = { chapter = c } }

For a single verse:
{ start = { chapter = c, verse = v } }

For a range of verses:
{ start = { chapter = c, verse = v1 }, finish = { chapter = c, verse = v2 } }

Currently, there is no support for a range of verses spanning multiple chapters.

The passageFinder should return the following:

{
	book = "{name of the book}",
	verses = {
		{	chapter = c, verse = v1,
			"First line",
			"Second line",
			"Third line",
		},
	},
	missing = {
		{	chapter = c, verse = v1 },
		{	chapter = c, verse = v2 },
		etc.
	},
}

If the book isn't found, returns nil.

]]

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
