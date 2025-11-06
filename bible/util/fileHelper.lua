function findLuaFile(filename, directory)
    local directoryItems = love.filesystem.getDirectoryItems(directory)
    for _, v in ipairs(directoryItems) do
        if v == string.lower(filename) .. ".lua" then
            return directory .. "/" .. string.lower(filename)
        else
            local result = locateLuaFile(filename, directory .. "/" .. v)
            if result ~= nil then return result end
        end
    end
end
