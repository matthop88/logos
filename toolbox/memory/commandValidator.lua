local RESULT      = require("toolbox/memory/result")
local STRING_UTIL = require("bible/util/stringUtil")

return {
	vocab = {
		"STORE",
		"RECALL",
	},

	validate = function(self, command, scripture, filter)
		local validationResult = self:validateCommandWord(command)
		if     validationResult:isError()           then return validationResult
		elseif command == "STORE" and filter == nil then return RESULT:error("No filter specified!")
		else                                             return RESULT:success({ fn = nil })     end
	end,

	validateCommandWord = function(self, commandWord)
		for _, cmd in ipairs(self.vocab) do
			if string.upper(commandWord) == cmd then return RESULT:success({ fn = nil }) end
		end

		return self:getBadCommandError(commandWord)
	end,

	getBadCommandError = function(self, command)
		return RESULT:error("Unknown Command: " .. command .. " (supported commands are " .. self:getVocabList() .. ")")
	end,

	getVocabList = function(self)
		return STRING_UTIL:join(self.vocab, ", ")
	end,
}
