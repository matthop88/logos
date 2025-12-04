local COMMAND_LINE_PARSER = require("commandLineParser")

local SCHEMA = {
    VERSION = 0.1,

    COMMANDS = {
        wordSize = {
            description = "filter out words of this size or less",
            shortcut = "z",
        },
        punctuation = {
            description = "flag to filter out punctuation",
            shortcut = "p",
        },
        firstNLetters = {
            description = "filter out first n letters of each word",
            shortcut = "n",
        },
        firstNWords = {
            description = "filter out first n words of each line",
            shortcut = "N",
        },
        capitals = {
            description = "flag to preserve capitals",
            shortcut = "C",
        },
    },
}

return {

    getName = function(self)
        return "Command Line Parser Tests"
    end,
    
    beforeAll = function(self)
        -- Do nothing
    end,

    before = function(self)
        -- Do nothing
    end,

    testBookNameOnly = function(self)
        local name = "Philippians => __BOOK_NAME = Philippians"

        local args = { "Philippians" }
        COMMAND_LINE_PARSER:parseCommandLine(args, SCHEMA)
        
        return TESTING:assertTrue(name, __BOOK_NAME    == "Philippians"
                                    and __PASSAGE_INFO == nil)
    end,

    testBookNameAndPassageInfo = function(self)
        local name = "Philippians 1:1-3 => __BOOK_NAME = Philippians, __PASSAGE_INFO = 1:1-3"

        local args = { "Philippians", "1:1-3" }
        COMMAND_LINE_PARSER:parseCommandLine(args, SCHEMA)
        
        return TESTING:assertTrue(name, __BOOK_NAME    == "Philippians"
                                    and __PASSAGE_INFO == "1:1-3")
    end,

    testBookNameAndWordSize = function(self)
        local name = "Philippians --wordSize 3 => __BOOK_NAME = Philippians, __PARAMS.wordSize = 3" 

        local args = { "Philippians", "--wordSize", 3 }
        COMMAND_LINE_PARSER:parseCommandLine(args, SCHEMA)
        
        return TESTING:assertTrue(name, __BOOK_NAME       == "Philippians"
                                    and __PASSAGE_INFO    == nil
                                    and __PARAMS.wordSize == 3)
    end,

    testBookNameAndWordSizeAbbrev = function(self)
        local name = "Philippians 1:1-3 -z 3 => __BOOK_NAME = Philippians, __PARAMS.wordSize = 3"

        local args = { "Philippians", "-z", 3 }
        COMMAND_LINE_PARSER:parseCommandLine(args, SCHEMA)
        
        return TESTING:assertTrue(name, __BOOK_NAME       == "Philippians"
                                    and __PASSAGE_INFO    == nil
                                    and __PARAMS.wordSize == 3)
    end,

    testBookNameAndPassageInfoAndWordSize = function(self)
        local name = "Philippians 1:1-3 --wordSize 3 => __BOOK_NAME = Philippians, __PASSAGE_INFO = 1:1-3, __PARAMS.wordSize = 3"

        local args = { "Philippians", "1:1-3", "--wordSize", 3 }
        COMMAND_LINE_PARSER:parseCommandLine(args, SCHEMA)
        
        return TESTING:assertTrue(name, __BOOK_NAME       == "Philippians"
                                    and __PASSAGE_INFO    == "1:1-3"
                                    and __PARAMS.wordSize == 3)
    end,

    testBookNameAndPunctuation = function(self)
        local name = "Philippians --punctuation => __BOOK_NAME = Philippians, __PARAMS.punctuation = true"

        local args = { "Philippians", "--punctuation" }
        COMMAND_LINE_PARSER:parseCommandLine(args, SCHEMA)
        
        return TESTING:assertTrue(name, __BOOK_NAME          == "Philippians"
                                    and __PASSAGE_INFO       == nil
                                    and __PARAMS.punctuation == true)
    end,

    testBookNameAndPunctuationAndWordSize = function(self)
        local name = "Philippians -p -z 3  => __BOOK_NAME = Philippians, __PARAMS.punctuation = true, __PARAMS.wordSize = 3"

        local args = { "Philippians", "-p", "-z", 3 }
        COMMAND_LINE_PARSER:parseCommandLine(args, SCHEMA)
        
        return TESTING:assertTrue(name, __BOOK_NAME          == "Philippians"
                                    and __PASSAGE_INFO       == nil
                                    and __PARAMS.punctuation == true
                                    and __PARAMS.wordSize    == 3)
    end,
}
