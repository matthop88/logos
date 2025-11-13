function love.load(args)
    if args[1] == "TEST" then
        require("test/framework")
    else
        __BOOK_NAME    = args[1]
        __PASSAGE_INFO = args[2]
        require "bible/main"
    end
end
