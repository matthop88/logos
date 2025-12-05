local CMD_PARSER = require("toolbox/memory/commandParser")

local result     = CMD_PARSER:parse(__COMMAND or "", __ARGS or {})

if result:isError() then
	result:print()
else
	local scripture, filter = result:getData().scripture, result:getData().filter
		
	print("SCRIPTURE: " .. scripture)
	if filter ~= nil then print("FILTER:    " .. filter) end
	print()
end

love.event.quit()
