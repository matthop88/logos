require("bible/util/fileHelper")

--[[

New architecture:
passageInfo will have the following structure:

For a single chapter:
{ book = "{bookName"}, start = { chapter = c } }

For a single verse:
{ book = "{bookName"}, start = { chapter = c, verse = v } }

For a range of verses:
{ book = "{bookName"}, start = { chapter = c, verse = v1 }, finish = { chapter = c, verse = v2 } }

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
	findPassage = function(self, passageInfo)
		local scriptures = self:loadBook(passageInfo.book)
		if scriptures == nil then
			return nil
		else
			local result = {
				book = passageInfo.book
			}

			if passageInfo.start then
				local chapter = self:findChapter(passageInfo.start.chapter, scriptures)
				if chapter == nil then
					result.missing = { chapter = passageInfo.start.chapter }
				end
			end

			return result
		end
	end,

	loadBook = function(self, bookName)
		local scripturePath = locateLuaFile(bookName, "bible/scriptures")
    	if scripturePath ~= nil then
    		return require(scripturePath)
    	end
	end,

	findChapter = function(self, chapter, scriptures)
		for _, c in ipairs(scriptures.chapters) do
			if c.chapter == chapter then
				return c
			end
		end
	end,
}
