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
