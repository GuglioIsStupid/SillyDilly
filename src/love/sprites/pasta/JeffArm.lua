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
	love.graphics.newImage(graphics.imagePath("pasta/JeffArm")),
	-- Automatically generated from JeffArm.xml
	{
		{x = 0, y = 0, width = 225, height = 114, offsetX = 0, offsetY = -2, offsetWidth = 226, offsetHeight = 117}, -- 1: Only the arm shit instance 10000
		{x = 225, y = 0, width = 226, height = 116, offsetX = 0, offsetY = -1, offsetWidth = 226, offsetHeight = 117}, -- 2: Only the arm shit instance 10001
		{x = 225, y = 0, width = 226, height = 116, offsetX = 0, offsetY = -1, offsetWidth = 226, offsetHeight = 117}, -- 3: Only the arm shit instance 10002
		{x = 0, y = 116, width = 225, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 4: Only the arm shit instance 10003
		{x = 0, y = 116, width = 225, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 5: Only the arm shit instance 10004
		{x = 225, y = 116, width = 224, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 6: Only the arm shit instance 10005
		{x = 225, y = 116, width = 224, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 7: Only the arm shit instance 10006
		{x = 0, y = 233, width = 225, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 8: Only the arm shit instance 10007
		{x = 0, y = 233, width = 225, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117}, -- 9: Only the arm shit instance 10008
		{x = 225, y = 233, width = 225, height = 117, offsetX = -1, offsetY = 0, offsetWidth = 226, offsetHeight = 117} -- 10: Only the arm shit instance 10009
	},
	{
		["anim"] = {start = 1, stop = 10, speed = 24, offsetX = 0, offsetY = 0},
	},
	"anim",
	false
)
