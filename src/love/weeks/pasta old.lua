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
		weeksPasta:enter()

		marioHealthColor = {26.3,4.3,2.4}
		sonicHealthColor = {23.9,24.3,36.5}
		hypnoHealthColor = {93.7,83.9,25.5}

		enemyHealthColor = marioHealthColor
		playerHealthColor = sonicHealthColor


		stages["pasta"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("daddy dearest", false)

		self:load()
	end,

	load = function(self)
		weeksPasta:load()
		stages["pasta"]:load()

		inst = love.audio.newSource("songs/pasta-night/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/pasta-night/Voices.ogg", "stream")
	
		self:initUI()

		weeksPasta:setupCountdown()
	end,

	initUI = function(self)
		weeksPasta:initUI()

		weeksPasta:generateNotes("songs/pasta-night/pasta-night-hard.json")
	end,

	update = function(self, dt)
		weeksPasta:update(dt)
		stages["pasta"]:update(dt)

		if musicTime >= 19230 and musicTime < 19230+50 then
			print("pow block")
		end

		if musicTime >= 41923 and musicTime < 41923+50 then
			print("pow block")
		end

		if musicTime >= 50256 and musicTime < 50256+50 then
			print("pow block")
		end

		if musicTime >= 56282 and musicTime < 56282+50 then
			print("pow block")
		end

		if musicTime >= 68076 and musicTime < 68076+50 then
			print("pow block")
		end

		if musicTime >= 74230 and musicTime < 74230+50 then
			print("pow block")
		end

		if musicTime >= 86153 and musicTime < 86153+50 then
			print("pow block")
		end

		if musicTime >= 90769 and musicTime < 90769+50 then
			print("pow block")
		end

		if musicTime >= 94871 and musicTime < 94871+50 then
			print("pow block")
		end

		if musicTime >= 98461 and musicTime < 98461+50 then
			print("pow block")
		end

		if musicTime >= 128205 and musicTime < 128205+50 then
			print("pow block")
		end

		if musicTime >= 134102 and musicTime < 134102+50 then
			print("pow block")
		end

		if musicTime >= 140512 and musicTime < 140512+50 then
			print("pow block")
		end

		if musicTime >= 145641 and musicTime < 145641+50 then
			print("pow block")
		end

		if musicTime >= 150128 and musicTime < 150128+50 then
			print("pow block")
		end

		if musicTime >= 154358 and musicTime < 154358+50 then
			print("pow block")
		end

		if health >= 1.595 then
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end

		weeksPasta:checkSongOver()

		weeksPasta:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

			stages["pasta"]:draw()
		love.graphics.pop()

		weeksPasta:drawUI()
	end,

	leave = function(self)
		stages["pasta"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeksPasta:leave()
	end
}
