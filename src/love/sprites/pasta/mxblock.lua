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
	love.graphics.newImage(graphics.imagePath("pasta/mxblock")),
	-- Automatically generated from mxblock.xml
	{
		{x = 20, y = 20, width = 266, height = 222, offsetX = 0, offsetY = -9, offsetWidth = 266, offsetHeight = 231}, -- 1: BlockIdle0000
		{x = 20, y = 20, width = 266, height = 222, offsetX = 0, offsetY = -9, offsetWidth = 266, offsetHeight = 231}, -- 2: BlockIdle0001
		{x = 306, y = 20, width = 263, height = 223, offsetX = -1, offsetY = -8, offsetWidth = 266, offsetHeight = 231}, -- 3: BlockIdle0002
		{x = 306, y = 20, width = 263, height = 223, offsetX = -1, offsetY = -8, offsetWidth = 266, offsetHeight = 231}, -- 4: BlockIdle0003
		{x = 589, y = 20, width = 252, height = 228, offsetX = -7, offsetY = -2, offsetWidth = 266, offsetHeight = 231}, -- 5: BlockIdle0004
		{x = 589, y = 20, width = 252, height = 228, offsetX = -7, offsetY = -2, offsetWidth = 266, offsetHeight = 231}, -- 6: BlockIdle0005
		{x = 589, y = 20, width = 252, height = 228, offsetX = -7, offsetY = -2, offsetWidth = 266, offsetHeight = 231}, -- 7: BlockIdle0006
		{x = 20, y = 268, width = 251, height = 230, offsetX = -7, offsetY = 0, offsetWidth = 266, offsetHeight = 231}, -- 8: BlockIdle0007
		{x = 20, y = 268, width = 251, height = 230, offsetX = -7, offsetY = 0, offsetWidth = 266, offsetHeight = 231}, -- 9: BlockIdle0008
		{x = 20, y = 268, width = 251, height = 230, offsetX = -7, offsetY = 0, offsetWidth = 266, offsetHeight = 231} -- 10: BlockIdle0009
	},
	{
		["anim"] = {start = 1, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
