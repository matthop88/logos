local parseArgs = function(args)
	local consumingSize = false
	for _, arg in ipairs(args) do
		if arg == "--wordSize" or arg == "-z" then
			consumingSize = true
		elseif consumingSize then
			__WORD_SIZE = tonumber(arg)
			consumingSize = false
		elseif __BOOK_NAME == nil then
			__BOOK_NAME = arg
		elseif __PASSAGE_INFO == nil then
			__PASSAGE_INFO = arg
		end
	end

end

function love.load(args)
    if args[1] == "TEST" then
        require("test/framework")
    else
        parseArgs(args)
        require "bible/main"
    end
end
