return {
    split = function(self, inputString, delimiter)
        delimiter = delimiter or " "
        local result = {}
        local pattern = "(.-)" .. delimiter .. "()" 
        local lastPos = 1

        for chunk, currentPos in string.gmatch(inputString, pattern) do
            table.insert(result, chunk)
            lastPos = currentPos
        end
        
        table.insert(result, string.sub(inputString, lastPos))
        return result
    end,

    capitalize = function(self, str)
        return string.upper(string.sub(str, 1, 1)) .. string.sub(str, 2)
    end,
}
