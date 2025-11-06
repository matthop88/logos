function love.load(args)
    for _, arg in ipairs(args) do
        print(arg)
    end

    __BOOK_NAME = args[1]

    print()

    require "bible/main"
end

