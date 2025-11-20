require "commandLineParser"

local parseArgs = function(args)
	parseCommandLine(args, require("bible/cmdSchema"))

end

function love.load(args)
    if args[1] == "TEST" then
        require("test/framework")
    else
        __BOOK_NAME    = args[1]
        __PASSAGE_INFO = args[2]
        parseArgs(args)
        require "bible/main"
    end
end
