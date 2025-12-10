local CMD_PARSER     = require("toolbox/memory/parser/commandParser")
local PASSAGE_PARSER = require("toolbox/memory/parser/passageParser")
local BOOK_NAVIGATOR = require("toolbox/memory/lookup/bookNavigator")

local result     = CMD_PARSER:parse(__COMMAND or "", __ARGS or {})

if result:isError() then
	result:print()
else
	local scripture, filter = result:getData().scripture, result:getData().filter
		
	print("SCRIPTURE: " .. scripture.label)
	print("BOOK:      " .. scripture.book)
	print("PASSAGE:   " .. scripture.passage)

	if filter ~= nil then print("FILTER:    " .. filter) end
	print()

	local parsedPassage = PASSAGE_PARSER:parse(scripture.passage)
	
	local navigator = BOOK_NAVIGATOR:create(scripture.book)
	local chapter   = navigator:findChapter(parsedPassage.start.chapter)
	local verse     = chapter:findVerse(parsedPassage.start.verse)
	
	if verse:isError() then
		verse:print()
	else
		verse:display()
	end

	
end

love.event.quit()
