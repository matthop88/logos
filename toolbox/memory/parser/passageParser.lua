--[[
returns data in the following format:
{
	start  = { chapter = c1, verse = v1 },
	finish = { chapter = c2, verse = v2 },
}
]]

local STRING_UTIL = require("bible/util/stringUtil")

local parseRangeElement
local resolveAmbiguities
local resolveStartingAmbiguities
local resolveFinishingAmbiguities

local parsePassage = function(passage)
	local startElt, finishElt = unpack(STRING_UTIL:split(passage, "-"))
	local start               = parseRangeElement(startElt)
	local finish              = parseRangeElement(finishElt)

	if finishElt == nil then
		return resolveAmbiguities { start = start }
	else
		return resolveAmbiguities { start = start, finish = finish }
	end
end

parseRangeElement = function(rangeElt)
	if rangeElt == nil then return nil
	else
		local chapterElt, verseElt = unpack(STRING_UTIL:split(rangeElt, ":"))
		if verseElt == nil then
			return { ambiguous = tonumber(chapterElt) }
		else
			return { chapter = tonumber(chapterElt), verse = tonumber(verseElt) }
		end
	end
end

resolveAmbiguities = function(parsedPassage)
	parsedPassage.start  = resolveStartingAmbiguities(parsedPassage.start)
	parsedPassage.finish = resolveFinishingAmbiguities(parsedPassage.start, parsedPassage.finish)
	return parsedPassage
end

resolveStartingAmbiguities = function(start)
	if start.ambiguous then return { chapter = start.ambiguous } 
	else                    return start                     end
end

resolveFinishingAmbiguities = function(start, finish)
	if finish.ambiguous then
		if start.verse then return { chapter = start.chapter, verse = finish.ambiguous }
		else                return { chapter = finish.ambiguous }                    end
	else
		return finish
	end
end

return {
	parse = function(self, passage) 
		return parsePassage(passage)
	end,
}
