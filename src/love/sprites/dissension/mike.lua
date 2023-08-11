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
	love.graphics.newImage(graphics.imagePath("dissension/mike")),
	-- Automatically generated from mike.xml
	{
		{x = 0, y = 0, width = 977, height = 461, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 1: mike_idle 0000
		{x = 978, y = 0, width = 976, height = 461, offsetX = -1, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 2: mike_idle 0001
		{x = 978, y = 0, width = 976, height = 461, offsetX = -1, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 3: mike_idle 0002
		{x = 0, y = 462, width = 976, height = 460, offsetX = -1, offsetY = -1, offsetWidth = 200, offsetHeight = 200}, -- 4: mike_idle 0003
		{x = 0, y = 462, width = 976, height = 460, offsetX = -1, offsetY = -1, offsetWidth = 200, offsetHeight = 200}, -- 5: mike_idle 0004
		{x = 977, y = 462, width = 976, height = 460, offsetX = -1, offsetY = -1, offsetWidth = 200, offsetHeight = 200}, -- 6: mike_idle 0005
		{x = 977, y = 462, width = 976, height = 460, offsetX = -1, offsetY = -1, offsetWidth = 200, offsetHeight = 200}, -- 7: mike_idle 0006
		{x = 0, y = 0, width = 977, height = 461, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 8: mike_idle 0007

		{x = 0, y = 923, width = 973, height = 464, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 9: mike_up_sing 0000
		{x = 0, y = 923, width = 973, height = 464, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 10: mike_up_sing 0001
		{x = 974, y = 923, width = 969, height = 467, offsetX = 0, offsetY = 3, offsetWidth = 200, offsetHeight = 200}, -- 11: mike_up_sing 0002
		{x = 974, y = 923, width = 969, height = 467, offsetX = 0, offsetY = 3, offsetWidth = 200, offsetHeight = 200}, -- 12: mike_up_sing 0003
		{x = 0, y = 1388, width = 965, height = 469, offsetX = 0, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 13: mike_up_sing 0004
		{x = 0, y = 1388, width = 965, height = 469, offsetX = 0, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 14: mike_up_sing 0005
		{x = 0, y = 1388, width = 965, height = 469, offsetX = 0, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 15: mike_up_sing 0006
		{x = 0, y = 1388, width = 965, height = 469, offsetX = 0, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 16: mike_up_sing 0007
		{x = 0, y = 1388, width = 965, height = 469, offsetX = 0, offsetY = 6, offsetWidth = 200, offsetHeight = 200}, -- 17: mike_up_sing 0008

		{x = 966, y = 1391, width = 982, height = 459, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 18: mike_down_sing 0000
		{x = 966, y = 1391, width = 982, height = 459, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 19: mike_down_sing 0001
		{x = 0, y = 1858, width = 986, height = 456, offsetX = 0, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 20: mike_down_sing 0002
		{x = 0, y = 1858, width = 986, height = 456, offsetX = 0, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 21: mike_down_sing 0003
		{x = 987, y = 1851, width = 990, height = 453, offsetX = 0, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 22: mike_down_sing 0004
		{x = 987, y = 1851, width = 990, height = 453, offsetX = 0, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 23: mike_down_sing 0005
		{x = 987, y = 1851, width = 990, height = 453, offsetX = 0, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 24: mike_down_sing 0006
		{x = 987, y = 1851, width = 990, height = 453, offsetX = 0, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 25: mike_down_sing 0007
		{x = 987, y = 1851, width = 990, height = 453, offsetX = 0, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 26: mike_down_sing 0008

		{x = 0, y = 2315, width = 980, height = 461, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 27: mike_left_sing 0000
		{x = 0, y = 2315, width = 980, height = 461, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 28: mike_left_sing 0001
		{x = 981, y = 2315, width = 977, height = 464, offsetX = 3, offsetY = 3, offsetWidth = 200, offsetHeight = 200}, -- 29: mike_left_sing 0002
		{x = 981, y = 2315, width = 977, height = 464, offsetX = 3, offsetY = 3, offsetWidth = 200, offsetHeight = 200}, -- 30: mike_left_sing 0003
		{x = 1955, y = 0, width = 974, height = 467, offsetX = 7, offsetY = 3, offsetWidth = 200, offsetHeight = 200}, -- 31: mike_left_sing 0004
		{x = 1955, y = 0, width = 974, height = 467, offsetX = 7, offsetY = 3, offsetWidth = 200, offsetHeight = 200}, -- 32: mike_left_sing 0005
		{x = 1955, y = 0, width = 974, height = 467, offsetX = 7, offsetY = 3, offsetWidth = 200, offsetHeight = 200}, -- 33: mike_left_sing 0006
		{x = 1955, y = 0, width = 974, height = 467, offsetX = 7, offsetY = 3, offsetWidth = 200, offsetHeight = 200}, -- 34: mike_left_sing 0007
		{x = 1955, y = 0, width = 974, height = 467, offsetX = 7, offsetY = 3, offsetWidth = 200, offsetHeight = 200}, -- 35: mike_left_sing 0008

		{x = 1954, y = 468, width = 985, height = 459, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 36: mike_right_sing 0000
		{x = 1954, y = 468, width = 985, height = 459, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 37: mike_right_sing 0001
		{x = 1944, y = 928, width = 988, height = 456, offsetX = -3, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 38: mike_right_sing 0002
		{x = 1944, y = 928, width = 988, height = 456, offsetX = -3, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 39: mike_right_sing 0003
		{x = 1949, y = 1385, width = 991, height = 453, offsetX = -6, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 40: mike_right_sing 0004
		{x = 1949, y = 1385, width = 991, height = 453, offsetX = -6, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 41: mike_right_sing 0005
		{x = 1949, y = 1385, width = 991, height = 453, offsetX = -6, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 42: mike_right_sing 0006
		{x = 1949, y = 1385, width = 991, height = 453, offsetX = -6, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 43: mike_right_sing 0007
		{x = 1949, y = 1385, width = 991, height = 453, offsetX = -6, offsetY = -6, offsetWidth = 200, offsetHeight = 200}, -- 44: mike_right_sing 0008

		{x = 1954, y = 468, width = 985, height = 459, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 45: mike_right_miss 0000
		{x = 1954, y = 468, width = 985, height = 459, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 46: mike_right_miss 0001
		{x = 1978, y = 1839, width = 991, height = 458, offsetX = 0, offsetY = -1, offsetWidth = 200, offsetHeight = 200}, -- 47: mike_right_miss 0002
		{x = 1978, y = 1839, width = 991, height = 458, offsetX = 0, offsetY = -1, offsetWidth = 200, offsetHeight = 200}, -- 48: mike_right_miss 0003
		{x = 1959, y = 2298, width = 994, height = 455, offsetX = 0, offsetY = -4, offsetWidth = 200, offsetHeight = 200}, -- 49: mike_right_miss 0004
		{x = 1959, y = 2298, width = 994, height = 455, offsetX = 0, offsetY = -4, offsetWidth = 200, offsetHeight = 200}, -- 50: mike_right_miss 0005
		{x = 1959, y = 2298, width = 994, height = 455, offsetX = 0, offsetY = -4, offsetWidth = 200, offsetHeight = 200}, -- 51: mike_right_miss 0006
		{x = 1959, y = 2298, width = 994, height = 455, offsetX = 0, offsetY = -4, offsetWidth = 200, offsetHeight = 200}, -- 52: mike_right_miss 0007
		{x = 1959, y = 2298, width = 994, height = 455, offsetX = 0, offsetY = -4, offsetWidth = 200, offsetHeight = 200}, -- 53: mike_right_miss 0008
		{x = 1959, y = 2298, width = 994, height = 455, offsetX = 0, offsetY = -4, offsetWidth = 200, offsetHeight = 200}, -- 54: mike_right_miss 0009

		{x = 0, y = 2315, width = 980, height = 461, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 55: mike_left_miss 0000
		{x = 2929, y = 0, width = 975, height = 466, offsetX = 3, offsetY = 5, offsetWidth = 200, offsetHeight = 200}, -- 56: mike_left_miss 0001
		{x = 2929, y = 0, width = 975, height = 466, offsetX = 3, offsetY = 5, offsetWidth = 200, offsetHeight = 200}, -- 57: mike_left_miss 0002
		{x = 2940, y = 467, width = 971, height = 469, offsetX = 6, offsetY = 8, offsetWidth = 200, offsetHeight = 200}, -- 58: mike_left_miss 0003
		{x = 2940, y = 467, width = 971, height = 469, offsetX = 6, offsetY = 8, offsetWidth = 200, offsetHeight = 200}, -- 59: mike_left_miss 0004
		{x = 2940, y = 467, width = 971, height = 469, offsetX = 6, offsetY = 8, offsetWidth = 200, offsetHeight = 200}, -- 60: mike_left_miss 0005
		{x = 2940, y = 467, width = 971, height = 469, offsetX = 6, offsetY = 8, offsetWidth = 200, offsetHeight = 200}, -- 61: mike_left_miss 0006
		{x = 2940, y = 467, width = 971, height = 469, offsetX = 6, offsetY = 8, offsetWidth = 200, offsetHeight = 200}, -- 62: mike_left_miss 0007
		{x = 2940, y = 467, width = 971, height = 469, offsetX = 6, offsetY = 8, offsetWidth = 200, offsetHeight = 200}, -- 63: mike_left_miss 0008
		{x = 2940, y = 467, width = 971, height = 469, offsetX = 6, offsetY = 8, offsetWidth = 200, offsetHeight = 200}, -- 64: mike_left_miss 0009

		{x = 966, y = 1391, width = 982, height = 459, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 65: mike_down_miss 0000
		{x = 2933, y = 937, width = 990, height = 456, offsetX = 0, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 66: mike_down_miss 0001
		{x = 2933, y = 937, width = 990, height = 456, offsetX = 0, offsetY = -3, offsetWidth = 200, offsetHeight = 200}, -- 67: mike_down_miss 0002
		{x = 2940, y = 1394, width = 995, height = 451, offsetX = 0, offsetY = -8, offsetWidth = 200, offsetHeight = 200}, -- 68: mike_down_miss 0003
		{x = 2940, y = 1394, width = 995, height = 451, offsetX = 0, offsetY = -8, offsetWidth = 200, offsetHeight = 200}, -- 69: mike_down_miss 0004
		{x = 2940, y = 1394, width = 995, height = 451, offsetX = 0, offsetY = -8, offsetWidth = 200, offsetHeight = 200}, -- 70: mike_down_miss 0005
		{x = 2940, y = 1394, width = 995, height = 451, offsetX = 0, offsetY = -8, offsetWidth = 200, offsetHeight = 200}, -- 71: mike_down_miss 0006
		{x = 2940, y = 1394, width = 995, height = 451, offsetX = 0, offsetY = -8, offsetWidth = 200, offsetHeight = 200}, -- 72: mike_down_miss 0007
		{x = 2940, y = 1394, width = 995, height = 451, offsetX = 0, offsetY = -8, offsetWidth = 200, offsetHeight = 200}, -- 73: mike_down_miss 0008
		{x = 2940, y = 1394, width = 995, height = 451, offsetX = 0, offsetY = -8, offsetWidth = 200, offsetHeight = 200}, -- 74: mike_down_miss 0009

		{x = 0, y = 923, width = 973, height = 464, offsetX = 0, offsetY = 0, offsetWidth = 200, offsetHeight = 200}, -- 75: mike_up_miss 0000
		{x = 2969, y = 1846, width = 974, height = 471, offsetX = 0, offsetY = 7, offsetWidth = 200, offsetHeight = 200}, -- 76: mike_up_miss 0001
		{x = 2969, y = 1846, width = 974, height = 471, offsetX = 0, offsetY = 7, offsetWidth = 200, offsetHeight = 200}, -- 77: mike_up_miss 0002
		{x = 2954, y = 2318, width = 974, height = 476, offsetX = 0, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 78: mike_up_miss 0003
		{x = 2954, y = 2318, width = 974, height = 476, offsetX = 0, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 79: mike_up_miss 0004
		{x = 2954, y = 2318, width = 974, height = 476, offsetX = 0, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 80: mike_up_miss 0005
		{x = 2954, y = 2318, width = 974, height = 476, offsetX = 0, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 81: mike_up_miss 0006
		{x = 2954, y = 2318, width = 974, height = 476, offsetX = 0, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 82: mike_up_miss 0007
		{x = 2954, y = 2318, width = 974, height = 476, offsetX = 0, offsetY = 12, offsetWidth = 200, offsetHeight = 200}, -- 83: mike_up_miss 0008
		{x = 2954, y = 2318, width = 974, height = 476, offsetX = 0, offsetY = 12, offsetWidth = 200, offsetHeight = 200} -- 84: mike_up_miss 0009
	},
	{
		["singDOWN"] = {start = 18, stop = 26, speed = 24, offsetX = 0, offsetY = 0},
		["singLEFT"] = {start = 27, stop = 35, speed = 24, offsetX = 0, offsetY = 0},
		["singRIGHT"] = {start = 36, stop = 44, speed = 24, offsetX = 0, offsetY = 0},
		["singUP"] = {start = 9, stop = 17, speed = 24, offsetX = 0, offsetY = 0},
		["idle"] = {start = 1, stop = 8, speed = 24, offsetX = 0, offsetY = 0},
		["singDOWN miss"] = {start = 65, stop = 74, speed = 24, offsetX = 0, offsetY = 0},
		["singLEFT miss"] = {start = 55, stop = 64, speed = 24, offsetX = 0, offsetY = 0},
		["singRIGHT miss"] = {start = 45, stop = 54, speed = 24, offsetX = 0, offsetY = 0},
		["singUP miss"] = {start = 75, stop = 84, speed = 24, offsetX = 0, offsetY = 0},
	},
	"idle",
	false,
	{
		sing_duration = 6.1,   -- wtf do i put here
		isCharacter = true,
	}
)
