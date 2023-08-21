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
	love.graphics.newImage(graphics.imagePath("pasta/Ben_Drowned_BG")),
	-- Automatically generated from Ben_Drowned_BG.xml
	{
		{x = 10, y = 10, width = 226, height = 522, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: ben drowned0000
		{x = 246, y = 10, width = 226, height = 522, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 2: ben drowned looking0000
	},
	{
		["looking down"] = {start = 1, stop = 1, speed = 24, offsetX = 0, offsetY = 0},
		["looking at camera"] = {start = 2, stop = 2, speed = 24, offsetX = 0, offsetY = 0},
	},
	"looking down",
	false
)
