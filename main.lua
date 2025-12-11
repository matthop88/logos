local COMMAND_LINE_PARSER = require "commandLineParser"

local parseArgs = function(args)
	COMMAND_LINE_PARSER:parseCommandLine(args, require("bible/cmdSchema"))
end

function love.load(args)
    if     args[1] == "TEST" then require("test/framework")
    elseif args[1] == "NAVIGATOR" then require("bible/navigator/navigatorMain")
    elseif args[1] == "MEM"  then 
        __COMMAND = args[2]
        __ARGS    = {}
        for n, arg in ipairs(args) do
            if n > 2 then table.insert(__ARGS, arg) end
        end
        require("toolbox/memory/memoryApp")
    else
        parseArgs(args)
        require "bible/main"
    end
end
