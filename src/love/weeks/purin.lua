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

		enemyHealthColor = {58.8,58.8,58.8}
		playerHealthColor = {100,54.9,0}

		stages["pokecenter"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("jigglypuff", false)

		self:load()
	end,

	load = function(self)
		weeks:load()
		stages["pokecenter"]:load()


		inst = love.audio.newSource("songs/purin/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/purin/Voices.ogg", "stream")


		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes("songs/purin/purin-hard.json")

	end,

	update = function(self, dt)
		weeks:update(dt)
		stages["pokecenter"]:update(dt)


		if health >= 1.595 then
			if enemyIcon:getAnimName() == "jigglypuff" then
				enemyIcon:animate("jigglypuff losing", false)
			end
		else
			if enemyIcon:getAnimName() == "jigglypuff losing" then
				enemyIcon:animate("jigglypuff", false)
			end
		end

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying()) and not paused and not inCutscene then
			if storyMode then
				weeks:saveData()
				song = song + 1
				print(song)

				self:load()
			else
				weeks:saveData()

				status.setLoading(true)

				graphics:fadeOutWipe(
					0.7,
					function()
						Gamestate.switch(menu)

						status.setLoading(false)
					end
				)
			end
		end
		weeks:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

			stages["pokecenter"]:draw()
		love.graphics.pop()

		weeks:drawUI()
	end,

	leave = function(self)
		stages["pokecenter"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeks:leave()
	end
}
