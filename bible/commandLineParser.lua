function startsWith(str, header)
	return string.sub(str, 1, #header) == header
end

function inSchema(arg, schema)
	if startsWith(arg, "-") then
		for k, v in pairs(schema.COMMANDS) do
			if "--" .. k == arg or "-" .. v.shortcut == arg then
				return true
			end
		end
	end
	return false
end

function parseCommandLine(args, schema)
	for n, arg in ipairs(args) do
		if inSchema(arg, schema) then
			print("Arg #" .. n .. " in schema: " .. arg)
		end
	end
end
