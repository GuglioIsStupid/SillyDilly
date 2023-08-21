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
		weeksShitno:enter()

		stages["shitno"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("shitno", false)

		self:load()
	end,

	load = function(self)
		weeksShitno:load()
		stages["shitno"]:load()

		inst = love.audio.newSource("songs/shitno/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/shitno/Voices.ogg", "stream")

		self:initUI()

		weeksShitno:setupCountdown()
	end,

	initUI = function(self)
		weeksShitno:initUI()

		weeksShitno:generateNotes("songs/shitno/shitno-hard.json")
	end,

	update = function(self, dt)
		weeksShitno:update(dt)
		stages["shitno"]:update(dt)



		if health >= 1.595 then
			if enemyIcon:getAnimName() == "shitno" then
				enemyIcon:animate("shitno losing", false)
			end
		else
			if enemyIcon:getAnimName() == "shitno losing" then
				enemyIcon:animate("shitno dearest", false)
			end
		end

		weeksShitno:checkSongOver()

		weeksShitno:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)


			if musicTime < 244916 then
				stages["shitno"]:draw()
			end

			
		love.graphics.pop()

		weeksShitno:drawUI()
	end,

	leave = function(self)
		stages["shitno"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeksShitno:leave()
	end
}
