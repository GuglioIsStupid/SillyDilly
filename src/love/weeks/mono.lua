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
		weeksMono:enter()

		enemyHealthColor = {83.9,83.9,83.9}
		playerHealthColor = {45.1,75.3,82.7}

		stages["mono"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("gold", false)

		function nextSong()
			Gamestate.switch(menuWeek)
		end

		self:load()
	end,

	load = function(self)
		weeksMono:load()
		stages["mono"]:load()


		inst = love.audio.newSource("songs/monochrome/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/monochrome/Voices.ogg", "stream")

		--inst:seek(135)
        -- nvoices:seek(135)


		self:initUI()

		weeksMono:setupCountdown()
	end,

	initUI = function(self)
		weeksMono:initUI()

		weeksMono:generateNotes("songs/monochrome/monochrome-hard.json")
	end,

	update = function(self, dt)
		weeksMono:update(dt)
		stages["mono"]:update(dt)


		if health >= 1.595 then
			if enemyIcon:getAnimName() == "gold" then
				enemyIcon:animate("gold losing", false)
			end
		else
			if enemyIcon:getAnimName() == "gold losing" then
				enemyIcon:animate("gold", false)
			end
		end

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying()) and not paused and not inCutscene then
			if storyMode then
				weeksMono:saveData()
				song = song + 1
				print(song)

				Gamestate.switch(menuWeek)
			else
				weeksMono:saveData()

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
		weeksMono:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("fill",-1000,-1000,10000,10000)
			love.graphics.setColor(1,1,1)


			stages["mono"]:draw()
		love.graphics.pop()

		weeksMono:drawUI()
		if shakeIntensity == 500 then
			love.graphics.setColor(0,0,0,jumpscareAlpha[1])

			love.graphics.rectangle("fill", -1000, -1000, 10000, 10000)
		end
		love.graphics.setColor(1,1,1,jumpscareAlpha[1])
		if afterTear then
			stageImages["jumpscare2"]:draw()
		else
			stageImages["jumpscare1"]:draw()
		end



	end,

	leave = function(self)
		stages["mono"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeksMono:leave()
	end
}
