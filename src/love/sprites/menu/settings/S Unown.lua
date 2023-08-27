
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
	love.graphics.newImage(graphics.imagePath("menu/settings/S Unown")),
	-- Automatically generated from S Unown.xml
	{
		{x = 20, y = 20, width = 249, height = 337, offsetX = -2, offsetY = -10, offsetWidth = 255, offsetHeight = 352}, -- 1: S Unown0000
		{x = 289, y = 20, width = 242, height = 337, offsetX = -5, offsetY = -14, offsetWidth = 255, offsetHeight = 352}, -- 2: S Unown0001
		{x = 551, y = 20, width = 239, height = 336, offsetX = -6, offsetY = -16, offsetWidth = 255, offsetHeight = 352}, -- 3: S Unown0002
		{x = 810, y = 20, width = 235, height = 333, offsetX = -7, offsetY = -16, offsetWidth = 255, offsetHeight = 352}, -- 4: S Unown0003
		{x = 1065, y = 20, width = 236, height = 334, offsetX = -7, offsetY = -13, offsetWidth = 255, offsetHeight = 352}, -- 5: S Unown0004
		{x = 1321, y = 20, width = 240, height = 335, offsetX = -5, offsetY = -9, offsetWidth = 255, offsetHeight = 352}, -- 6: S Unown0005
		{x = 1581, y = 20, width = 245, height = 335, offsetX = -4, offsetY = -4, offsetWidth = 255, offsetHeight = 352}, -- 7: S Unown0006
		{x = 20, y = 377, width = 248, height = 335, offsetX = -3, offsetY = -2, offsetWidth = 255, offsetHeight = 352}, -- 8: S Unown0007
		{x = 288, y = 377, width = 251, height = 337, offsetX = -2, offsetY = 0, offsetWidth = 255, offsetHeight = 352}, -- 9: S Unown0008
		{x = 559, y = 377, width = 255, height = 338, offsetX = 0, offsetY = -2, offsetWidth = 255, offsetHeight = 352}, -- 10: S Unown0009
		{x = 834, y = 377, width = 254, height = 338, offsetX = 0, offsetY = -8, offsetWidth = 255, offsetHeight = 352} -- 11: S Unown0010
	},	{
		["anim"] = {start = 1, stop = 11, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
