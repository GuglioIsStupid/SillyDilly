--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

Copyright (C) 2021  HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]

return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("dissension/alt_steven_pov")),
	-- Automatically generated from alt_steven_pov.xml
	{
		{x = 5, y = 5, width = 384, height = 336, offsetX = 0, offsetY = -7, offsetWidth = 384, offsetHeight = 343}, -- 1: down0000
		{x = 399, y = 5, width = 384, height = 336, offsetX = 0, offsetY = -7, offsetWidth = 384, offsetHeight = 343}, -- 2: down0001
		{x = 793, y = 5, width = 384, height = 338, offsetX = 0, offsetY = -5, offsetWidth = 384, offsetHeight = 343}, -- 3: down0002
		{x = 1187, y = 5, width = 384, height = 338, offsetX = 0, offsetY = -5, offsetWidth = 384, offsetHeight = 343}, -- 4: down0003
		{x = 1581, y = 5, width = 384, height = 341, offsetX = 0, offsetY = -2, offsetWidth = 384, offsetHeight = 343}, -- 5: down0004
		{x = 1975, y = 5, width = 384, height = 341, offsetX = 0, offsetY = -2, offsetWidth = 384, offsetHeight = 343}, -- 6: down0005
		{x = 2369, y = 5, width = 384, height = 342, offsetX = 0, offsetY = -1, offsetWidth = 384, offsetHeight = 343}, -- 7: down0006
		{x = 2763, y = 5, width = 384, height = 342, offsetX = 0, offsetY = -1, offsetWidth = 384, offsetHeight = 343}, -- 8: down0007
		{x = 3157, y = 5, width = 384, height = 343, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: down0008
		{x = 3551, y = 5, width = 384, height = 343, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 10: down0009
		{x = 5, y = 358, width = 384, height = 343, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 11: down0010
		{x = 399, y = 358, width = 384, height = 343, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 12: down0011

		{x = 793, y = 358, width = 384, height = 367, offsetX = 0, offsetY = -9, offsetWidth = 384, offsetHeight = 376}, -- 13: idle0000
		{x = 1187, y = 358, width = 384, height = 367, offsetX = 0, offsetY = -9, offsetWidth = 384, offsetHeight = 376}, -- 14: idle0001
		{x = 1581, y = 358, width = 384, height = 367, offsetX = 0, offsetY = -9, offsetWidth = 384, offsetHeight = 376}, -- 15: idle0002
		{x = 1975, y = 358, width = 384, height = 365, offsetX = 0, offsetY = -11, offsetWidth = 384, offsetHeight = 376}, -- 16: idle0003
		{x = 2369, y = 358, width = 384, height = 365, offsetX = 0, offsetY = -11, offsetWidth = 384, offsetHeight = 376}, -- 17: idle0004
		{x = 2763, y = 358, width = 384, height = 365, offsetX = 0, offsetY = -11, offsetWidth = 384, offsetHeight = 376}, -- 18: idle0005
		{x = 3157, y = 358, width = 384, height = 368, offsetX = 0, offsetY = -8, offsetWidth = 384, offsetHeight = 376}, -- 19: idle0006
		{x = 3551, y = 358, width = 384, height = 368, offsetX = 0, offsetY = -8, offsetWidth = 384, offsetHeight = 376}, -- 20: idle0007
		{x = 5, y = 736, width = 384, height = 368, offsetX = 0, offsetY = -8, offsetWidth = 384, offsetHeight = 376}, -- 21: idle0008
		{x = 399, y = 736, width = 384, height = 375, offsetX = 0, offsetY = -1, offsetWidth = 384, offsetHeight = 376}, -- 22: idle0009
		{x = 793, y = 736, width = 384, height = 375, offsetX = 0, offsetY = -1, offsetWidth = 384, offsetHeight = 376}, -- 23: idle0010
		{x = 1187, y = 736, width = 384, height = 375, offsetX = 0, offsetY = -1, offsetWidth = 384, offsetHeight = 376}, -- 24: idle0011
		{x = 1581, y = 736, width = 384, height = 375, offsetX = 0, offsetY = -1, offsetWidth = 384, offsetHeight = 376}, -- 25: idle0012
		{x = 1975, y = 736, width = 384, height = 375, offsetX = 0, offsetY = -1, offsetWidth = 384, offsetHeight = 376}, -- 26: idle0013
		{x = 2369, y = 736, width = 384, height = 375, offsetX = 0, offsetY = -1, offsetWidth = 384, offsetHeight = 376}, -- 27: idle0014
		{x = 2763, y = 736, width = 384, height = 376, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 28: idle0015
		{x = 3157, y = 736, width = 384, height = 376, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 29: idle0016
		{x = 3551, y = 736, width = 384, height = 376, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 30: idle0017
		{x = 5, y = 1122, width = 384, height = 376, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 31: idle0018
		{x = 399, y = 1122, width = 384, height = 376, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 32: idle0019
		{x = 793, y = 1122, width = 384, height = 376, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 33: idle0020
		{x = 1187, y = 1122, width = 384, height = 376, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 34: idle0021

		{x = 1581, y = 1122, width = 378, height = 345, offsetX = 0, offsetY = -8, offsetWidth = 380, offsetHeight = 353}, -- 35: left0000
		{x = 1969, y = 1122, width = 378, height = 345, offsetX = 0, offsetY = -8, offsetWidth = 380, offsetHeight = 353}, -- 36: left0001
		{x = 2357, y = 1122, width = 375, height = 345, offsetX = -1, offsetY = -8, offsetWidth = 380, offsetHeight = 353}, -- 37: left0002
		{x = 2742, y = 1122, width = 375, height = 345, offsetX = -1, offsetY = -8, offsetWidth = 380, offsetHeight = 353}, -- 38: left0003
		{x = 3127, y = 1122, width = 375, height = 352, offsetX = -4, offsetY = -1, offsetWidth = 380, offsetHeight = 353}, -- 39: left0004
		{x = 3512, y = 1122, width = 375, height = 352, offsetX = -4, offsetY = -1, offsetWidth = 380, offsetHeight = 353}, -- 40: left0005
		{x = 5, y = 1508, width = 374, height = 353, offsetX = -6, offsetY = 0, offsetWidth = 380, offsetHeight = 353}, -- 41: left0006
		{x = 389, y = 1508, width = 374, height = 353, offsetX = -6, offsetY = 0, offsetWidth = 380, offsetHeight = 353}, -- 42: left0007
		{x = 773, y = 1508, width = 374, height = 353, offsetX = -6, offsetY = 0, offsetWidth = 380, offsetHeight = 353}, -- 43: left0008
		{x = 1157, y = 1508, width = 374, height = 353, offsetX = -6, offsetY = 0, offsetWidth = 380, offsetHeight = 353}, -- 44: left0009
		{x = 1541, y = 1508, width = 374, height = 353, offsetX = -6, offsetY = 0, offsetWidth = 380, offsetHeight = 353}, -- 45: left0010
		{x = 1925, y = 1508, width = 374, height = 353, offsetX = -6, offsetY = 0, offsetWidth = 380, offsetHeight = 353}, -- 46: left0011

		{x = 2309, y = 1508, width = 380, height = 401, offsetX = -10, offsetY = -4, offsetWidth = 392, offsetHeight = 405}, -- 47: right0000
		{x = 2699, y = 1508, width = 380, height = 401, offsetX = -10, offsetY = -4, offsetWidth = 392, offsetHeight = 405}, -- 48: right0001
		{x = 3089, y = 1508, width = 378, height = 402, offsetX = -14, offsetY = -3, offsetWidth = 392, offsetHeight = 405}, -- 49: right0002
		{x = 3477, y = 1508, width = 378, height = 402, offsetX = -14, offsetY = -3, offsetWidth = 392, offsetHeight = 405}, -- 50: right0003
		{x = 5, y = 1920, width = 380, height = 404, offsetX = -3, offsetY = -1, offsetWidth = 392, offsetHeight = 405}, -- 51: right0004
		{x = 395, y = 1920, width = 380, height = 404, offsetX = -3, offsetY = -1, offsetWidth = 392, offsetHeight = 405}, -- 52: right0005
		{x = 785, y = 1920, width = 381, height = 405, offsetX = 0, offsetY = 0, offsetWidth = 392, offsetHeight = 405}, -- 53: right0006
		{x = 1176, y = 1920, width = 381, height = 405, offsetX = 0, offsetY = 0, offsetWidth = 392, offsetHeight = 405}, -- 54: right0007
		{x = 1567, y = 1920, width = 381, height = 405, offsetX = -1, offsetY = 0, offsetWidth = 392, offsetHeight = 405}, -- 55: right0008
		{x = 1958, y = 1920, width = 381, height = 405, offsetX = -1, offsetY = 0, offsetWidth = 392, offsetHeight = 405}, -- 56: right0009
		{x = 2349, y = 1920, width = 381, height = 405, offsetX = -1, offsetY = 0, offsetWidth = 392, offsetHeight = 405}, -- 57: right0010
		{x = 2740, y = 1920, width = 381, height = 405, offsetX = -1, offsetY = 0, offsetWidth = 392, offsetHeight = 405}, -- 58: right0011
		{x = 3131, y = 1920, width = 381, height = 405, offsetX = -1, offsetY = 0, offsetWidth = 392, offsetHeight = 405}, -- 59: right0012
		{x = 3522, y = 1920, width = 381, height = 405, offsetX = -1, offsetY = 0, offsetWidth = 392, offsetHeight = 405}, -- 60: right0013

		{x = 5, y = 2335, width = 384, height = 418, offsetX = -5, offsetY = 0, offsetWidth = 391, offsetHeight = 418}, -- 61: up0000
		{x = 399, y = 2335, width = 384, height = 418, offsetX = -5, offsetY = 0, offsetWidth = 391, offsetHeight = 418}, -- 62: up0001
		{x = 793, y = 2335, width = 384, height = 416, offsetX = -7, offsetY = -2, offsetWidth = 391, offsetHeight = 418}, -- 63: up0002
		{x = 1187, y = 2335, width = 384, height = 416, offsetX = -7, offsetY = -2, offsetWidth = 391, offsetHeight = 418}, -- 64: up0003
		{x = 1581, y = 2335, width = 384, height = 413, offsetX = -2, offsetY = -5, offsetWidth = 391, offsetHeight = 418}, -- 65: up0004
		{x = 1975, y = 2335, width = 384, height = 413, offsetX = -2, offsetY = -5, offsetWidth = 391, offsetHeight = 418}, -- 66: up0005
		{x = 2369, y = 2335, width = 384, height = 412, offsetX = 0, offsetY = -6, offsetWidth = 391, offsetHeight = 418}, -- 67: up0006
		{x = 2763, y = 2335, width = 384, height = 412, offsetX = 0, offsetY = -6, offsetWidth = 391, offsetHeight = 418}, -- 68: up0007
		{x = 3157, y = 2335, width = 383, height = 411, offsetX = -2, offsetY = -7, offsetWidth = 391, offsetHeight = 418}, -- 69: up0008
		{x = 3550, y = 2335, width = 383, height = 411, offsetX = -2, offsetY = -7, offsetWidth = 391, offsetHeight = 418}, -- 70: up0009
		{x = 5, y = 2763, width = 383, height = 411, offsetX = -2, offsetY = -7, offsetWidth = 391, offsetHeight = 418}, -- 71: up0010
		{x = 398, y = 2763, width = 383, height = 411, offsetX = -2, offsetY = -7, offsetWidth = 391, offsetHeight = 418}, -- 72: up0011
		{x = 791, y = 2763, width = 383, height = 411, offsetX = -2, offsetY = -7, offsetWidth = 391, offsetHeight = 418}, -- 73: up0012
		{x = 1184, y = 2763, width = 383, height = 411, offsetX = -2, offsetY = -7, offsetWidth = 391, offsetHeight = 418} -- 74: up0013
	},

	{
		["singDOWN"] = {start = 1, stop = 34, speed = 24, offsetX = 0, offsetY = 0},
		["singLEFT"] = {start = 35, stop = 46, speed = 24, offsetX = 0, offsetY = 0},
		["singRIGHT"] = {start = 47, stop = 60, speed = 24, offsetX = 0, offsetY = 0},
		["singUP"] = {start = 61, stop = 74, speed = 24, offsetX = 0, offsetY = 0},
		["idle"] = {start = 13, stop = 34, speed = 24, offsetX = 0, offsetY = 0},
	},
	"idle",
	false,
	{
		sing_duration = 6.1,   -- wtf do i put here
		isCharacter = true,
	}
)
