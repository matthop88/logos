require("bible/util/referenceParser")

return {

    getName = function(self)
        return "Reference Parser Tests"
    end,
    
    beforeAll = function(self)
        -- Do nothing
    end,

    before = function(self)
        -- Do nothing
    end,

    testSingleChapter = function(self)
        local name = "1       => { start = { chapter = 1 } }"

        local results = parseReference("1")
        return TESTING:assertTrue(name, results.finish        == nil 
                                    and results.start.chapter == 1 
                                    and results.start.verse   == nil)
    end,

    testChapterRange = function(self)
        local name = "1-3     => { start = { chapter = 1 }, finish = { chapter = 3 } }"

        local results = parseReference("1-3")
        return TESTING:assertTrue(name, results.start.chapter  == 1 
                                    and results.start.verse    == nil
                                    and results.finish.chapter == 3
                                    and results.finish.verse   == nil)
    end,

    testSingleVerse = function(self)
        local name = "1:1     => { start = { chapter = 1, verse = 1 } }"

        local results = parseReference("1:1")
        return TESTING:assertTrue(name, results.start.chapter == 1
                                    and results.start.verse   == 1
                                    and results.finish        == nil)
    end,

    testVerseRange = function(self)
        local name = "1:1-3   => { start = { chapter = 1, verse = 1 }, finish = { chapter = 1, verse = 3 } }"

        local results = parseReference("1:1-3")
        return TESTING:assertTrue(name, results.start.chapter  == 1 
                                    and results.start.verse    == 1
                                    and results.finish.chapter == 1
                                    and results.finish.verse   == 3)
    end,

    testChapterAndVerseRange = function(self)
        local name = "1:4-2:5 => { start = { chapter = 1, verse = 4 }, finish = { chapter = 2, verse = 5 } }"

        local results = parseReference("1:4-2:5")
        return TESTING:assertTrue(name, results.start.chapter  == 1 
                                    and results.start.verse    == 4
                                    and results.finish.chapter == 2
                                    and results.finish.verse   == 5)
    end,

    testChapterAndFinishingVerseRange = function(self)
        -- Perhaps this should not be allowed, because it is confusing
        local name = "1-2:5   => { start = { chapter = 1 }, finish = { chapter = 2, verse = 5 } }"

        local results = parseReference("1-2:5")
        return TESTING:assertTrue(name, results.start.chapter  == 1 
                                    and results.start.verse    == nil
                                    and results.finish.chapter == 2
                                    and results.finish.verse   == 5)
    end,
}
