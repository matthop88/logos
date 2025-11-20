local STRING_UTIL = require("bible/util/stringUtil")

return {
	getSchemaCommand = function(self, arg, schema)
		if STRING_UTIL:startsWith(arg, "-") then
			for k, v in pairs(schema.COMMANDS) do
				if "--" .. k == arg or "-" .. v.shortcut == arg then
					return k
				end
			end
		end
		return nil
	end,

	parseCommandLine = function(self, args, schema)
		local expectingValueFor = nil
		local commands = {}
		for n, arg in ipairs(args) do
			local schemaCommand = self:getSchemaCommand(arg, schema)
			if     schemaCommand ~= nil then commands[schemaCommand]     = true
			elseif expectingValueFor    then commands[expectingValueFor] = arg  end
			
			expectingValueFor = schemaCommand
		end
		for k, v in pairs(commands) do
			print(k .. ": ", v)
		end
	end,
}
