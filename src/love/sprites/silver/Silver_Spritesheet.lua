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
	love.graphics.newImage(graphics.imagePath("silver/Silver_Spritesheet")),
	-- Automatically generated from Silver_Spritesheet.xml
	{
		{x = 5, y = 5, width = 367, height = 483, offsetX = 0, offsetY = -18, offsetWidth = 367, offsetHeight = 501}, -- 1: Silver Down0000
		{x = 377, y = 5, width = 360, height = 488, offsetX = -3, offsetY = -13, offsetWidth = 367, offsetHeight = 501}, -- 2: Silver Down0001
		{x = 742, y = 5, width = 360, height = 488, offsetX = -3, offsetY = -13, offsetWidth = 367, offsetHeight = 501}, -- 3: Silver Down0002
		{x = 1107, y = 5, width = 358, height = 495, offsetX = -3, offsetY = -6, offsetWidth = 367, offsetHeight = 501}, -- 4: Silver Down0003
		{x = 1470, y = 5, width = 358, height = 495, offsetX = -3, offsetY = -6, offsetWidth = 367, offsetHeight = 501}, -- 5: Silver Down0004
		{x = 1833, y = 5, width = 357, height = 499, offsetX = -4, offsetY = -2, offsetWidth = 367, offsetHeight = 501}, -- 6: Silver Down0005
		{x = 2195, y = 5, width = 357, height = 499, offsetX = -4, offsetY = -2, offsetWidth = 367, offsetHeight = 501}, -- 7: Silver Down0006
		{x = 2557, y = 5, width = 358, height = 500, offsetX = -3, offsetY = -1, offsetWidth = 367, offsetHeight = 501}, -- 8: Silver Down0007
		{x = 2920, y = 5, width = 358, height = 500, offsetX = -3, offsetY = -1, offsetWidth = 367, offsetHeight = 501}, -- 9: Silver Down0008
		{x = 3283, y = 5, width = 358, height = 501, offsetX = -3, offsetY = 0, offsetWidth = 367, offsetHeight = 501}, -- 10: Silver Down0009
		{x = 3646, y = 5, width = 358, height = 501, offsetX = -3, offsetY = 0, offsetWidth = 367, offsetHeight = 501}, -- 11: Silver Down0010
		{x = 5, y = 511, width = 358, height = 501, offsetX = -3, offsetY = 0, offsetWidth = 367, offsetHeight = 501}, -- 12: Silver Down0011
		{x = 368, y = 511, width = 358, height = 501, offsetX = -3, offsetY = 0, offsetWidth = 367, offsetHeight = 501}, -- 13: Silver Down0012
		{x = 731, y = 511, width = 358, height = 501, offsetX = -3, offsetY = 0, offsetWidth = 367, offsetHeight = 501}, -- 14: Silver Down0013
		{x = 1094, y = 511, width = 358, height = 501, offsetX = -3, offsetY = 0, offsetWidth = 367, offsetHeight = 501}, -- 15: Silver Down0014
		{x = 1457, y = 511, width = 358, height = 501, offsetX = -3, offsetY = 0, offsetWidth = 367, offsetHeight = 501}, -- 16: Silver Down0015
		{x = 1820, y = 511, width = 358, height = 501, offsetX = -3, offsetY = 0, offsetWidth = 367, offsetHeight = 501}, -- 17: Silver Down0016
		{x = 3283, y = 5, width = 358, height = 501, offsetX = -3, offsetY = 0, offsetWidth = 367, offsetHeight = 501}, -- 18: Silver Down0017
		{x = 3646, y = 5, width = 358, height = 501, offsetX = -3, offsetY = 0, offsetWidth = 367, offsetHeight = 501}, -- 19: Silver Down0018

		{x = 2183, y = 511, width = 303, height = 586, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 20: Silver Idle0000
		{x = 2183, y = 511, width = 303, height = 586, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 21: Silver Idle0001
		{x = 2491, y = 511, width = 303, height = 586, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 22: Silver Idle0002
		{x = 2491, y = 511, width = 303, height = 586, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 23: Silver Idle0003
		{x = 2799, y = 511, width = 303, height = 586, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 24: Silver Idle0004
		{x = 2799, y = 511, width = 303, height = 586, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 25: Silver Idle0005
		{x = 3107, y = 511, width = 303, height = 586, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 26: Silver Idle0006
		{x = 3107, y = 511, width = 303, height = 586, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 27: Silver Idle0007

		{x = 3415, y = 511, width = 360, height = 525, offsetX = 0, offsetY = -9, offsetWidth = 363, offsetHeight = 534}, -- 28: Silver Left0000
		{x = 5, y = 1102, width = 359, height = 529, offsetX = -1, offsetY = -5, offsetWidth = 363, offsetHeight = 534}, -- 29: Silver Left0001
		{x = 369, y = 1102, width = 359, height = 532, offsetX = -2, offsetY = -2, offsetWidth = 363, offsetHeight = 534}, -- 30: Silver Left0002
		{x = 733, y = 1102, width = 355, height = 534, offsetX = -7, offsetY = 0, offsetWidth = 363, offsetHeight = 534}, -- 31: Silver Left0003
		{x = 1093, y = 1102, width = 355, height = 534, offsetX = -7, offsetY = 0, offsetWidth = 363, offsetHeight = 534}, -- 32: Silver Left0004
		{x = 1453, y = 1102, width = 353, height = 532, offsetX = -10, offsetY = -1, offsetWidth = 363, offsetHeight = 534}, -- 33: Silver Left0005
		{x = 1811, y = 1102, width = 354, height = 532, offsetX = -9, offsetY = -2, offsetWidth = 363, offsetHeight = 534}, -- 34: Silver Left0006
		{x = 2170, y = 1102, width = 354, height = 532, offsetX = -9, offsetY = -2, offsetWidth = 363, offsetHeight = 534}, -- 35: Silver Left0007
		{x = 2529, y = 1102, width = 356, height = 531, offsetX = -7, offsetY = -3, offsetWidth = 363, offsetHeight = 534}, -- 36: Silver Left0008
		{x = 2890, y = 1102, width = 357, height = 531, offsetX = -6, offsetY = -3, offsetWidth = 363, offsetHeight = 534}, -- 37: Silver Left0009
		{x = 3252, y = 1102, width = 357, height = 531, offsetX = -6, offsetY = -3, offsetWidth = 363, offsetHeight = 534}, -- 38: Silver Left0010
		{x = 3614, y = 1102, width = 358, height = 531, offsetX = -5, offsetY = -3, offsetWidth = 363, offsetHeight = 534}, -- 39: Silver Left0011
		{x = 5, y = 1641, width = 358, height = 530, offsetX = -5, offsetY = -3, offsetWidth = 363, offsetHeight = 534}, -- 40: Silver Left0012
		{x = 368, y = 1641, width = 357, height = 530, offsetX = -6, offsetY = -3, offsetWidth = 363, offsetHeight = 534}, -- 41: Silver Left0013
		{x = 730, y = 1641, width = 357, height = 531, offsetX = -6, offsetY = -3, offsetWidth = 363, offsetHeight = 534}, -- 42: Silver Left0014
		{x = 1092, y = 1641, width = 358, height = 531, offsetX = -5, offsetY = -3, offsetWidth = 363, offsetHeight = 534}, -- 43: Silver Left0015
		{x = 1455, y = 1641, width = 358, height = 531, offsetX = -5, offsetY = -3, offsetWidth = 363, offsetHeight = 534}, -- 44: Silver Left0016
		{x = 1818, y = 1641, width = 358, height = 531, offsetX = -5, offsetY = -3, offsetWidth = 363, offsetHeight = 534}, -- 45: Silver Left0017
		{x = 2181, y = 1641, width = 358, height = 531, offsetX = -5, offsetY = -3, offsetWidth = 363, offsetHeight = 534}, -- 46: Silver Left0018

		{x = 2544, y = 1641, width = 425, height = 525, offsetX = 0, offsetY = -7, offsetWidth = 425, offsetHeight = 532}, -- 47: Silver Right0000
		{x = 2974, y = 1641, width = 402, height = 526, offsetX = -13, offsetY = -6, offsetWidth = 425, offsetHeight = 532}, -- 48: Silver Right0001
		{x = 3381, y = 1641, width = 405, height = 526, offsetX = -11, offsetY = -6, offsetWidth = 425, offsetHeight = 532}, -- 49: Silver Right0002
		{x = 5, y = 2177, width = 386, height = 527, offsetX = -23, offsetY = -4, offsetWidth = 425, offsetHeight = 532}, -- 50: Silver Right0003
		{x = 396, y = 2177, width = 363, height = 527, offsetX = -46, offsetY = -4, offsetWidth = 425, offsetHeight = 532}, -- 51: Silver Right0004
		{x = 764, y = 2177, width = 350, height = 528, offsetX = -53, offsetY = -2, offsetWidth = 425, offsetHeight = 532}, -- 52: Silver Right0005
		{x = 1119, y = 2177, width = 350, height = 528, offsetX = -53, offsetY = -2, offsetWidth = 425, offsetHeight = 532}, -- 53: Silver Right0006
		{x = 1474, y = 2177, width = 348, height = 529, offsetX = -53, offsetY = -1, offsetWidth = 425, offsetHeight = 532}, -- 54: Silver Right0007
		{x = 1827, y = 2177, width = 348, height = 530, offsetX = -52, offsetY = 0, offsetWidth = 425, offsetHeight = 532}, -- 55: Silver Right0008
		{x = 2180, y = 2177, width = 348, height = 530, offsetX = -52, offsetY = 0, offsetWidth = 425, offsetHeight = 532}, -- 56: Silver Right0009
		{x = 2533, y = 2177, width = 347, height = 530, offsetX = -52, offsetY = 0, offsetWidth = 425, offsetHeight = 532}, -- 57: Silver Right0010
		{x = 2885, y = 2177, width = 347, height = 530, offsetX = -52, offsetY = 0, offsetWidth = 425, offsetHeight = 532}, -- 58: Silver Right0011
		{x = 3237, y = 2177, width = 347, height = 530, offsetX = -52, offsetY = 0, offsetWidth = 425, offsetHeight = 532}, -- 59: Silver Right0012
		{x = 3589, y = 2177, width = 347, height = 530, offsetX = -52, offsetY = 0, offsetWidth = 425, offsetHeight = 532}, -- 60: Silver Right0013
		{x = 5, y = 2712, width = 347, height = 530, offsetX = -52, offsetY = 0, offsetWidth = 425, offsetHeight = 532}, -- 61: Silver Right0014
		{x = 357, y = 2712, width = 347, height = 530, offsetX = -52, offsetY = 0, offsetWidth = 425, offsetHeight = 532}, -- 62: Silver Right0015
		{x = 709, y = 2712, width = 347, height = 530, offsetX = -52, offsetY = 0, offsetWidth = 425, offsetHeight = 532}, -- 63: Silver Right0016
		{x = 1061, y = 2712, width = 347, height = 530, offsetX = -52, offsetY = 0, offsetWidth = 425, offsetHeight = 532}, -- 64: Silver Right0017
		{x = 2533, y = 2177, width = 347, height = 530, offsetX = -52, offsetY = 0, offsetWidth = 425, offsetHeight = 532}, -- 65: Silver Right0018

		{x = 1413, y = 2712, width = 303, height = 641, offsetX = 0, offsetY = 0, offsetWidth = 312, offsetHeight = 641}, -- 66: Silver Up0000
		{x = 1721, y = 2712, width = 304, height = 629, offsetX = -8, offsetY = -12, offsetWidth = 312, offsetHeight = 641}, -- 67: Silver Up0001
		{x = 2030, y = 2712, width = 304, height = 629, offsetX = -8, offsetY = -12, offsetWidth = 312, offsetHeight = 641}, -- 68: Silver Up0002
		{x = 2339, y = 2712, width = 300, height = 625, offsetX = -8, offsetY = -16, offsetWidth = 312, offsetHeight = 641}, -- 69: Silver Up0003
		{x = 2644, y = 2712, width = 300, height = 624, offsetX = -8, offsetY = -17, offsetWidth = 312, offsetHeight = 641}, -- 70: Silver Up0004
		{x = 2949, y = 2712, width = 289, height = 621, offsetX = -5, offsetY = -20, offsetWidth = 312, offsetHeight = 641}, -- 71: Silver Up0005
		{x = 3243, y = 2712, width = 289, height = 621, offsetX = -5, offsetY = -20, offsetWidth = 312, offsetHeight = 641}, -- 72: Silver Up0006
		{x = 3537, y = 2712, width = 287, height = 620, offsetX = -1, offsetY = -21, offsetWidth = 312, offsetHeight = 641}, -- 73: Silver Up0007
		{x = 5, y = 3358, width = 287, height = 620, offsetX = -1, offsetY = -21, offsetWidth = 312, offsetHeight = 641}, -- 74: Silver Up0008
		{x = 297, y = 3358, width = 288, height = 619, offsetX = -3, offsetY = -22, offsetWidth = 312, offsetHeight = 641}, -- 75: Silver Up0009
		{x = 590, y = 3358, width = 288, height = 619, offsetX = -3, offsetY = -22, offsetWidth = 312, offsetHeight = 641}, -- 76: Silver Up0010
		{x = 590, y = 3358, width = 288, height = 619, offsetX = -3, offsetY = -22, offsetWidth = 312, offsetHeight = 641}, -- 77: Silver Up0011
		{x = 883, y = 3358, width = 289, height = 619, offsetX = -4, offsetY = -22, offsetWidth = 312, offsetHeight = 641}, -- 78: Silver Up0012
		{x = 1177, y = 3358, width = 290, height = 619, offsetX = -6, offsetY = -22, offsetWidth = 312, offsetHeight = 641}, -- 79: Silver Up0013
		{x = 1472, y = 3358, width = 290, height = 619, offsetX = -6, offsetY = -22, offsetWidth = 312, offsetHeight = 641}, -- 80: Silver Up0014
		{x = 1472, y = 3358, width = 290, height = 619, offsetX = -6, offsetY = -22, offsetWidth = 312, offsetHeight = 641}, -- 81: Silver Up0015
		{x = 1767, y = 3358, width = 290, height = 619, offsetX = -6, offsetY = -22, offsetWidth = 312, offsetHeight = 641}, -- 82: Silver Up0016
		{x = 1767, y = 3358, width = 290, height = 619, offsetX = -6, offsetY = -22, offsetWidth = 312, offsetHeight = 641}, -- 83: Silver Up0017
		{x = 2062, y = 3358, width = 290, height = 619, offsetX = -6, offsetY = -22, offsetWidth = 312, offsetHeight = 641} -- 84: Silver Up0018
	},
	{
		["singDOWN"] = {start = 1, stop = 19, speed = 24, offsetX = 28, offsetY = -50},
		["singLEFT"] = {start = 28, stop = 46, speed = 24, offsetX = 94, offsetY = -23},
		["singRIGHT"] = {start = 47, stop = 65, speed = 24, offsetX = 4, offsetY = -28},
		["singUP"] = {start = 66, stop = 84, speed = 24, offsetX = 11, offsetY = 27},
		["idle"] = {start = 20, stop = 27, speed = 24, offsetX = 0, offsetY = 0},
	},
	"idle",
	false,
	{
		sing_duration = 6.1,   -- wtf do i put here
		isCharacter = true,
	}
)
