return {
	filter = function(self, token, code)
		local filteredToken = ""
		for i = 1, string.len(token) do
			local tokenChar = string.sub(token, i, i)
			local codeChar  = string.sub(code,  i, i)
			filteredToken = filteredToken .. self:filterChar(tokenChar, codeChar)
		end
		return filteredToken
	end,

	filterChar = function(self, tokenChar, codeChar)
		if codeChar == "-" then return "-"
		else                    return tokenChar end
	end,
}
