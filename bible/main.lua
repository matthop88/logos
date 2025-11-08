require("bible/util/consoleFunctions")

local PASSAGE_FINDER = require("bible/passageFinder")

local findChapter = function(scriptureData, chapterNum)
	for _, c in ipairs(scriptureData.chapters) do
		if c.chapter == chapterNum then
			return c
		end
	end
end

if __BOOK_NAME == nil then
	printResponse("ERROR", "Please specify a book of the Bible.")
else
	local bookData = PASSAGE_FINDER:findPassage(__BOOK_NAME, __PASSAGE_INFO)
	if bookData == nil then
		printResponse("ERROR", "Book not found " .. __BOOK_NAME)
	elseif __PASSAGE_INFO == nil then
        printResponse("OK")
    else
        local chapterNum = tonumber(__PASSAGE_INFO)
        if not findChapter(scriptureData, chapterNum) then
        	printResponse("ERROR", "Chapter not found: " .. __BOOK_NAME .. " " .. chapterNum)
        else
        	printResponse("OK")
        end
    end
end

love.event.quit()
