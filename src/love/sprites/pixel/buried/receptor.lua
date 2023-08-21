return graphics.newSprite(
    images.notesp,
    {
        {x = 33, y = 1, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Down Arrow
        {x = 33, y = 65, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Down Arrow Press
		{x = 33, y = 97, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Down Arrow Confirm 1
		{x = 33, y = 129, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Down Arrow Confirm 2

        {x = 1, y = 1, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Left Arrow
        {x = 1, y = 65, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Left Arrow Press
		{x = 1, y = 97, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: Left Arrow Confirm 1
		{x = 1, y = 129, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 8: Left Arrow Confirm 2

        {x = 65, y = 1, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: Up Arrow
        {x = 65, y = 65, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 10: Up Arrow Press
		{x = 65, y = 97, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 11: Up Arrow Confirm 1
		{x = 65, y = 129, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 12: Up Arrow Confirm 2

        {x = 97, y = 1, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 13: Right Arrow
        {x = 97, y = 65, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 14: Left Arrow Press
		{x = 97, y = 97, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 15: Left Arrow Confirm 1
		{x = 97, y = 129, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 16: Left Arrow Confirm 2
    },
    {
        -- Pressed
        ["left press"] = { start = 6, stop = 6, speed = 24, offsetX = 0, offsetY = 0 },
        ["down press"] = { start = 2, stop = 2, speed = 24, offsetX = 0, offsetY = 0 },
        ["up press"] = { start = 10, stop = 10, speed = 24, offsetX = 0, offsetY = 0 },
        ["right press"] = { start = 14, stop = 14, speed = 24, offsetX = 0, offsetY = 0 },
        -- Static
        ["left"] = { start = 5, stop = 5, speed = 0, offsetX = 0, offsetY = 0 },
        ["down"] = { start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0 },
        ["up"] = { start = 9, stop = 9, speed = 0, offsetX = 0, offsetY = 0 },
        ["right"] = { start = 13, stop = 13, speed = 0, offsetX = 0, offsetY = 0 },
        -- Confirms
        ["left confirm"] = { start = 7, stop = 8, speed = 24, offsetX = 0, offsetY = 0 },
        ["down confirm"] = { start = 3, stop = 4, speed = 24, offsetX = 0, offsetY = 0 },
        ["up confirm"] = { start = 11, stop = 12, speed = 24, offsetX = 0, offsetY = 0 },
        ["right confirm"] = { start = 15, stop = 16, speed = 24, offsetX = 0, offsetY = 0 },
    },
    "left",
    false
)
