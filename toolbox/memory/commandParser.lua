local CMD_VALIDATOR = require("toolbox/memory/commandValidator")
local ARG_PARSER    = require("toolbox/memory/argParser")

local RESULT        = require("toolbox/memory/result")

return {
	parse = function(self, command, args)
		local cmdResult  = CMD_VALIDATOR:validate(command)
		local argsResult = ARG_PARSER:parse(args)
		
		if     cmdResult:isError()  then return cmdResult
		elseif argsResult:isError() then return argsResult
		else                             return self:generateFullResult(cmdResult, argsResult)
		end
	end,

	generateFullResult = function(self, cmdResult, argsResult)
		local scripture, filter = argsResult:getData().scripture, argsResult:getData().filter
		if command == "STORE" and filter == nil then
			return RESULT:error("No filter specified!")
		else
			return RESULT:success { fn = cmdResult:getData().fn, scripture = scripture, filter = filter }
		end
	end,
}
