local STRING_UTIL = require("bible/util/stringUtil")

local parseChapter = function(verseInfo)
	local elements = STRING_UTIL:split(verseInfo, ":")
	if #elements == 1 then
		return { chapter = tonumber(elements[1]) }
	else
		return { chapter = tonumber(elements[1]), verse = tonumber(elements[2]) }
	end
end

local parseVerse = function(verseInfo, chapter)
	local elements = STRING_UTIL:split(verseInfo, ":")
	if #elements == 1 then
		return { chapter = chapter, verse = tonumber(elements[1]) }
	else
		return { chapter = tonumber(elements[1]), verse = tonumber(elements[2]) }
	end
end

function parseReference(referenceString)
	local elements = STRING_UTIL:split(referenceString, "-")
	if #elements == 1 then
		return { start = parseChapter(elements[1]) }
	else
		start = parseChapter(elements[1])
		if start.verse then return { start = start, finish = parseVerse(elements[2], start.chapter) }
		else                return { start = start, finish = parseChapter(elements[2]) } end
	end
end
