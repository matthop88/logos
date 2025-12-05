local RESULT      = require("toolbox/memory/result")
local STRING_UTIL = require("bible/util/stringUtil")

return {
	vocab = {
		"STORE",
		"RECALL",
	},

	validate = function(self, command)
		for _, cmd in ipairs(self.vocab) do
			if string.upper(command) == cmd then return RESULT:success() end
		end

		return self:getBadCommandError(command)
	end,

	getBadCommandError = function(self, command)
		return RESULT:error("Unknown Command: " .. command .. " (supported commands are " .. self:getVocabList() .. ")")
	end,

	getVocabList = function(self)
		return STRING_UTIL:join(self.vocab, ", ")
	end,
}
