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
	love.graphics.newImage(graphics.imagePath("pasta/Buds_Slender_Effects")),
	-- Automatically generated from Buds_Slender_Effects.xml
	{
		{x = 0, y = 0, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Slenderman Full0000
		{x = 685, y = 0, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Slenderman Full0001
		{x = 1370, y = 0, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Slenderman Full0002
		{x = 0, y = 696, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Slenderman Full0003
		{x = 685, y = 696, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Slenderman Full0004
		{x = 1370, y = 696, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Slenderman Full0005
		{x = 0, y = 1392, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 7: Slenderman Full0006
		{x = 685, y = 1392, width = 661, height = 672, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 8: Slenderman Full0007
	},
	{
		["anim"] = {start = 1, stop = 8, speed = 24, offsetX = 0, offsetY = 0}
	},
	"anim",
	false
)
