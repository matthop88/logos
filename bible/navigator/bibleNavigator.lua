--[[
Goal: Can access this in the following way:

BIBLE_NAVIGATOR:query()
	:book("Ephesians")
	:chapter(1)
	:verse(3)
	:through()
	:chapter(2)
	:verse(4)
	:and()
	:chapter(3)
	:verse(1)
	:through()
	:verse(2)
	:fetch()

Stage 1: Very simple.

BIBLE_NAVIGATOR:query()
	:book("Ephesians")
	:chapter(1)
	:verse(3)
	:fetch()

Returns:

{
	found = {
		{
			book = "Ephesians",
			chapters = {
				chapter = 1,
				verses = {
					verse = 3,
					"Blessed be the God and Father of our Lord Jesus Christ,",
                    "who has blessed us with every spiritual blessing in the heavenly places in Christ,",   
				},
			},
		},
	},
	missing = {},
}

--]]
