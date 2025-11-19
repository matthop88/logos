require("bible/util/referenceSummarizer")

return {

    getName = function(self)
        return "Reference Summarizer Tests"
    end,
    
    beforeAll = function(self)
        -- Do nothing
    end,

    before = function(self)
        -- Do nothing
    end,

    testBookName = function(self)
        local name = "Book Name"

        local results = summarizeReference("philippians")
        return TESTING:assertEquals(name, results, "Philippians")
    end,

    testBookNameAndChapter = function(self)
        local name = "Book Name and Chapter"

        local results = summarizeReference("philippians", { chapter = 1 })
        return TESTING:assertEquals(name, results, "Philippians 1")
    end,

    testBookNameAndVerseRange = function(self)
        local name = "Book Name and Verse Range"

        local results = summarizeReference("philippians", 
            { 
                { chapter = 1, verse = 1 }, 
                { chapter = 1, verse = 2 }, 
                { chapter = 1, verse = 3 } 
            })
        
        return TESTING:assertEquals(name, results, "Philippians 1:1-3")
    end,

    testBookNameAndVerseRanges = function(self)
        local name = "Book Name and Verse Range"

        local results = summarizeReference("philippians",
            { 
                { chapter = 1, verse = 1 }, 
                { chapter = 1, verse = 2 }, 
                { chapter = 2, verse = 3 },
            })
        
        return TESTING:assertEquals(name, results, "Philippians 1:1-2,2:3")
    end,


}
