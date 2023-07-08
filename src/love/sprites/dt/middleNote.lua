return graphics.newSprite(
	images.notesMiddle,
	{
        {x = 5, y = 5, width = 98, height = 45, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: spacebar hold piece0000
		{x = 5, y = 5, width = 98, height = 45, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: spacebar hold piece0001
		{x = 5, y = 5, width = 98, height = 45, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: spacebar hold piece0002
		{x = 5, y = 5, width = 98, height = 45, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: spacebar hold piece0003
		{x = 5, y = 5, width = 98, height = 45, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: spacebar hold piece0004
		{x = 108, y = 5, width = 357, height = 83, offsetX = -75, offsetY = -26, offsetWidth = 497, offsetHeight = 115}, -- 6: spacebar0000
		{x = 470, y = 5, width = 361, height = 109, offsetX = -75, offsetY = 0, offsetWidth = 497, offsetHeight = 115}, -- 7: spacebar0001
		{x = 470, y = 5, width = 361, height = 109, offsetX = -75, offsetY = 0, offsetWidth = 497, offsetHeight = 115}, -- 8: spacebar0002
		{x = 5, y = 119, width = 360, height = 98, offsetX = -72, offsetY = -11, offsetWidth = 497, offsetHeight = 115}, -- 9: spacebar0003
		{x = 5, y = 119, width = 360, height = 98, offsetX = -72, offsetY = -11, offsetWidth = 497, offsetHeight = 115}, -- 10: spacebar0004
		{x = 714, y = 448, width = 98, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 11: spacebar hold end0000
		{x = 714, y = 448, width = 98, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 12: spacebar hold end0001
		{x = 714, y = 448, width = 98, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 13: spacebar hold end0002
		{x = 714, y = 448, width = 98, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 14: spacebar hold end0003
		{x = 714, y = 448, width = 98, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 15: spacebar hold end0004
    },
    {
        ["hold"] = {start = 1, stop = 5, speed = 24, offsetX = 0, offsetY = 0},
        ["on"] = {start = 6, stop = 10, speed = 0, offsetX = 0, offsetY = 0},
        ["end"] = {start = 11, stop = 15, speed = 24, offsetX = 0, offsetY = 0}
    },
    "on",
    false
)