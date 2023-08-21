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
    images.icons,
	{
		{x = 0, y = 0, width = 138, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Boyfriend
		{x = 139, y = 0, width = 137, height = 90, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Boyfriend Losing
		{x = 277, y = 0, width = 120, height = 82, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: SmallHypno
		{x = 407, y = 1, width = 131, height = 83, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: SmallHypno Losing 0001
		{x = 407, y = 1, width = 131, height = 83, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: SmallHypno Losing 0002
		{x = 0, y = 83, width = 131, height = 83, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: SmallHypno Losing 0003
		{x = 0, y = 83, width = 131, height = 83, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: SmallHypno Losing 0004
		{x = 255, y = 83, width = 131, height = 83, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 8: SmallHypno Losing 0005
		{x = 255, y = 83, width = 131, height = 83, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 9: SmallHypno Losing 0006
		{x = 387, y = 85, width = 131, height = 83, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 10: SmallHypno Losing 0007
		{x = 387, y = 85, width = 131, height = 83, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 11: SmallHypno Losing 0008
		{x = 0, y = 860, width = 146, height = 197, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 12: Abomination Hypno 0000
		{x = 147, y = 855, width = 142, height = 191, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 13: Abomination Hypno 0001
		{x = 290, y = 855, width = 128, height = 163, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 14: Abomination Hypno 0002
		{x = 134, y = 294, width = 150, height = 120, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 15: Beelze
		{x = 766, y = 237, width = 145, height = 136, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 16: Beelze Losing
		{x = 337, y = 428, width = 146, height = 92, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 17: Alexis
		{x = 481, y = 525, width = 142, height = 87, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 18: Alexis Losing
		{x = 621, y = 132, width = 135, height = 126, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 19: Cold Gold
		{x = 0, y = 167, width = 136, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 20: Cold Gold Losing
		{x = 631, y = 259, width = 134, height = 129, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 21: Dawn
		{x = 360, y = 169, width = 126, height = 129, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 22: Dawn Losing
		{x = 432, y = 624, width = 123, height = 104, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 23: Glitchy Red
		{x = 285, y = 296, width = 126, height = 121, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 24: Glitchy Red Losing
		{x = 663, y = 629, width = 124, height = 106, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 25: Glitchy Red Mad
		{x = 505, y = 301, width = 125, height = 112, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 26: Glitchy Red Mad Losing
		{x = 624, y = 529, width = 108, height = 99, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 27: Grey
		{x = 118, y = 520, width = 108, height = 99, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 28: Grey Losing
		{x = 540, y = 732, width = 146, height = 135, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 29: Hypno
		{x = 942, y = 676, width = 181, height = 146, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 30: Hypno Losing
		{x = 412, y = 729, width = 127, height = 116, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 31: Hypno Card
		{x = 687, y = 786, width = 156, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 32: Hypno Card Losing
		{x = 556, y = 629, width = 106, height = 102, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 33: Jigglypuff
		{x = 519, y = 151, width = 101, height = 149, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 34: Jigglypuff Losing
		{x = 618, y = 389, width = 154, height = 139, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 35: Lord X
		{x = 788, y = 637, width = 153, height = 148, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 36: Lord X Losing
		{x = 227, y = 529, width = 127, height = 93, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 37: Mike
		{x = 355, y = 521, width = 125, height = 102, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 38: Mike Losing
		{x = 251, y = 167, width = 108, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 39: MX
		{x = 539, y = 0, width = 100, height = 150, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 40: MX Losing
		{x = 484, y = 414, width = 133, height = 110, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 41: Pico
		{x = 0, y = 296, width = 133, height = 114, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 42: Pico Losing
		{x = 757, y = 115, width = 150, height = 121, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 43: Ponyta
		{x = 742, y = 0, width = 157, height = 114, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 44: Ponyta Losing
		{x = 137, y = 176, width = 113, height = 117, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 45: Shinto
		{x = 0, y = 523, width = 117, height = 95, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 46: Shinto Losing
		{x = 0, y = 728, width = 112, height = 131, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 47: Shitno
		{x = 113, y = 730, width = 112, height = 117, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 48: Shitno Losing
		{x = 114, y = 415, width = 120, height = 104, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 49: Silver
		{x = 0, y = 411, width = 113, height = 111, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 50: Silver Losing
		{x = 773, y = 374, width = 142, height = 106, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 51: Steven Evil
		{x = 769, y = 481, width = 152, height = 155, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 52: Steven Evil Losing
		{x = 419, y = 852, width = 136, height = 168, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 53: Wigglytuff 0
		{x = 556, y = 868, width = 130, height = 168, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 54: Wigglytuff 1
		{x = 844, y = 808, width = 124, height = 173, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 55: Wigglytuff 2
		{x = 969, y = 823, width = 133, height = 169, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 56: Wigglytuff 3
		{x = 226, y = 730, width = 84, height = 124, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 57: Missingno
		{x = 311, y = 725, width = 100, height = 124, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 58: Missingno Losing
		{x = 912, y = 147, width = 176, height = 175, offsetX = -15, offsetY = -4, offsetWidth = 191, offsetHeight = 180}, -- 59: Hypno2 0000
		{x = 916, y = 323, width = 176, height = 178, offsetX = -13, offsetY = 0, offsetWidth = 191, offsetHeight = 180}, -- 60: Hypno2 0001
		{x = 936, y = 502, width = 176, height = 173, offsetX = 0, offsetY = -4, offsetWidth = 191, offsetHeight = 180}, -- 61: Hypno2 0002
		{x = 141, y = 623, width = 142, height = 106, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 62: Silver (2 ig)
		{x = 640, y = 0, width = 101, height = 131, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 63: Red Dead
		{x = 235, y = 418, width = 101, height = 110, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 64: Red
		{x = 284, y = 624, width = 147, height = 100, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 65: Girlfriend
		{x = 412, y = 299, width = 92, height = 128, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 66: Buried
		{x = 132, y = 91, width = 122, height = 84, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 67: Boyfriend Pixel
		{x = 0, y = 619, width = 140, height = 108, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 68: Boyfriend Hypno
		{x = 908, y = 0, width = 169, height = 146, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 69: Gold
		{x = 0, y = 0, width = 0, height = 0, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 70: empty
	},
	{
		["boyfriend"] = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
		["boyfriend losing"] = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0},
		["smallhypno"] = {start = 3, stop = 3, speed = 0, offsetX = 0, offsetY = 0},
		["smallhypno losing"] = {start = 4, stop = 11, speed = 24, offsetX = 0, offsetY = 0},
		["abominationhypno"] = {start = 12, stop = 14, speed = 24, offsetX = 0, offsetY = 0},
		["abominationhypno losing"] = {start = 12, stop = 14, speed = 24, offsetX = 0, offsetY = 0},
		["beelze"] = {start = 15, stop = 15, speed = 0, offsetX = 0, offsetY = 0},
		["beelze losing"] = {start = 16, stop = 16, speed = 0, offsetX = 0, offsetY = 0},
		["alexis"] = {start = 17, stop = 17, speed = 0, offsetX = 0, offsetY = 0},
		["alexis losing"] = {start = 18, stop = 18, speed = 0, offsetX = 0, offsetY = 0},
		["coldgold"] = {start = 19, stop = 19, speed = 0, offsetX = 0, offsetY = 0},
		["coldgold losing"] = {start = 20, stop = 20, speed = 0, offsetX = 0, offsetY = 0},
		["dawn"] = {start = 21, stop = 21, speed = 0, offsetX = 0, offsetY = 0},
		["dawn losing"] = {start = 22, stop = 22, speed = 0, offsetX = 0, offsetY = 0},
		["glitchyred"] = {start = 23, stop = 23, speed = 0, offsetX = 0, offsetY = 0},
		["glitchyred losing"] = {start = 24, stop = 24, speed = 0, offsetX = 0, offsetY = 0},
		["glitchyredmad"] = {start = 25, stop = 25, speed = 0, offsetX = 0, offsetY = 0},
		["glitchyredmad losing"] = {start = 26, stop = 26, speed = 0, offsetX = 0, offsetY = 0},
		["grey"] = {start = 27, stop = 27, speed = 0, offsetX = 0, offsetY = 0},
		["grey losing"] = {start = 28, stop = 28, speed = 0, offsetX = 0, offsetY = 0},
		["hypno"] = {start = 29, stop = 29, speed = 0, offsetX = 0, offsetY = 0},
		["hypno losing"] = {start = 30, stop = 30, speed = 0, offsetX = 0, offsetY = 0},
		["hypnocard"] = {start = 31, stop = 31, speed = 0, offsetX = 0, offsetY = 0},
		["hypnocard losing"] = {start = 32, stop = 32, speed = 0, offsetX = 0, offsetY = 0},
		["jigglypuff"] = {start = 33, stop = 33, speed = 0, offsetX = 0, offsetY = 0},
		["jigglypuff losing"] = {start = 34, stop = 34, speed = 0, offsetX = 0, offsetY = 0},
		["lordx"] = {start = 35, stop = 35, speed = 0, offsetX = 0, offsetY = 0},
		["lordx losing"] = {start = 36, stop = 36, speed = 0, offsetX = 0, offsetY = 0},
		["mike"] = {start = 37, stop = 37, speed = 0, offsetX = 0, offsetY = 0},
		["mike losing"] = {start = 38, stop = 38, speed = 0, offsetX = 0, offsetY = 0},
		["mx"] = {start = 39, stop = 39, speed = 0, offsetX = 0, offsetY = 0},
		["mx losing"] = {start = 40, stop = 40, speed = 0, offsetX = 0, offsetY = 0},
		["pico"] = {start = 41, stop = 41, speed = 0, offsetX = 0, offsetY = 0},
		["pico losing"] = {start = 42, stop = 42, speed = 0, offsetX = 0, offsetY = 0},
		["ponyta"] = {start = 43, stop = 43, speed = 0, offsetX = 0, offsetY = 0},
		["ponyta losing"] = {start = 44, stop = 44, speed = 0, offsetX = 0, offsetY = 0},
		["shinto"] = {start = 45, stop = 45, speed = 0, offsetX = 0, offsetY = 0},
		["shinto losing"] = {start = 46, stop = 46, speed = 0, offsetX = 0, offsetY = 0},
		["shitno"] = {start = 47, stop = 47, speed = 0, offsetX = 0, offsetY = 0},
		["shitno losing"] = {start = 48, stop = 48, speed = 0, offsetX = 0, offsetY = 0},
		["silver"] = {start = 49, stop = 49, speed = 0, offsetX = 0, offsetY = 0},
		["silver losing"] = {start = 50, stop = 50, speed = 0, offsetX = 0, offsetY = 0},
		["stevenevil"] = {start = 51, stop = 51, speed = 0, offsetX = 0, offsetY = 0},
		["stevenevil losing"] = {start = 52, stop = 52, speed = 0, offsetX = 0, offsetY = 0},
		["wigglytuff0"] = {start = 53, stop = 53, speed = 0, offsetX = 0, offsetY = 0},
		["wigglytuff0 losing"] = {start = 53, stop = 53, speed = 0, offsetX = 0, offsetY = 0},
		["wigglytuff1"] = {start = 54, stop = 54, speed = 0, offsetX = 0, offsetY = 0},
		["wigglytuff1 losing"] = {start = 54, stop = 54, speed = 0, offsetX = 0, offsetY = 0},
		["wigglytuff2"] = {start = 55, stop = 55, speed = 0, offsetX = 0, offsetY = 0},
		["wigglytuff2 losing"] = {start = 55, stop = 55, speed = 0, offsetX = 0, offsetY = 0},
		["wigglytuff3"] = {start = 56, stop = 56, speed = 0, offsetX = 0, offsetY = 0},
		["wigglytuff3 losing"] = {start = 56, stop = 56, speed = 0, offsetX = 0, offsetY = 0},
		["missingno"] = {start = 57, stop = 57, speed = 0, offsetX = 0, offsetY = 0},
		["missingno losing"] = {start = 58, stop = 58, speed = 0, offsetX = 0, offsetY = 0},
		["hypno2"] = {start = 59, stop = 61, speed = 24, offsetX = 0, offsetY = 0},
		["hypno2 losing"] = {start = 59, stop = 61, speed = 24, offsetX = 0, offsetY = 0},
		["silver2"] = {start = 62, stop = 62, speed = 24, offsetX = 0, offsetY = 0},
		["silver2 losing"] = {start = 62, stop = 62, speed = 0, offsetX = 0, offsetY = 0},
		["reddead"] = {start = 63, stop = 63, speed = 0, offsetX = 0, offsetY = 0},
		["reddead losing"] = {start = 63, stop = 63, speed = 0, offsetX = 0, offsetY = 0},
		["red"] = {start = 64, stop = 64, speed = 0, offsetX = 0, offsetY = 0},
		["red losing"] = {start = 64, stop = 64, speed = 0, offsetX = 0, offsetY = 0},
		["girlfriend"] = {start = 65, stop = 65, speed = 0, offsetX = 0, offsetY = 0},
		["girlfriend losing"] = {start = 65, stop = 65, speed = 0, offsetX = 0, offsetY = 0},
		["buried"] = {start = 66, stop = 66, speed = 0, offsetX = 0, offsetY = 0},
		["buried losing"] = {start = 66, stop = 66, speed = 0, offsetX = 0, offsetY = 0},
		["boyfriend (pixel)"] = {start = 67, stop = 67, speed = 0, offsetX = 0, offsetY = 0},
		["boyfriend (pixel) losing"] = {start = 67, stop = 67, speed = 0, offsetX = 0, offsetY = 0},
		["boyfriendhypno"] = {start = 68, stop = 68, speed = 0, offsetX = 0, offsetY = 0},
		["boyfriendhypno losing"] = {start = 68, stop = 68, speed = 0, offsetX = 0, offsetY = 0},
		["gold"] = {start = 69, stop = 69, speed = 0, offsetX = 0, offsetY = 0},
		["gold losing"] = {start = 69, stop = 69, speed = 0, offsetX = 0, offsetY = 0},
		["empty"] = {start = 70, stop = 70, speed = 0, offsetX = 0, offsetY = 0},
	},
	"boyfriend",
	false
)
