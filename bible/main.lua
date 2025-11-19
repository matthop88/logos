require("bible/util/consoleFunctions")
require("bible/util/referenceParser")
require("bible/util/referenceSummarizer")
local STRING_UTIL = require("bible/util/stringUtil")

local PASSAGE_FINDER = require("bible/passageFinder")

local displayVerses = function(verses, version)
	local referenceSummary = summarizeReference(__BOOK_NAME, verses)
	if version ~= nil then
		referenceSummary = referenceSummary .. " (" .. version .. ")"
	end
	local caption = STRING_UTIL:caption(referenceSummary)
	print(caption)
	print()
	for _, v in ipairs(verses) do
		local verseNumber = v.verse
		for n, line in ipairs(v) do
			local spacer = "   "
			if verseNumber > 9 then
				spacer = "  "
			end
			if n == 1 then print(verseNumber .. spacer .. line)
			else           print(        " " .. "   "  .. line)  end
		end
	end
	print()
end

local passageInfo = {}

if __PASSAGE_INFO then
	passageInfo = parseReference(__PASSAGE_INFO)
end

if __BOOK_NAME == nil then
	printResponse("ERROR", "Please specify a book of the Bible.")
else
	passageInfo.book = __BOOK_NAME

	local response = PASSAGE_FINDER:findPassage(passageInfo)
	if not response then
		printResponse("ERROR", "Book not found: " .. summarizeReference(__BOOK_NAME))
	elseif response.missing.chapter then
    	printResponse("ERROR", "Chapter not found: " .. summarizeReference(__BOOK_NAME, response.missing))
    elseif #response.missing > 0 then
    	local missingVersesSummary = summarizeReference(__BOOK_NAME, response.missing)
    	printResponse("ERROR", "Verse not found: " .. missingVersesSummary)
    else
    	displayVerses(response.verses, response.version)
    end
end

love.event.quit()
