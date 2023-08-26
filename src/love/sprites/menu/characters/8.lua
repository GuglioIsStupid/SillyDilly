
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
	love.graphics.newImage(graphics.imagePath("menu/characters/gold_menu")),
	-- Automatically generated from gold_menu.xml
	{
		{x = 0, y = 0, width = 816, height = 646, offsetX = -3, offsetY = 0, offsetWidth = 821, offsetHeight = 646}, -- 1: gold menu instance 10000
		{x = 0, y = 0, width = 816, height = 646, offsetX = -3, offsetY = 0, offsetWidth = 821, offsetHeight = 646}, -- 2: gold menu instance 10001
		{x = 0, y = 0, width = 816, height = 646, offsetX = -3, offsetY = 0, offsetWidth = 821, offsetHeight = 646}, -- 3: gold menu instance 10002
		{x = 866, y = 0, width = 820, height = 645, offsetX = -1, offsetY = 0, offsetWidth = 821, offsetHeight = 646}, -- 4: gold menu instance 10003
		{x = 866, y = 0, width = 820, height = 645, offsetX = -1, offsetY = 0, offsetWidth = 821, offsetHeight = 646}, -- 5: gold menu instance 10004
		{x = 866, y = 0, width = 820, height = 645, offsetX = -1, offsetY = 0, offsetWidth = 821, offsetHeight = 646}, -- 6: gold menu instance 10005
		{x = 0, y = 696, width = 821, height = 640, offsetX = 0, offsetY = -4, offsetWidth = 821, offsetHeight = 646}, -- 7: gold menu instance 10006
		{x = 0, y = 696, width = 821, height = 640, offsetX = 0, offsetY = -4, offsetWidth = 821, offsetHeight = 646}, -- 8: gold menu instance 10007
		{x = 0, y = 696, width = 821, height = 640, offsetX = 0, offsetY = -4, offsetWidth = 821, offsetHeight = 646}, -- 9: gold menu instance 10008
		{x = 871, y = 696, width = 815, height = 641, offsetX = -1, offsetY = -3, offsetWidth = 821, offsetHeight = 646}, -- 10: gold menu instance 10009
		{x = 871, y = 696, width = 815, height = 641, offsetX = -1, offsetY = -3, offsetWidth = 821, offsetHeight = 646}, -- 11: gold menu instance 10010
		{x = 871, y = 696, width = 815, height = 641, offsetX = -1, offsetY = -3, offsetWidth = 821, offsetHeight = 646} -- 12: gold menu instance 10011
	},	{
		["anim"] = {start = 1, stop = 12, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
