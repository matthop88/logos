function findScriptureFile(filename, directory)
    local directoryItems = love.filesystem.getDirectoryItems(directory)
    for _, v in ipairs(directoryItems) do
        if v == string.lower(filename) .. ".lua" then
            return directory .. "/" .. string.lower(filename)
        else
            local result = findScriptureFile(filename, directory .. "/" .. v)
            if result ~= nil then return result end
        end
    end
end

function printResponse(category, message)
    message = message or ""
    print("\n[" .. category .. "] " .. message .. "\n")
end

if __BOOK_NAME == nil then
    printResponse("ERROR", "Please specify a book of the Bible.")
else
    local scripturePath = findScriptureFile(__BOOK_NAME, "bible/scriptures")
    if scripturePath ~= nil then
        printResponse("OK")
    else
        printResponse("ERROR", "Book not found: " .. __BOOK_NAME)
    end
end

love.event.quit()
