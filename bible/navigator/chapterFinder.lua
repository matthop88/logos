return {
	findChapter = function(self, bookData, chapterNum)
		for _, c in ipairs(bookData.chapters) do
			if c.chapter == chapterNum then
				return c.chapter
			end
		end
	end,
}
