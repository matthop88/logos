require("bible/util/consoleFunctions")
require("bible/util/fileHelper")

if __BOOK_NAME == nil then
    printResponse("ERROR", "Please specify a book of the Bible.")
else
    local scripturePath = locateLuaFile(__BOOK_NAME, "bible/scriptures")
    if scripturePath ~= nil then
        printResponse("OK")
    else
        printResponse("ERROR", "Book not found: " .. __BOOK_NAME)
    end
end

love.event.quit()
