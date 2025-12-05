__COMMAND = __COMMAND or ""
__ARGS    = __ARGS    or {}

local CMD_VALIDATOR = require("toolbox/memory/commandValidator")
local ARG_PARSER    = require("toolbox/memory/argParser")

local cmdResult  = CMD_VALIDATOR:validate(__COMMAND)

if cmdResult:isError() then
	cmdResult:print()
else
	local argsResult = ARG_PARSER:parse(__ARGS)
	if argsResult:isError() then 
		argsResult:print()
	else
		local scripture, filter = argsResult:getData().scripture, argsResult:getData().filter
		
		if __COMMAND == "STORE" and filter == nil then
			require("toolbox/memory/result"):error("No filter specified!"):print()
		else
			print("SCRIPTURE: " .. scripture)
			if filter ~= nil then
				print("FILTER:    " .. filter)
			end
			print()
		end
	end
end

love.event.quit()
