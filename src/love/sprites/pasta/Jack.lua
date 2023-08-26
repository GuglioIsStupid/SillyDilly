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
	love.graphics.newImage(graphics.imagePath("pasta/Jack")),
	-- Automatically generated from Jack.xml
	{
		{x = 0, y = 0, width = 322, height = 538, offsetX = 0, offsetY = -4, offsetWidth = 322, offsetHeight = 542}, -- 1: Body with tar instance 10000
		{x = 322, y = 0, width = 316, height = 539, offsetX = -2, offsetY = -3, offsetWidth = 322, offsetHeight = 542}, -- 2: Body with tar instance 10001
		{x = 322, y = 0, width = 316, height = 539, offsetX = -2, offsetY = -3, offsetWidth = 322, offsetHeight = 542}, -- 3: Body with tar instance 10002
		{x = 638, y = 0, width = 314, height = 540, offsetX = -3, offsetY = -2, offsetWidth = 322, offsetHeight = 542}, -- 4: Body with tar instance 10003
		{x = 638, y = 0, width = 314, height = 540, offsetX = -3, offsetY = -2, offsetWidth = 322, offsetHeight = 542}, -- 5: Body with tar instance 10004
		{x = 952, y = 0, width = 314, height = 542, offsetX = -3, offsetY = 0, offsetWidth = 322, offsetHeight = 542}, -- 6: Body with tar instance 10005
		{x = 952, y = 0, width = 314, height = 542, offsetX = -3, offsetY = 0, offsetWidth = 322, offsetHeight = 542}, -- 7: Body with tar instance 10006
		{x = 952, y = 0, width = 314, height = 542, offsetX = -3, offsetY = 0, offsetWidth = 322, offsetHeight = 542}, -- 8: Body with tar instance 10007
		{x = 952, y = 0, width = 314, height = 542, offsetX = -3, offsetY = 0, offsetWidth = 322, offsetHeight = 542}, -- 9: Body with tar instance 10008
		{x = 952, y = 0, width = 314, height = 542, offsetX = -3, offsetY = 0, offsetWidth = 322, offsetHeight = 542} -- 10: Body with tar instance 10009
	},
	{
		["anim"] = {start = 1, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
