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

        local token = "blessing"
        local code  = "********"

        local results = TOKEN_FILTER:filter(token, code)

        return TESTING:assertEquals(name, "blessing", results)
    end,

    testFullFilterCode = function(self)
        local name = "Full Code Test"

        local token = "foundation"
        local code  = "----------"

        local results = TOKEN_FILTER:filter(token, code)

        return TESTING:assertEquals(name, "----------", results)
    end,

    testCapitalizationCode = function(self)
        local name = "Capitalization Code Test"

        local token = "Ephesians"
        local code  = "*--------"

        local results = TOKEN_FILTER:filter(token, code)

        return TESTING:assertEquals(name, "E--------", results)
    end,

    testPunctuationCode = function(self)
        local name = "Punctuation Code Test"

        local token = "world,"
        local code  = "-----*"

        local results = TOKEN_FILTER:filter(token, code)

        return TESTING:assertEquals(name, "-----,", results)
    end,
}
