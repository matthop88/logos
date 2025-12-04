local COMMAND_LINE_PARSER = require "commandLineParser"

local parseArgs = function(args)
	COMMAND_LINE_PARSER:parseCommandLine(args, require("bible/cmdSchema"))
end

function love.load(args)
    if     args[1] == "TEST" then require("test/framework")
    elseif args[1] == "MEM"  then require("toolbox/memory/memoryApp")
    else
        parseArgs(args)
        require "bible/main"
    end
end
