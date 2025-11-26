local TOKEN_FILTER = require("bible/util/tokenFilter")

return {

    getName = function(self)
        return "Token Filter Tests"
    end,
    
    beforeAll = function(self)
        -- Do nothing
    end,

    before = function(self)
        -- Do nothing
    end,

    testEmptyCode = function(self)
        local name = "Empty Code Test"

        local token = "Watow!"
        local code  = "******"

        local results = TOKEN_FILTER:filter(token, code)

        return TESTING:assertEquals(name, "Watow!", results)
    end,
}
