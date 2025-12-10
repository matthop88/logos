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
	print("PARSED PASSAGE:")
	print("  Start:")
	print("    Chapter: " .. parsedPassage.start.chapter)
	if parsedPassage.start.verse then
		print("    Verse: " .. parsedPassage.start.verse)
	end
	if parsedPassage.finish then
		print("  Finish:")
		print("    Chapter: " .. parsedPassage.finish.chapter)
		if parsedPassage.finish.verse then
			print("    Verse: " .. parsedPassage.finish.verse)
		end
	end

	local navigator = BOOK_NAVIGATOR:create(scripture.book)
	local chapter   = navigator:findChapter(parsedPassage.start.chapter)
	if chapter:isError() then
		chapter:print()
	else
		print("Successfully found chapter " .. parsedPassage.start.chapter)
	end

	--[[
	Desired:
	local navigator = BOOK_NAVIGATOR:create(scripture.book)
	local chapter   = navigator:findChapter(parsedPassage.start.chapter) 
	if chapter:isError() then
		chapter:print()
	else
		...
	end

	1. Even though BOOK_NAVIGATOR:create() returns a result, the method
	   findChapter() can be called directly. This is because in the case of a
	   success, the methods of success are added to the data itself.
	2. In the case of an error result, these methods will also be created, but they
	   will just return self.
	]]

	
end

love.event.quit()
