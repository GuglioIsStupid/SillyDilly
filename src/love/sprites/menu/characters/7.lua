
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
	love.graphics.newImage(graphics.imagePath("menu/characters/gf_menu")),
	-- Automatically generated from gf_menu.xml
	{
		{x = 20, y = 20, width = 689, height = 765, offsetX = 0, offsetY = -1, offsetWidth = 694, offsetHeight = 766}, -- 1: gf menu instance 10000
		{x = 20, y = 20, width = 689, height = 765, offsetX = 0, offsetY = -1, offsetWidth = 694, offsetHeight = 766}, -- 2: gf menu instance 10001
		{x = 20, y = 20, width = 689, height = 765, offsetX = 0, offsetY = -1, offsetWidth = 694, offsetHeight = 766}, -- 3: gf menu instance 10002
		{x = 729, y = 20, width = 685, height = 736, offsetX = -3, offsetY = 0, offsetWidth = 694, offsetHeight = 766}, -- 4: gf menu instance 10003
		{x = 729, y = 20, width = 685, height = 736, offsetX = -3, offsetY = 0, offsetWidth = 694, offsetHeight = 766}, -- 5: gf menu instance 10004
		{x = 729, y = 20, width = 685, height = 736, offsetX = -3, offsetY = 0, offsetWidth = 694, offsetHeight = 766}, -- 6: gf menu instance 10005
		{x = 20, y = 805, width = 692, height = 728, offsetX = -2, offsetY = -1, offsetWidth = 694, offsetHeight = 766}, -- 7: gf menu instance 10006
		{x = 20, y = 805, width = 692, height = 728, offsetX = -2, offsetY = -1, offsetWidth = 694, offsetHeight = 766}, -- 8: gf menu instance 10007
		{x = 20, y = 805, width = 692, height = 728, offsetX = -2, offsetY = -1, offsetWidth = 694, offsetHeight = 766}, -- 9: gf menu instance 10008
		{x = 732, y = 805, width = 685, height = 735, offsetX = -3, offsetY = -1, offsetWidth = 694, offsetHeight = 766}, -- 10: gf menu instance 10009
		{x = 732, y = 805, width = 685, height = 735, offsetX = -3, offsetY = -1, offsetWidth = 694, offsetHeight = 766}, -- 11: gf menu instance 10010
		{x = 732, y = 805, width = 685, height = 735, offsetX = -3, offsetY = -1, offsetWidth = 694, offsetHeight = 766} -- 12: gf menu instance 10011
	},	{
		["anim"] = {start = 1, stop = 12, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
