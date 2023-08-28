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

		enemyHealthColor = {58.4,37.6,39.6}
		playerHealthColor = {35.7,65.5,72.9}

		stages["isotope"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("glitchyred", false)



		self:load()

		gameCanvas = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())

		redAberration = love.graphics.newShader("shaders/isotope/redAberration.frag")
        redAberration:send("intensity", 1.0)

		glitchVignette = love.graphics.newShader("shaders/isotope/glitchVignette.frag")
		glitchVignette:send("vignetteIntensity", 0.5)
	end,

	load = function(self)
		weeks:load()
		stages["isotope"]:load()

		inst = love.audio.newSource("songs/isotope/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/isotope/Voices.ogg", "stream")

		--voices:seek(140)
        --inst:seek(140)

		self:initUI()


		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		for i = 1,4 do
			enemyArrows[i].x = 2000 -- just put them off screen instead of editing weeks.lua
			boyfriendArrows[i].x = -925 + 165 * i
		end

		weeks:generateNotes("songs/isotope/isotope-hard.json")

		Lyrics.parseLyrics("songs/isotope/lyrics.json")
	end,

	update = function(self, dt)
		weeks:update(dt)
		stages["isotope"]:update(dt)
		Lyrics.update(dt)

		if health >= 1.595 then
			if enemyIcon:getAnimName() == "glitchyred" then
				enemyIcon:animate("glitchyred losing", false)
			end
		else
			if enemyIcon:getAnimName() == "glitchyred losing" then
				enemyIcon:animate("glitchyred", false)
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

	resize = function(self, w, h)
		if canvas then
			canvas = love.graphics.newCanvas(w, h)
		end
	end,

	draw = function(self)
		love.graphics.setCanvas(gameCanvas)
			love.graphics.clear()
			love.graphics.push()
				love.graphics.translate(1280 / 2, 720 / 2)
				love.graphics.scale(camera.zoom, camera.zoom)
				stages["isotope"]:draw()
			love.graphics.pop()
		love.graphics.setCanvas()

		love.graphics.setShader(glitchVignette)
		love.graphics.draw(gameCanvas, 0, 0, 0, love.graphics.getWidth() / 1280, love.graphics.getHeight() / 720)
		love.graphics.setShader()

		love.graphics.push()
			love.graphics.scale(love.graphics.getWidth() / 1280, love.graphics.getHeight() / 720)
			if not sceneHUDHide then      --THIS IS TEMPORARY UNTIL HUD FADE IS ADDED
				weeks:drawUI()
			end

			for i = 1, #Lyrics.drawLyrics do
				Lyrics.drawLyrics[i]:draw()
			end
		love.graphics.pop()
	end,

	leave = function(self)
		stages["isotope"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeks:leave()
	end
}
