local BIBLE_NAVIGATOR = require("bible/navigator/bibleNavigator")

local bookQuery = BIBLE_NAVIGATOR:query():book("Ephesians")

print(bookQuery:getBookName())

love.event.quit()
