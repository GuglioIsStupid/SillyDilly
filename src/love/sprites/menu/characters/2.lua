
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
	love.graphics.newImage(graphics.imagePath("menu/characters/bf_menu")),
	-- Automatically generated from bf_menu.xml
	{
		{x = 0, y = 0, width = 619, height = 588, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: bf menu instance 10000
		{x = 0, y = 0, width = 619, height = 588, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: bf menu instance 10001
		{x = 0, y = 0, width = 619, height = 588, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: bf menu instance 10002
		{x = 669, y = 0, width = 616, height = 581, offsetX = -1, offsetY = -2, offsetWidth = 619, offsetHeight = 588}, -- 4: bf menu instance 10003
		{x = 669, y = 0, width = 616, height = 581, offsetX = -1, offsetY = -2, offsetWidth = 619, offsetHeight = 588}, -- 5: bf menu instance 10004
		{x = 669, y = 0, width = 616, height = 581, offsetX = -1, offsetY = -2, offsetWidth = 619, offsetHeight = 588}, -- 6: bf menu instance 10005
		{x = 1335, y = 0, width = 618, height = 581, offsetX = 0, offsetY = -5, offsetWidth = 619, offsetHeight = 588}, -- 7: bf menu instance 10006
		{x = 1335, y = 0, width = 618, height = 581, offsetX = 0, offsetY = -5, offsetWidth = 619, offsetHeight = 588}, -- 8: bf menu instance 10007
		{x = 1335, y = 0, width = 618, height = 581, offsetX = 0, offsetY = -5, offsetWidth = 619, offsetHeight = 588}, -- 9: bf menu instance 10008
		{x = 0, y = 638, width = 618, height = 584, offsetX = -1, offsetY = -4, offsetWidth = 619, offsetHeight = 588}, -- 10: bf menu instance 10009
		{x = 0, y = 638, width = 618, height = 584, offsetX = -1, offsetY = -4, offsetWidth = 619, offsetHeight = 588}, -- 11: bf menu instance 10010
		{x = 0, y = 638, width = 618, height = 584, offsetX = -1, offsetY = -4, offsetWidth = 619, offsetHeight = 588} -- 12: bf menu instance 10011
	},	{
		["anim"] = {start = 1, stop = 12, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
