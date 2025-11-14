require("bible/util/consoleFunctions")
require("bible/util/referenceParser")

local PASSAGE_FINDER = require("bible/passageFinder")

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
		printResponse("ERROR", "Book not found: " .. __BOOK_NAME)
	elseif __PASSAGE_INFO == nil then
        printResponse("OK")
    elseif response.missing.chapter then
    	printResponse("ERROR", "Chapter not found: " .. __BOOK_NAME .. " " .. response.missing.chapter)
    elseif #response.missing > 0 then
    	printResponse("ERROR", "Verse not found: " .. __BOOK_NAME .. " " .. response.missing[1].chapter .. ":" .. response.missing[1].verse)
    else
    	printResponse("OK")
    end
end

love.event.quit()
