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

local processVerse = function(chapterData, verseNumber, result)
	local verse = chapterData:findVerse(verseNumber)
	if verse == nil then
		table.insert(result.missing, { chapter = chapterData.chapter, verse = verseNumber })
	else
		local lines = {}
		for _, line in ipairs(verse) do
			table.insert(lines, line)
		end
		lines.chapter = chapterData.chapter
		lines.verse   = verseNumber
		table.insert(result.verses, lines)
	end
end

return {
	findPassage = function(self, passageInfo)
		local bookData = require("bible/book"):create(passageInfo.book)
		if bookData == nil then
			return nil
		else
			local result = {
				book    = passageInfo.book,
				verses  = {},
				missing = {},
				version = bookData:getVersion(),
			}

			if passageInfo.start then
				local chapter = bookData:findChapter(passageInfo.start.chapter)
				if chapter == nil then
					result.missing = { chapter = passageInfo.start.chapter }
				elseif passageInfo.start.verse then
					local startVerse = passageInfo.start.verse
					local endVerse   = startVerse
					if passageInfo.finish and passageInfo.finish.verse then
						endVerse = passageInfo.finish.verse
					end
					for v = startVerse, endVerse do
						processVerse(chapter, v, result)
					end
				else
					for _, v in ipairs(chapter.verses) do
						processVerse(chapter, v.verse, result)
					end
				end
			end

			return result
		end
	end,
}
