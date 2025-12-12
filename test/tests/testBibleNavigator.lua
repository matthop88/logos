local BIBLE_NAVIGATOR = require("bible/navigator/bibleNavigator")

return {

    getName = function(self)
        return "Bible Navigator Tests"
    end,
    
    beforeAll = function(self)
        -- Do nothing
    end,

    before = function(self)
        -- Do nothing
    end,

    testSinglePassageLookup = function(self)
        local name = "Single Passage Lookup, Finding"

        local passageInfo = {
            {   book   = "Ephesians",
                start  = {  chapter = 1,
                            verse   = 3,
                },
                finish = {  chapter = 1,
                            verse   = 3,
                },
            },
        }

        local LINE_1 = "Blessed be the God and Father of our Lord Jesus Christ,"
        local LINE_2 = "who has blessed us with every spiritual blessing in the heavenly places in Christ,"   
                
        local passageInfo = BIBLE_NAVIGATOR:find(passageInfo)
    
        return TESTING:assertTrue(name, (
                #passageInfo.found             == 1
            and  passageInfo.found[1].book     == "Ephesians"
            and #passageInfo.found[1].chapters == 1
            and #passageInfo.found[1].chapters[1].verses == 1
            and  passageInfo.found[1].chapters[1].verses[1].verse == 3
            and #passageInfo.found[1].chapters[1].verses[1]       == 2
            and  passageInfo.found[1].chapters[1].verses[1][1]    == LINE_1
            and  passageInfo.found[1].chapters[1].verses[1][2]    == LINE_2
            ))
    end,
}
