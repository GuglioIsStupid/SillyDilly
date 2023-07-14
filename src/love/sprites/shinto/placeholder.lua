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
	love.graphics.newImage(graphics.imagePath("path")),
	--paste shit here
	{
		["singDOWN"] = {start = 0, stop = 0, speed = 24, offsetX = 0, offsetY = 0},
		["singLEFT"] = {start = 0, stop = 0, speed = 24, offsetX = 0, offsetY = 0},
		["singRIGHT"] = {start = 0, stop = 0, speed = 24, offsetX = 0, offsetY = 0},
		["singUP"] = {start = 0, stop = 0, speed = 24, offsetX = 0, offsetY = 0},
		["idle"] = {start = 0, stop = 0, speed = 24, offsetX = 0, offsetY = 0},
	},
	"idle",
	false,
	{
		sing_duration = 6.1,   -- wtf do i put here
		isCharacter = true,
	}
)
