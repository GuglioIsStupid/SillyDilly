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
		weeks:enter("pixel")

		enemyHealthColor = {96.9,87.5,43.5}
		playerHealthColor = {81.2,65.5,68.6}

		stages["shinto"]:enter()

		song = songNum
		difficulty = songAppend
		enemyIcon:animate("shinto", false)

		self:load()
	end,

	load = function(self)
		weeks:load()
		inst = love.audio.newSource("songs/shinto/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/shinto/Voices.ogg", "stream")
		stages["shinto"]:load()

		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes("songs/shinto/shinto-hard.json")

	end,

	update = function(self, dt)
		weeks:update(dt)
		stages["shinto"]:update(dt)

		if health >= 1.595 then
			if enemyIcon:getAnimName() == "shinto" then
				enemyIcon:animate("shinto losing", false)
			end
		else
			if enemyIcon:getAnimName() == "shinto losing" then
				enemyIcon:animate("shinto", false)
			end
		end

		weeks:checkSongOver()

		weeks:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

			stages["shinto"]:draw()
		love.graphics.pop()

		weeks:drawUI()
	end,

	leave = function(self)
		stages["shinto"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeks:leave()
	end
}
