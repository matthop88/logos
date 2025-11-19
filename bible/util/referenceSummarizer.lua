local STRING_UTIL = require("bible/util/stringUtil")

summarizeReference = function(bookName, verses)
	local refString = ""
	if verses ~= nil then
		if verses.chapter then
			refString = "" .. verses.chapter
		else
			local ranges = {}
			for _, v in ipairs(verses) do
				if #ranges == 0 then
					table.insert(ranges, { chapter = v.chapter, verse = v.verse, endVerse = v.verse })
				elseif ranges[#ranges].chapter == v.chapter and v.verse == ranges[#ranges].endVerse + 1 then
					ranges[#ranges].endVerse = v.verse
				else
					table.insert(ranges, { chapter = v.chapter, verse = v.verse, endVerse = v.verse })
				end
			end

			for _, r in ipairs(ranges) do
				if refString ~= "" then
					refString = refString .. ","
				end
				refString = refString .. r.chapter .. ":" .. r.verse
				if r.verse ~= r.endVerse then
					refString = refString .. "-" .. r.endVerse
				end
			end
		end
	end

	if refString == "" then return STRING_UTIL:capitalize(bookName)
	else                    return STRING_UTIL:capitalize(bookName) .. " " .. refString end
end
