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
	love.graphics.newImage(graphics.imagePath("amusia/The_death_stare")),
	-- Automatically generated from The_death_stare.xml
	{
		{x = 0, y = 0, width = 235, height = 358, offsetX = 0, offsetY = 0, offsetWidth = 246, offsetHeight = 358}, -- 1: idle0000
		{x = 0, y = 0, width = 235, height = 358, offsetX = 0, offsetY = 0, offsetWidth = 246, offsetHeight = 358}, -- 2: idle0001
		{x = 235, y = 0, width = 228, height = 355, offsetX = -12, offsetY = -3, offsetWidth = 246, offsetHeight = 358}, -- 3: idle0002
		{x = 235, y = 0, width = 228, height = 355, offsetX = -12, offsetY = -3, offsetWidth = 246, offsetHeight = 358}, -- 4: idle0003
		{x = 463, y = 0, width = 229, height = 357, offsetX = -14, offsetY = -1, offsetWidth = 246, offsetHeight = 358}, -- 5: idle0004
		{x = 463, y = 0, width = 229, height = 357, offsetX = -14, offsetY = -1, offsetWidth = 246, offsetHeight = 358}, -- 6: idle0005
		{x = 692, y = 0, width = 227, height = 357, offsetX = -17, offsetY = -1, offsetWidth = 246, offsetHeight = 358}, -- 7: idle0006
		{x = 692, y = 0, width = 227, height = 357, offsetX = -17, offsetY = -1, offsetWidth = 246, offsetHeight = 358}, -- 8: idle0007
		{x = 919, y = 0, width = 225, height = 357, offsetX = -17, offsetY = -1, offsetWidth = 246, offsetHeight = 358}, -- 9: idle0008
		{x = 919, y = 0, width = 225, height = 357, offsetX = -17, offsetY = -1, offsetWidth = 246, offsetHeight = 358}, -- 10: idle0009
		{x = 1144, y = 0, width = 226, height = 357, offsetX = -17, offsetY = -1, offsetWidth = 246, offsetHeight = 358}, -- 11: idle0010
		{x = 1144, y = 0, width = 226, height = 357, offsetX = -17, offsetY = -1, offsetWidth = 246, offsetHeight = 358}, -- 12: idle0011
		{x = 1370, y = 0, width = 230, height = 357, offsetX = -16, offsetY = -1, offsetWidth = 246, offsetHeight = 358}, -- 13: idle0012
		{x = 1370, y = 0, width = 230, height = 357, offsetX = -16, offsetY = -1, offsetWidth = 246, offsetHeight = 358}, -- 14: idle0013
		{x = 1600, y = 0, width = 234, height = 357, offsetX = -10, offsetY = -1, offsetWidth = 246, offsetHeight = 358}, -- 15: idle0014

		{x = 0, y = 358, width = 358, height = 356, offsetX = 0, offsetY = -4, offsetWidth = 360, offsetHeight = 360}, -- 16: left0000
		{x = 0, y = 358, width = 358, height = 356, offsetX = 0, offsetY = -4, offsetWidth = 360, offsetHeight = 360}, -- 17: left0001
		{x = 358, y = 358, width = 350, height = 356, offsetX = -2, offsetY = -4, offsetWidth = 360, offsetHeight = 360}, -- 18: left0002
		{x = 358, y = 358, width = 350, height = 356, offsetX = -2, offsetY = -4, offsetWidth = 360, offsetHeight = 360}, -- 19: left0003
		{x = 708, y = 358, width = 314, height = 360, offsetX = -43, offsetY = 0, offsetWidth = 360, offsetHeight = 360}, -- 20: left0004
		{x = 708, y = 358, width = 314, height = 360, offsetX = -43, offsetY = 0, offsetWidth = 360, offsetHeight = 360}, -- 21: left0005
		{x = 1022, y = 358, width = 313, height = 359, offsetX = -47, offsetY = -1, offsetWidth = 360, offsetHeight = 360}, -- 22: left0006
		{x = 1022, y = 358, width = 313, height = 359, offsetX = -47, offsetY = -1, offsetWidth = 360, offsetHeight = 360}, -- 23: left0007
		{x = 1335, y = 358, width = 315, height = 359, offsetX = -45, offsetY = -1, offsetWidth = 360, offsetHeight = 360}, -- 24: left0008
		{x = 1335, y = 358, width = 315, height = 359, offsetX = -45, offsetY = -1, offsetWidth = 360, offsetHeight = 360}, -- 25: left0009
		{x = 1650, y = 358, width = 315, height = 359, offsetX = -45, offsetY = -1, offsetWidth = 360, offsetHeight = 360}, -- 26: left0010
		{x = 1650, y = 358, width = 315, height = 359, offsetX = -45, offsetY = -1, offsetWidth = 360, offsetHeight = 360}, -- 27: left0011
		{x = 1335, y = 358, width = 315, height = 359, offsetX = -45, offsetY = -1, offsetWidth = 360, offsetHeight = 360}, -- 28: left0012
		{x = 1335, y = 358, width = 315, height = 359, offsetX = -45, offsetY = -1, offsetWidth = 360, offsetHeight = 360}, -- 29: left0013
		{x = 0, y = 718, width = 315, height = 359, offsetX = -45, offsetY = -1, offsetWidth = 360, offsetHeight = 360}, -- 30: left0014

		{x = 315, y = 718, width = 284, height = 357, offsetX = -7, offsetY = -1, offsetWidth = 291, offsetHeight = 358}, -- 31: right0000
		{x = 315, y = 718, width = 284, height = 357, offsetX = -7, offsetY = -1, offsetWidth = 291, offsetHeight = 358}, -- 32: right0001
		{x = 599, y = 718, width = 279, height = 358, offsetX = -4, offsetY = 0, offsetWidth = 291, offsetHeight = 358}, -- 33: right0002
		{x = 599, y = 718, width = 279, height = 358, offsetX = -4, offsetY = 0, offsetWidth = 291, offsetHeight = 358}, -- 34: right0003
		{x = 878, y = 718, width = 245, height = 345, offsetX = 0, offsetY = -13, offsetWidth = 291, offsetHeight = 358}, -- 35: right0004
		{x = 878, y = 718, width = 245, height = 345, offsetX = 0, offsetY = -13, offsetWidth = 291, offsetHeight = 358}, -- 36: right0005
		{x = 1123, y = 718, width = 237, height = 347, offsetX = -1, offsetY = -11, offsetWidth = 291, offsetHeight = 358}, -- 37: right0006
		{x = 1123, y = 718, width = 237, height = 347, offsetX = -1, offsetY = -11, offsetWidth = 291, offsetHeight = 358}, -- 38: right0007
		{x = 1360, y = 718, width = 237, height = 347, offsetX = -1, offsetY = -11, offsetWidth = 291, offsetHeight = 358}, -- 39: right0008
		{x = 1360, y = 718, width = 237, height = 347, offsetX = -1, offsetY = -11, offsetWidth = 291, offsetHeight = 358}, -- 40: right0009
		{x = 1123, y = 718, width = 237, height = 347, offsetX = -1, offsetY = -11, offsetWidth = 291, offsetHeight = 358}, -- 41: right0010
		{x = 1123, y = 718, width = 237, height = 347, offsetX = -1, offsetY = -11, offsetWidth = 291, offsetHeight = 358}, -- 42: right0011
		{x = 1360, y = 718, width = 237, height = 347, offsetX = -1, offsetY = -11, offsetWidth = 291, offsetHeight = 358}, -- 43: right0012
		{x = 1360, y = 718, width = 237, height = 347, offsetX = -1, offsetY = -11, offsetWidth = 291, offsetHeight = 358}, -- 44: right0013
		{x = 1123, y = 718, width = 237, height = 347, offsetX = -1, offsetY = -11, offsetWidth = 291, offsetHeight = 358}, -- 45: right0014

		{x = 1597, y = 718, width = 244, height = 368, offsetX = -11, offsetY = 0, offsetWidth = 270, offsetHeight = 368}, -- 46: up0000
		{x = 1597, y = 718, width = 244, height = 368, offsetX = -11, offsetY = 0, offsetWidth = 270, offsetHeight = 368}, -- 47: up0001
		{x = 0, y = 1086, width = 251, height = 366, offsetX = -7, offsetY = -2, offsetWidth = 270, offsetHeight = 368}, -- 48: up0002
		{x = 0, y = 1086, width = 251, height = 366, offsetX = -7, offsetY = -2, offsetWidth = 270, offsetHeight = 368}, -- 49: up0003
		{x = 251, y = 1086, width = 264, height = 358, offsetX = -4, offsetY = -10, offsetWidth = 270, offsetHeight = 368}, -- 50: up0004
		{x = 251, y = 1086, width = 264, height = 358, offsetX = -4, offsetY = -10, offsetWidth = 270, offsetHeight = 368}, -- 51: up0005
		{x = 515, y = 1086, width = 270, height = 355, offsetX = 0, offsetY = -13, offsetWidth = 270, offsetHeight = 368}, -- 52: up0006
		{x = 515, y = 1086, width = 270, height = 355, offsetX = 0, offsetY = -13, offsetWidth = 270, offsetHeight = 368}, -- 53: up0007
		{x = 785, y = 1086, width = 270, height = 356, offsetX = 0, offsetY = -12, offsetWidth = 270, offsetHeight = 368}, -- 54: up0008
		{x = 785, y = 1086, width = 270, height = 356, offsetX = 0, offsetY = -12, offsetWidth = 270, offsetHeight = 368}, -- 55: up0009
		{x = 1055, y = 1086, width = 270, height = 355, offsetX = 0, offsetY = -13, offsetWidth = 270, offsetHeight = 368}, -- 56: up0010
		{x = 1055, y = 1086, width = 270, height = 355, offsetX = 0, offsetY = -13, offsetWidth = 270, offsetHeight = 368}, -- 57: up0011
		{x = 785, y = 1086, width = 270, height = 356, offsetX = 0, offsetY = -12, offsetWidth = 270, offsetHeight = 368}, -- 58: up0012
		{x = 785, y = 1086, width = 270, height = 356, offsetX = 0, offsetY = -12, offsetWidth = 270, offsetHeight = 368}, -- 59: up0013
		{x = 1055, y = 1086, width = 270, height = 355, offsetX = 0, offsetY = -13, offsetWidth = 270, offsetHeight = 368}, -- 60: up0014

		{x = 1325, y = 1086, width = 297, height = 288, offsetX = 0, offsetY = -17, offsetWidth = 297, offsetHeight = 305}, -- 61: down0000
		{x = 1325, y = 1086, width = 297, height = 288, offsetX = 0, offsetY = -17, offsetWidth = 297, offsetHeight = 305}, -- 62: down0001
		{x = 1622, y = 1086, width = 294, height = 286, offsetX = -2, offsetY = -19, offsetWidth = 297, offsetHeight = 305}, -- 63: down0002
		{x = 1622, y = 1086, width = 294, height = 286, offsetX = -2, offsetY = -19, offsetWidth = 297, offsetHeight = 305}, -- 64: down0003
		{x = 0, y = 1452, width = 280, height = 302, offsetX = -5, offsetY = -3, offsetWidth = 297, offsetHeight = 305}, -- 65: down0004
		{x = 0, y = 1452, width = 280, height = 302, offsetX = -5, offsetY = -3, offsetWidth = 297, offsetHeight = 305}, -- 66: down0005
		{x = 280, y = 1452, width = 274, height = 305, offsetX = -7, offsetY = 0, offsetWidth = 297, offsetHeight = 305}, -- 67: down0006
		{x = 280, y = 1452, width = 274, height = 305, offsetX = -7, offsetY = 0, offsetWidth = 297, offsetHeight = 305}, -- 68: down0007
		{x = 554, y = 1452, width = 274, height = 305, offsetX = -7, offsetY = 0, offsetWidth = 297, offsetHeight = 305}, -- 69: down0008
		{x = 554, y = 1452, width = 274, height = 305, offsetX = -7, offsetY = 0, offsetWidth = 297, offsetHeight = 305}, -- 70: down0009
		{x = 280, y = 1452, width = 274, height = 305, offsetX = -7, offsetY = 0, offsetWidth = 297, offsetHeight = 305}, -- 71: down0010
		{x = 280, y = 1452, width = 274, height = 305, offsetX = -7, offsetY = 0, offsetWidth = 297, offsetHeight = 305}, -- 72: down0011
		{x = 554, y = 1452, width = 274, height = 305, offsetX = -7, offsetY = 0, offsetWidth = 297, offsetHeight = 305}, -- 73: down0012
		{x = 554, y = 1452, width = 274, height = 305, offsetX = -7, offsetY = 0, offsetWidth = 297, offsetHeight = 305}, -- 74: down0013
		{x = 280, y = 1452, width = 274, height = 305, offsetX = -7, offsetY = 0, offsetWidth = 297, offsetHeight = 305} -- 75: down0014
	},
	{
		["0singDOWN"] = {start = 61, stop = 75, speed = 24, offsetX = -23, offsetY = -27},
		["0singLEFT"] = {start = 16, stop = 30, speed = 24, offsetX = 50, offsetY = 1},
		["0singRIGHT"] = {start = 31, stop = 45, speed = 24, offsetX = -50, offsetY = 2},
		["0singUP"] = {start = 46, stop = 60, speed = 24, offsetX = -21, offsetY = 5},
		["0idle"] = {start = 1, stop = 15, speed = 24, offsetX = 0, offsetY = 0},

		["1singDOWN"] = {start = 61, stop = 75, speed = 24, offsetX = -23, offsetY = -27},
		["1singLEFT"] = {start = 16, stop = 30, speed = 24, offsetX = 50, offsetY = 1},
		["1singRIGHT"] = {start = 31, stop = 45, speed = 24, offsetX = -50, offsetY = 2},
		["1singUP"] = {start = 46, stop = 60, speed = 24, offsetX = -21, offsetY = 5},
		["1idle"] = {start = 1, stop = 15, speed = 24, offsetX = 0, offsetY = 0},

		["2singDOWN"] = {start = 61, stop = 75, speed = 24, offsetX = -23, offsetY = -27},
		["2singLEFT"] = {start = 16, stop = 30, speed = 24, offsetX = 50, offsetY = 1},
		["2singRIGHT"] = {start = 31, stop = 45, speed = 24, offsetX = -50, offsetY = 2},
		["2singUP"] = {start = 46, stop = 60, speed = 24, offsetX = -21, offsetY = 5},
		["2idle"] = {start = 1, stop = 15, speed = 24, offsetX = 0, offsetY = 0},

		["3singDOWN"] = {start = 61, stop = 75, speed = 24, offsetX = -23, offsetY = -27},
		["3singLEFT"] = {start = 16, stop = 30, speed = 24, offsetX = 50, offsetY = 1},
		["3singRIGHT"] = {start = 31, stop = 45, speed = 24, offsetX = -50, offsetY = 2},
		["3singUP"] = {start = 46, stop = 60, speed = 24, offsetX = -21, offsetY = 5},
		["3idle"] = {start = 1, stop = 15, speed = 24, offsetX = 0, offsetY = 0},
	},
	"1idle",
	false,
	{
		sing_duration = 6.1,   -- wtf do i put here
		isCharacter = true,
	}
)
