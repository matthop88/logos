function findScriptureFile(filename)
    -- if file is in scriptures, find it
    -- if not, search all subdirectories
    local directoryItems = love.filesystem.getDirectoryItems("bible/scriptures")
    for _, v in ipairs(directoryItems) do
        print(v)
    end
end

print("Welcome to Logos!")

findScriptureFile("philippians")
love.event.quit()
