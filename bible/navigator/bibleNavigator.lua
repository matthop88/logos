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
		return nil
	end,
}
