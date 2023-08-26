
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
	love.graphics.newImage(graphics.imagePath("menu/characters/shitno_menu")),
	-- Automatically generated from shitno_menu.xml
	{
		{x = 0, y = 0, width = 825, height = 720, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: shitno menu instance 10000
		{x = 825, y = 0, width = 818, height = 718, offsetX = 0, offsetY = -1, offsetWidth = 825, offsetHeight = 720} -- 2: shitno menu instance 10001
	},	{
		["anim"] = {start = 1, stop = 2, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
