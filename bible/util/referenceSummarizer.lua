capitalizeBookName = function(bookName)
	return string.upper(string.sub(bookName, 1, 1)) .. string.sub(bookName, 2)
end

summarizeReference = function(bookName, verses)
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

	local refString = ""
	for _, r in ipairs(ranges) do
		if refString ~= "" then
			refString = refString .. ","
		end
		refString = refString .. r.chapter .. ":" .. r.verse
		if r.verse ~= r.endVerse then
			refString = refString .. "-" .. r.endVerse
		end
	end

	return capitalizeBookName(bookName) .. " " .. refString
end
