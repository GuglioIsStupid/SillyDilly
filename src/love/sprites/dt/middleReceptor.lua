return graphics.newSprite(
	images.notesMiddle,
	{
		{x = 108, y = 5, width = 357, height = 83, offsetX = -75, offsetY = -26, offsetWidth = 497, offsetHeight = 115}, -- 1: spacebar0000
		{x = 470, y = 5, width = 361, height = 109, offsetX = -75, offsetY = 0, offsetWidth = 497, offsetHeight = 115}, -- 2: spacebar0001
		{x = 470, y = 5, width = 361, height = 109, offsetX = -75, offsetY = 0, offsetWidth = 497, offsetHeight = 115}, -- 3: spacebar0002
		{x = 5, y = 119, width = 360, height = 98, offsetX = -72, offsetY = -11, offsetWidth = 497, offsetHeight = 115}, -- 4: spacebar0003
		{x = 5, y = 119, width = 360, height = 98, offsetX = -72, offsetY = -11, offsetWidth = 497, offsetHeight = 115}, -- 5: spacebar0004
		{x = 370, y = 119, width = 497, height = 64, offsetX = 0, offsetY = -51, offsetWidth = 497, offsetHeight = 115}, -- 6: spacebar confirm0000
		{x = 5, y = 222, width = 476, height = 64, offsetX = -13, offsetY = -51, offsetWidth = 497, offsetHeight = 115}, -- 7: spacebar confirm0001
		{x = 486, y = 222, width = 417, height = 68, offsetX = -41, offsetY = -47, offsetWidth = 497, offsetHeight = 115}, -- 8: spacebar confirm0002
		{x = 5, y = 295, width = 391, height = 73, offsetX = -55, offsetY = -42, offsetWidth = 497, offsetHeight = 115}, -- 9: spacebar confirm0003
		{x = 401, y = 295, width = 353, height = 88, offsetX = -77, offsetY = -23, offsetWidth = 497, offsetHeight = 115}, -- 10: spacebar confirm0004
		{x = 5, y = 388, width = 398, height = 52, offsetX = -56, offsetY = -60, offsetWidth = 497, offsetHeight = 115}, -- 11: spacebar press0000
		{x = 5, y = 388, width = 398, height = 52, offsetX = -56, offsetY = -60, offsetWidth = 497, offsetHeight = 115}, -- 12: spacebar press0001
		{x = 408, y = 388, width = 380, height = 55, offsetX = -64, offsetY = -57, offsetWidth = 497, offsetHeight = 115}, -- 13: spacebar press0002
		{x = 5, y = 448, width = 345, height = 72, offsetX = -79, offsetY = -40, offsetWidth = 497, offsetHeight = 115}, -- 14: spacebar press0003
		{x = 355, y = 448, width = 354, height = 58, offsetX = -74, offsetY = -54, offsetWidth = 497, offsetHeight = 115}, -- 15: spacebar press0004
		{x = 355, y = 448, width = 354, height = 58, offsetX = -74, offsetY = -54, offsetWidth = 497, offsetHeight = 115}, -- 16: spacebar press0005
		{x = 355, y = 448, width = 354, height = 58, offsetX = -74, offsetY = -54, offsetWidth = 497, offsetHeight = 115}, -- 17: spacebar press0006
		{x = 355, y = 448, width = 354, height = 58, offsetX = -74, offsetY = -54, offsetWidth = 497, offsetHeight = 115}, -- 18: spacebar press0007
    },

    {
        ["middle press"] = {start = 11, stop = 18, speed = 24, offsetX = 0, offsetY = 0},
        ["middle"] = {start = 1, stop = 5, speed = 0, offsetX = 0, offsetY = 0},
        ["middle confirm"] = {start = 6, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
    },
    "middle",
    false
)