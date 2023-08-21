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

		enemyIcon:animate("wigglytuff", false)

		gameCanvas = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())

		self:load()
	end,

	load = function(self)
		weeksAmusia:load()
		stages["amusia"]:load()

		inst = love.audio.newSource("songs/amusia/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/amusia/Voices.ogg", "stream")

		self:initUI()

		weeksAmusia:setupCountdown()



--inst:seek(150)
--		voices:seek(150)
	end,

	initUI = function(self)
		weeksAmusia:initUI()


		weeksAmusia:generateNotes("songs/amusia/amusia-hard.json")
	end,

	update = function(self, dt)
		weeksAmusia:update(dt)
		stages["amusia"]:update(dt)

		if health >= 1.595 then
			if enemyIcon:getAnimName() == "wigglytuff" .. currentWigglyState then
				enemyIcon:animate("wigglytuff" .. currentWigglyState .. " losing", false)
			end
		else
			if enemyIcon:getAnimName() == "wigglytuff" .. currentWigglyState .. " losing" then
				enemyIcon:animate("wigglytuff" .. currentWigglyState, false)
			end
		end

		weeksAmusia:checkSongOver()

		weeksAmusia:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.setCanvas(gameCanvas)
			love.graphics.push()
				love.graphics.translate(1280 / 2, 720 / 2)
				love.graphics.scale(camera.zoom, camera.zoom)

				stages["amusia"]:draw()
			love.graphics.pop()
		love.graphics.setCanvas()

		love.graphics.setShader(camEffect)
		love.graphics.draw(gameCanvas, 0, 0, 0, love.graphics.getWidth() / 1280, love.graphics.getHeight() / 720)
		love.graphics.setShader()

		love.graphics.push()
			love.graphics.scale(love.graphics.getWidth() / 1280, love.graphics.getHeight() / 720)
			if doneFlash and not questionare then
				weeksAmusia:drawUI()
			end
			love.graphics.setColor(1,1,1,amusiaAlphaValues[9])
			love.graphics.rectangle("fill", -1000, -1000, 10000, 10000)
			love.graphics.setColor(1,1,1,1)
		love.graphics.pop()
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
