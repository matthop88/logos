BOOK_FINDER    = require("bible/navigator/bookFinder")
CHAPTER_FINDER = require("bible/navigator/chapterFinder")

--[[
Given: 

local passageInfo = {
	{	
		book = "Ephesians",
		start  = {
			chapter = 1,
			verse   = 3,
		},
		finish = {
			chapter = 2,
			verse   = 4,
		},
	},
	{	
		book = "Ephesians",
		start  = {
			chapter = 3,
			verse   = 1,
		},
		finish = {
			chapter = 3,
			verse   = 2,
		},
	},
}

BIBLE_NAVIGATOR:find(passageInfo)

Returns:

{
	found = {
		{	book = "Ephesians",
			chapters = {
				{	chapter = 1,
					verses = {
						{	verse = 3,
							"Blessed be the God and Father of our Lord Jesus Christ,",
	                    	"who has blessed us with every spiritual blessing in the heavenly places in Christ,",   
						},
						{	verse = 4,
							...
						},
						...,
					},
				},
				{	chapter = 2,
					verses = {
						{	verse = 1,
							...,
						},
						...,
						{	verse = 4,
							...
						},
					},
				},
			},
		},
		{	book = "Ephesians",
			chapters = {
				{	chapter = 3,
					verses = {
						{	verse = 1,
							...,
						},
						{	verse = 2,
							...,
						},
					},
				},
			},
		},
	},
	missing = {},
}

--]]

return {
	find = function(self, passageInfo)
		local found   = {}
		local missing = {}
		
		for _, p in ipairs(passageInfo) do
			local f, m = self:findPassage(p)
			if f ~= nil then table.insert(found, f)   end
			if m ~= nil then table.insert(missing, m) end
		end

		return { found = found, missing = missing }
	end,

	findPassage = function(self, passage)
		local found, missing

		local bookName = passage.book
		local bookData = self:findBook(bookName)
		
		if bookData == nil then
			missing = { book = bookName }
		else
			found   = self:findChapters(bookName, bookData, passage)
		end
		
		return found, missing
	end,

	findBook = function(self, bookName)
		return BOOK_FINDER:findBook(bookName)
	end,

	findChapters = function(self, bookName, bookData, passage)
		local chapters = {}
		table.insert(chapters, self:findChapter(bookData, passage.start.chapter))

		return { book = bookName, chapters = chapters }
	end,

	findChapter = function(self, bookData, chapterNum)
		local chapterData = CHAPTER_FINDER:findChapter(bookData, chapterNum)

		if chapterData == nil then
			return { chapter = nil }
		else
			return { chapter = chapterNum }
		end
	end,
}
