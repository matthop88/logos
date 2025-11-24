local STRING_UTIL = require("bible/util/stringUtil")

local replaceWithDashes = function(str)
    local newStr = ""
    for i = 1, string.len(str) do
    	local myChar = string.sub(str, i, i)
        if STRING_UTIL:isPunctuation(myChar) then newStr = newStr .. myChar
        else                                      newStr = newStr .. "-"   end 
    end
    return newStr
end

lengthWithoutPunctuation = function(str)
	local length = 0
	for i = 1, string.len(str) do
		local myChar = string.sub(str, i, i)
		if not STRING_UTIL:isPunctuation(myChar) then length = length + 1 end
	end
	return length
end

return {
	__MIN_LETTER_FILTER = {
		filterMinLetters = function(self, phrase, minLetters)
			return self:assemble(self:tokenize(phrase, minLetters))
		end,

		tokenize = function(self, phrase, minLetters)
			local tokens = STRING_UTIL:split(phrase)
			local newTokens = {}
			for _, t in ipairs(tokens) do
				table.insert(newTokens, self:transform(t, minLetters))
		    end
	        return newTokens
	    end,

	    transform = function(self, token, minLetters)
	    	if lengthWithoutPunctuation(token) <= minLetters then return replaceWithDashes(token)
	    	else                                                  return token                end
	    end,

	    assemble = function(self, tokens)
	    	return STRING_UTIL:join(tokens)
	    end,
	},

	filterMinLetters = function(self, phrase, minLetters)
		return self.__MIN_LETTER_FILTER:filterMinLetters(phrase, minLetters)
	end,
    	
}
