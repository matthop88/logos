local STRING_UTIL = require("bible/util/stringUtil")
local RESULT      = require("toolbox/memory/result")

return {
	parse = function(self, args)
		local scripture, filter = self:getScriptureAndFilter(args)

		if     #scripture < 1 then
			return RESULT:error("No scripture specified!")
		elseif #scripture > 2 then
			return RESULT:error("Filters expected on 3rd argument. Instead found " .. args[4])
		else
			return RESULT:success { 
				scripture = self:normalizeScripture(scripture), 
				filter    = STRING_UTIL:join(filter),
			}
		end
	end,

	normalizeScripture = function(self, scriptureArray)
		local book = scriptureArray[1]
		if #scriptureArray > 1 then passage = scriptureArray[2] end
		return { book = book, passage = passage, label = STRING_UTIL:join(scriptureArray) }
	end,

	getScriptureAndFilter = function(self, args)
		local scripture     = {}
		local filter        = {}
		local onFilter = false

		for _, arg in ipairs(args) do
			if STRING_UTIL:startsWith(arg, "-") then onFilter = true end

			if onFilter then table.insert(filter,    arg)
			else             table.insert(scripture, arg) end
		end

		return scripture, filter
	end,
}
