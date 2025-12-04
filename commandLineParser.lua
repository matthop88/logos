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

	parseBookAndPassageInfo = function(self, args)
		__BOOK_NAME = args[1]
		if args[2] and not STRING_UTIL:startsWith(args[2], "-") then
			__PASSAGE_INFO = args[2]
		end
	end,

	parseCommandLine = function(self, args, schema)
		__BOOK_NAME, __PASSAGE_INFO = nil, nil
		self:parseBookAndPassageInfo(args)
		self:parseCommandLineIntern(args, schema)
	end,

	parseCommandLineIntern = function(self, args, schema)
		local expectingValueFor = nil
		__PARAMS = {}
		for _, arg in ipairs(args) do
			local schemaCommand = self:getSchemaCommand(arg, schema)
			if     schemaCommand ~= nil then __PARAMS[schemaCommand]     = true
			elseif expectingValueFor    then __PARAMS[expectingValueFor] = arg  end
			
			expectingValueFor = schemaCommand
		end
	end,
}
