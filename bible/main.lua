require("bible/util/consoleFunctions")
require("bible/util/fileHelper")

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
    local scripturePath = locateLuaFile(__BOOK_NAME, "bible/scriptures")
    if scripturePath ~= nil then
    	local scriptureData = require(scripturePath)

    	if __PASSAGE_INFO == nil then
        	printResponse("OK")
        else
        	local chapterNum = tonumber(__PASSAGE_INFO)
        	if findChapter(scriptureData, chapterNum) then
        		printResponse("OK")
        	else
        		printResponse("ERROR", "Chapter not found: " .. __BOOK_NAME .. " " .. chapterNum)
        	end
        end
    else
        printResponse("ERROR", "Book not found: " .. __BOOK_NAME)
    end
end

love.event.quit()
