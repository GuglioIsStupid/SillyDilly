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
	love.graphics.newImage(graphics.imagePath("menu/hypno/StartscreenGF")),
	-- Automatically generated from StartscreenGF.xml
	{
		{x = 20, y = 20, width = 628, height = 532, offsetX = 0, offsetY = -29, offsetWidth = 628, offsetHeight = 561}, -- 1: GF Startscreen0000
		{x = 668, y = 20, width = 622, height = 534, offsetX = -3, offsetY = -25, offsetWidth = 628, offsetHeight = 561}, -- 2: GF Startscreen0001
		{x = 1310, y = 20, width = 624, height = 538, offsetX = -3, offsetY = -22, offsetWidth = 628, offsetHeight = 561}, -- 3: GF Startscreen0002
		{x = 1310, y = 20, width = 624, height = 538, offsetX = -3, offsetY = -22, offsetWidth = 628, offsetHeight = 561}, -- 4: GF Startscreen0003
		{x = 20, y = 578, width = 624, height = 539, offsetX = -3, offsetY = -20, offsetWidth = 628, offsetHeight = 561}, -- 5: GF Startscreen0004
		{x = 20, y = 578, width = 624, height = 539, offsetX = -3, offsetY = -20, offsetWidth = 628, offsetHeight = 561}, -- 6: GF Startscreen0005
		{x = 664, y = 578, width = 622, height = 550, offsetX = -5, offsetY = -10, offsetWidth = 628, offsetHeight = 561}, -- 7: GF Startscreen0006
		{x = 664, y = 578, width = 622, height = 550, offsetX = -5, offsetY = -10, offsetWidth = 628, offsetHeight = 561}, -- 8: GF Startscreen0007
		{x = 1306, y = 578, width = 621, height = 546, offsetX = -5, offsetY = -7, offsetWidth = 628, offsetHeight = 561}, -- 9: GF Startscreen0008
		{x = 20, y = 1148, width = 621, height = 546, offsetX = -5, offsetY = -6, offsetWidth = 628, offsetHeight = 561}, -- 10: GF Startscreen0009
		{x = 661, y = 1148, width = 621, height = 546, offsetX = -5, offsetY = -6, offsetWidth = 628, offsetHeight = 561}, -- 11: GF Startscreen0010
		{x = 661, y = 1148, width = 621, height = 546, offsetX = -5, offsetY = -6, offsetWidth = 628, offsetHeight = 561}, -- 12: GF Startscreen0011
		{x = 661, y = 1148, width = 621, height = 546, offsetX = -5, offsetY = -6, offsetWidth = 628, offsetHeight = 561}, -- 13: GF Startscreen0012
		{x = 1302, y = 1148, width = 617, height = 551, offsetX = -7, offsetY = 0, offsetWidth = 628, offsetHeight = 561} -- 14: GF Startscreen0013
	},

	{
		["anim"] = {start = 1, stop = 14, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
