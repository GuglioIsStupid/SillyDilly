
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
	love.graphics.newImage(graphics.imagePath("menu/characters/silver_menu")),
	-- Automatically generated from silver_menu.xml
	{
		{x = 0, y = 0, width = 553, height = 621, offsetX = -2, offsetY = 0, offsetWidth = 556, offsetHeight = 621}, -- 1: silver menu instance 10000
		{x = 0, y = 0, width = 553, height = 621, offsetX = -2, offsetY = 0, offsetWidth = 556, offsetHeight = 621}, -- 2: silver menu instance 10001
		{x = 0, y = 0, width = 553, height = 621, offsetX = -2, offsetY = 0, offsetWidth = 556, offsetHeight = 621}, -- 3: silver menu instance 10002
		{x = 603, y = 0, width = 555, height = 617, offsetX = 0, offsetY = -4, offsetWidth = 556, offsetHeight = 621}, -- 4: silver menu instance 10003
		{x = 603, y = 0, width = 555, height = 617, offsetX = 0, offsetY = -4, offsetWidth = 556, offsetHeight = 621}, -- 5: silver menu instance 10004
		{x = 603, y = 0, width = 555, height = 617, offsetX = 0, offsetY = -4, offsetWidth = 556, offsetHeight = 621}, -- 6: silver menu instance 10005
		{x = 1208, y = 0, width = 554, height = 614, offsetX = -2, offsetY = -5, offsetWidth = 556, offsetHeight = 621}, -- 7: silver menu instance 10006
		{x = 1208, y = 0, width = 554, height = 614, offsetX = -2, offsetY = -5, offsetWidth = 556, offsetHeight = 621}, -- 8: silver menu instance 10007
		{x = 1208, y = 0, width = 554, height = 614, offsetX = -2, offsetY = -5, offsetWidth = 556, offsetHeight = 621}, -- 9: silver menu instance 10008
		{x = 0, y = 671, width = 555, height = 616, offsetX = 0, offsetY = -5, offsetWidth = 556, offsetHeight = 621}, -- 10: silver menu instance 10009
		{x = 0, y = 671, width = 555, height = 616, offsetX = 0, offsetY = -5, offsetWidth = 556, offsetHeight = 621}, -- 11: silver menu instance 10010
		{x = 0, y = 671, width = 555, height = 616, offsetX = 0, offsetY = -5, offsetWidth = 556, offsetHeight = 621} -- 12: silver menu instance 10011
	},	{
		["anim"] = {start = 1, stop = 12, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
