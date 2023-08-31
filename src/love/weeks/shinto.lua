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
		weeksShitno:enter("pixel")

		enemyHealthColor = {96.9,87.5,43.5}
		playerHealthColor = {81.2,65.5,68.6}

		stages["shinto"]:enter()

		song = songNum
		difficulty = songAppend
		enemyIcon:animate("shinto", false)

		shintoExitSound = love.audio.newSource("sounds/shinto/ShintoRetry.ogg", "static")


		sshinto = true

		self:load()
	end,

	load = function(self)
		weeksShitno:load()
		inst = love.audio.newSource("songs/shinto/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/shinto/Voices.ogg", "stream")
		stages["shinto"]:load()

		doingShintoGameover = false

		self:initUI()

		weeksShitno:setupCountdown()
	end,

	initUI = function(self)
		weeksShitno:initUI()

		weeksShitno:generateNotes("songs/shinto/shinto-hard.json")

	end,

	update = function(self, dt)
		weeksShitno:update(dt)
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

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying()) and not paused and not inCutscene and not doingShintoGameover then
			if storyMode then
				weeksShitno:saveData()
				song = song + 1
				print(song)




				Gamestate.switch(weekData[12],1)
			else
				weeksShitno:saveData()

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
		weeksShitno:updateUI(dt)


		if health <= 0 and not doingShintoGameover then
			doingShintoGameover = true
			shintoExitSound:play()

			enemy:animate("lose", false, function()
				Gamestate.switch(menu)
				doingShintoGameover = false
				print(doingShintoGameover)
			end)
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

			stages["shinto"]:draw()
		love.graphics.pop()

		weeksShitno:drawUI()
	end,

	leave = function(self)
		stages["shinto"]:leave()

		shintoExitSound = nil

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeksShitno:leave()
	end
}
