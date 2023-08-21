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
	love.graphics.newImage(graphics.imagePath("pasta/GOLD_PASTA_NIGHT")),
	-- Automatically generated from GOLD_PASTA_NIGHT.xml
	{
		{x = 5, y = 5, width = 221, height = 458, offsetX = -1, offsetY = 0, offsetWidth = 222, offsetHeight = 459}, -- 1: GOLD PASTA NIGHT instance 10000
		{x = 5, y = 5, width = 221, height = 458, offsetX = -1, offsetY = 0, offsetWidth = 222, offsetHeight = 459}, -- 2: GOLD PASTA NIGHT instance 10001
		{x = 226, y = 5, width = 218, height = 456, offsetX = -1, offsetY = -2, offsetWidth = 222, offsetHeight = 459}, -- 3: GOLD PASTA NIGHT instance 10002
		{x = 226, y = 5, width = 218, height = 456, offsetX = -1, offsetY = -2, offsetWidth = 222, offsetHeight = 459}, -- 4: GOLD PASTA NIGHT instance 10003
		{x = 444, y = 5, width = 219, height = 456, offsetX = 0, offsetY = -2, offsetWidth = 222, offsetHeight = 459}, -- 5: GOLD PASTA NIGHT instance 10004
		{x = 444, y = 5, width = 219, height = 456, offsetX = 0, offsetY = -2, offsetWidth = 222, offsetHeight = 459}, -- 6: GOLD PASTA NIGHT instance 10005
		{x = 663, y = 5, width = 217, height = 458, offsetX = -1, offsetY = -1, offsetWidth = 222, offsetHeight = 459}, -- 7: GOLD PASTA NIGHT instance 10006
		{x = 663, y = 5, width = 217, height = 458, offsetX = -1, offsetY = -1, offsetWidth = 222, offsetHeight = 459} -- 8: GOLD PASTA NIGHT instance 10007
	},
	{
		["anim"] = {start = 1, stop = 8, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
