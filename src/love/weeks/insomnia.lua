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
		weeks:enter()

		stages["insomnia"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("silver", false)


		self:load()
	end,

	load = function(self)
		weeks:load()
		stages["insomnia"]:load()

		inst = love.audio.newSource("songs/insomnia/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/insomnia/Voices.ogg", "stream")

		self:initUI()

		weeks:setupCountdown()


		theShitsIdk = {1}
	end,

	initUI = function(self)
		weeks:initUI()
		for i = 1,4 do
			enemyArrows[i].x = -2000
		end

		weeks:generateNotes("songs/insomnia/insomnia-hard.json")

	end,

	update = function(self, dt)
		weeks:update(dt)
		stages["insomnia"]:update(dt)


		if health >= 1.595 then
			if enemyIcon:getAnimName() == "silver" then
				enemyIcon:animate("silver losing", false)
			end
		else
			if enemyIcon:getAnimName() == "silver losing" then
				enemyIcon:animate("silver", false)
			end
		end

		if accuracy then
			if accuracy < 90 then
				camera:moveToPoint(10, "feralisleep")
				camera.mustHit = false
			else
				camera:moveToPoint(1, "boyfriend")
				camera.mustHit = true
			end
		end

		weeks:checkSongOver()

		weeks:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

			stages["insomnia"]:draw()
		love.graphics.pop()

		weeks:drawUI()
	end,

	leave = function(self)
		stages["insomnia"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeks:leave()
	end
}
