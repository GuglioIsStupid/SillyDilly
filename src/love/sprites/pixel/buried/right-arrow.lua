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
	images.notesp,
	{
		{x = 97, y = 1, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 1: Left Arrow
		{x = 97, y = 32, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 2: Left Arrow On
		{x = 97, y = 65, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 3: Left Arrow Press
		{x = 97, y = 97, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 4: Left Arrow Confirm 1
		{x = 97, y = 129, width = 30, height = 30, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 5: Left Arrow Confirm 2
		{x = 36, y = 160, width = 12, height = 9, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0}, -- 6: Left Hold
		{x = 36, y = 170, width = 12, height = 10, offsetX = 0, offsetY = 0, offsetWidth = 0, offsetHeight = 0} -- 7: Left End
	},
	{
		["off"] = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0},
		["on"] = {start = 2, stop = 2, speed = 0, offsetX = 0, offsetY = 0},
		["press"] = {start = 3, stop = 3, speed = 0, offsetX = 0, offsetY = 0},
		["confirm"] = {start = 4, stop = 5, speed = 24, offsetX = 0, offsetY = 0},
		["hold"] = {start = 6, stop = 6, speed = 0, offsetX = 0, offsetY = 0},
		["end"] = {start = 7, stop = 7, speed = 0, offsetX = 0, offsetY = 0}
	},
	"off",
	false,
	{
		floored = true
	}
)
