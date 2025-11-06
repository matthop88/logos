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

print("Welcome to Logos!")

local scripturePath = findScriptureFile("philippians", "bible/scriptures")
print(scripturePath)
love.event.quit()
