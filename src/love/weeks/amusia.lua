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

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		weeksAmusia:enter()

		stages["amusia"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("daddy dearest", false)

		self:load()
	end,

	load = function(self)
		weeksAmusia:load()
		stages["amusia"]:load()

		inst = love.audio.newSource("songs/amusia/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/amusia/Voices.ogg", "stream")

		self:initUI()

		weeksAmusia:setupCountdown()



	--inst:seek(60)
	--	voices:seek(60)
	end,

	initUI = function(self)
		weeksAmusia:initUI()


		weeksAmusia:generateNotes("songs/amusia/amusia-hard.json")
	end,

	update = function(self, dt)
		weeksAmusia:update(dt)
		stages["amusia"]:update(dt)

		if health >= 1.595 then
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end

		weeksAmusia:checkSongOver()

		weeksAmusia:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

			stages["amusia"]:draw()
		love.graphics.pop()

		weeksAmusia:drawUI()
	end,

	leave = function(self)
		stages["amusia"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeksAmusia:leave()
	end
}
