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
LyricMeasure = Object:extend()

Lyrics = {
	parseLyrics = function(lyricsPath)
		local lyrics = json.decode(love.filesystem.read(lyricsPath))

		Lyrics.lyrics = lyrics.lyrics
		table.sort(Lyrics.lyrics, function(a, b) return a.steps[1] < b.steps[1] end)
	end,

	lyrics = {},
	stepsProgression = 0,

	drawLyrics = {},

	update = function(steps)
		if beatHandler.curStep > Lyrics.stepsProgression then
			Lyrics.stepsProgression = beatHandler.curStep
			Lyrics.updateLyrics()
		end
	end,

	currentFocusedLyric =  {},
	currentDivisionAmount = 0,

	updateLyrics = function()
		while (#Lyrics.lyrics > 0 and Lyrics.lyrics[1] ~= nil and Lyrics.lyrics[1].steps[1] < Lyrics.stepsProgression) do
			Lyrics.clearOldText()

			local myLyric = Lyrics.lyrics[1]
			-- lyrics are like this 
			-- Come, /little /Girl/friend...
			local myLyricArray = util.split(myLyric.curString, "/")
			Lyrics.currentDivisionAmount = #myLyricArray
			
			for i, text in ipairs(myLyricArray) do
				local newText = {
					text = text,
					x = 0,
					y = 0,
					width = 0,
					height = 0,
					font = love.graphics.newFont("fonts/poketext.ttf", 20),
					color = {255, 255, 255, 255},
					border = {size = 1.5, color = {0, 0, 0, 255}},
					alignment = "left",
					antialiasing = false,
					scrollFactor = {x = 1, y = 1},
					borderStyle = "outline",

					draw = function(self)
						love.graphics.setFont(self.font)
						love.graphics.setColor(self.color)
						self.width = self.font:getWidth(self.text)
						-- draw border
						if self.borderStyle == "outline" then
							love.graphics.setLineWidth(self.border.size)
							love.graphics.setColor(self.border.color)
							love.graphics.printf(self.text, self.x - self.border.size, self.y - self.border.size, self.width, self.alignment)
							love.graphics.printf(self.text, self.x - self.border.size, self.y + self.border.size, self.width, self.alignment)
							love.graphics.printf(self.text, self.x + self.border.size, self.y - self.border.size, self.width, self.alignment)
							love.graphics.printf(self.text, self.x + self.border.size, self.y + self.border.size, self.width, self.alignment)
						end

						love.graphics.setColor(self.color)
						love.graphics.printf(self.text, self.x, self.y, self.width, self.alignment)
					end
				}
				table.insert(Lyrics.drawLyrics, newText)
			end
			Lyrics.currentFocusedLyric = myLyric
			-- lyrics.splice(lyrics.indexOf(myLyrics), 1);
			table.remove(Lyrics.lyrics, 1)
		end

		if Lyrics.currentFocusedLyric ~= nil then
			local mySteps = Lyrics.currentFocusedLyric.steps

			table.sort(mySteps, function(a, b) return a < b end)

			local totalTextLength = 0
			for i = 1, #Lyrics.drawLyrics do
				totalTextLength = totalTextLength + Lyrics.drawLyrics[i].font:getWidth(Lyrics.drawLyrics[i].text)
			end

			for i = 1, #Lyrics.drawLyrics do
				local text = Lyrics.drawLyrics[i]

				text.x = graphics.getWidth() / 2
				text.y = 534
				text.x = text.x - totalTextLength / 2
				text.color = {255, 255, 255, 255}

				if i > 1 then
					text.x = (Lyrics.drawLyrics[i-1].x + Lyrics.drawLyrics[i-1].font:getWidth(Lyrics.drawLyrics[i-1].text))
				end
			end

			local curDivision = 0
			for i = 1, #mySteps do
				if Lyrics.stepsProgression >= mySteps[i] then
					curDivision = i
				end
			end

			if curDivision-1 < Lyrics.currentDivisionAmount and Lyrics.drawLyrics[curDivision] ~= nil then
				local highlightedLyric = Lyrics.drawLyrics[curDivision]
				highlightedLyric.color = {255, 0, 0, 255}
				highlightedLyric.y = highlightedLyric.y - 4
			else
				if curDivision-1 >= Lyrics.currentDivisionAmount then
					Lyrics.clearOldText()
				end
			end
		end
	end,

	clearOldText = function()
		if #Lyrics.drawLyrics > 0 then
			for i = 1, #Lyrics.drawLyrics do
				Lyrics.drawLyrics[i] = nil
			end
		end

		Lyrics.currentFocusedLyric = nil
	end,
}

return {
	enter = function(self, from, songNum, songAppend)
		weeks:enter()

		stages["isotope"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("daddy dearest", false)



		self:load()
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
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end

		weeks:checkSongOver()

		weeks:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

			stages["isotope"]:draw()
		love.graphics.pop()

		if not sceneHUDHide then      --THIS IS TEMPORARY UNTIL HUD FADE IS ADDED

			weeks:drawUI()
		end

		for i = 1, #Lyrics.drawLyrics do
			Lyrics.drawLyrics[i]:draw()
		end

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
