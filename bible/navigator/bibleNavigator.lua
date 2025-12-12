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
		local resultData = self:findPassageIntern(passage)

		if resultData.chapters == nil then
			return { found = nil, missing = { book = resultData.book }}
		else
			return { found = resultData, missing = {} }
		end
	end,

	findPassageIntern = function(self, passage)
		local bookName = passage.book
		local bookData = self:findBook(bookName)
		
		if bookData == nil then
			return { book = bookName, chapters = nil }
		else
			return { book = bookName, chapters = self:findChapters(bookData, passage) }
		end
	end,

	findBook = function(self, bookName)
		return BOOK_FINDER:findBook(bookName)
	end,

	findChapters = function(self, bookData, passage)
		local chapterNum  = passage.start.chapter
		local chapterData = self:findChapter(bookData, chapterNum)

		if chapterData == nil then
			return nil
		else 
			return { chapter = chapterNum, verses = self:findVerses(chapterData, passage) }
		end
	end,

	findChapter = function(self, bookData, chapterNum)
		return CHAPTER_FINDER:findChapter(bookData, chapterNum)
	end,

	findVerses = function(self, chapterData, passage)
		return nil
	end,
}
