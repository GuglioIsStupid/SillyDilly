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
	love.graphics.newImage(graphics.imagePath("menu/hypno/StartScreen Hypno")),
	-- Automatically generated from StartScreen Hypno.xml
	{
		{x = 20, y = 20, width = 996, height = 1074, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Hypno StartScreen0000
		{x = 20, y = 20, width = 996, height = 1074, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Hypno StartScreen0001
		{x = 1036, y = 20, width = 996, height = 1074, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Hypno StartScreen0002
		{x = 1036, y = 20, width = 996, height = 1074, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 4: Hypno StartScreen0003
	},
	{
		["anim"] = {start = 1, stop = 4, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
