local STRING_UTIL = require("bible/util/stringUtil")

return {
	inSchema = function(self, arg, schema)
		if STRING_UTIL:startsWith(arg, "-") then
			for k, v in pairs(schema.COMMANDS) do
				if "--" .. k == arg or "-" .. v.shortcut == arg then
					return true
				end
			end
		end
		return false
	end,

	parseCommandLine = function(self, args, schema)
		for n, arg in ipairs(args) do
			if self:inSchema(arg, schema) then
				print("Arg #" .. n .. " in schema: " .. arg)
			end
		end
	end,
}
