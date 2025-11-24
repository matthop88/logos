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

    join = function(self, elements, delimiter)
        delimiter = delimiter or " "
        local joinedString = nil
        for _, e in ipairs(elements) do
            if joinedString == nil then joinedString = e
            else                        joinedString = joinedString .. delimiter .. e end
        end
        return joinedString
    end,

    capitalize = function(self, str)
        return string.upper(string.sub(str, 1, 1)) .. string.sub(str, 2)
    end,

    caption = function(self, str)
        return "\n" .. str .. "\n" .. string.rep("-", string.len(str))
    end,

    startsWith = function(self, str, header)
        return string.sub(str, 1, #header) == header
    end,

    isPunctuation = function(self, char)
        return char == "." or char == "," or char == "-" or char == "!" or char == "?" or char == "'" or char == "\"" or char == ";" or char == ":" or char == "(" or char == ")"
    end,
}
