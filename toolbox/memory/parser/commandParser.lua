local CMD_VALIDATOR = require("toolbox/memory/validation/commandValidator")
local ARG_PARSER    = require("toolbox/memory/parser/argParser")

local RESULT        = require("toolbox/memory/result")

return {
	parse = function(self, command, args)
		local argsResult = ARG_PARSER:parse(args)
		if   argsResult:isError() then return argsResult
		else
			local scripture, filter = argsResult:getData().scripture, argsResult:getData().filter
			local cmdResult  = CMD_VALIDATOR:validate(command, scripture, filter)
			if cmdResult:isError() then return cmdResult
			else						return self:generateFullResult(cmdResult, scripture, filter) end
		end
	end,

	generateFullResult = function(self, cmdResult, scripture, filter)
		return RESULT:success { fn = cmdResult:getData().fn, scripture = scripture, filter = filter }
	end,
}
