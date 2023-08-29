

return {
	enter = function(self, previous)
		curWeek = 1

		cartridge1 = love.filesystem.load("sprites/menu/story/HypnoWeek.lua")()
		cartridge2 = love.filesystem.load("sprites/menu/story/LostSilverWeek.lua")()
		cartridge3 = love.filesystem.load("sprites/menu/story/GlitchWeek.lua")()

		gameboy = love.filesystem.load("sprites/menu/story/CampaignBoy.lua")()

		gameboy.sizeX, gameboy.sizeY = 0.7, 0.7
		gameboy.y = 263

		displacementX = 0
		displacementY = 0





		function updateSelection(selection)
		end

		for i = 1,3 do
			_G["cartridge" .. i].angle = 0
			_G["cartridge" .. i]:animate("anim", true)
		end

		gameboy:animate("anim", true)

	


	end,

	update = function(self, dt)
		cartridge1:update(dt)
		cartridge2:update(dt)
		cartridge3:update(dt)
		gameboy:update(dt)

		if curWeek == 1 then
			curWeekString = "Hypno's Lullaby"
		elseif curWeek == 2 then
			curWeekString = "Lost Silver"
		elseif curWeek == 3 then
			curWeekString = "Missingno"
		end


--[
		for i = 1,3 do
			if i == 2 then
				_G["cartridge" .. i].x = _G["cartridge" .. i].x + displacementX
				_G["cartridge" .. i].y = _G["cartridge" .. i].y + displacementY
			end

			currentAngle = -((i - curWeek) * 60)
			_G["cartridge" .. i].angle = util.lerp(_G["cartridge" .. i].angle, currentAngle, 1)
			_G["cartridge" .. i].x = _G["cartridge" .. i].x - math.sin(_G["cartridge" .. i].angle * (math.pi / 180)) * 550
			_G["cartridge" .. i].y = _G["cartridge" .. i].y + math.cos(_G["cartridge" .. i].angle * (math.pi / 180)) * 550
		end


		--[[

		local direction = (left and -1 or 0) + (right and 1 or 0)
		if math.abs(direction) > 0 then
			if moverCooldown <= 0 then
				--]]



		if not graphics.isFading() then

			if input:pressed("left") then
				curWeek = curWeek - 1
				if curWeek < 1 then
					curWeek = 3
				end

				updateSelection(curWeek)
			elseif input:pressed("right") then
				curWeek = curWeek + 1
				if curWeek > 3 then
					curWeek = 1
				end

				updateSelection(curWeek)
			elseif input:pressed("back") then
				status.setLoading(true)
                graphics:fadeOutWipe(0.7, function()
                    Gamestate.switch(menuSelect)
					status.setLoading(false)

                end)
            
           		audio.playSound(selectSound)


			elseif input:pressed("confirm") then
				graphics:fadeOutWipe(0.7, function()
					displacementX = displacementX + 32
					displacementY = displacementY - 16
					if hypnoMenuTheme:isPlaying() then
						hypnoMenuTheme:stop()
					end
					if CreditsMenuTheme:isPlaying() then
						CreditsMenuTheme:stop()
					end
					if pokedexTheme:isPlaying() then
						pokedexTheme:stop()
					end
					if FreeplayMenuTheme:isPlaying() then
						FreeplayMenuTheme:stop()
					end
					_psychmod = false
					storyMode = true

					Gamestate.switch(weekData[curWeek],1)
					
					status.setLoading(false)
				end)
			elseif input:pressed("gameBack") then


			end
		end




	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			--love.graphics.scale(0.01, 0.01)
			cartridge1:draw()
			cartridge2:draw()
			cartridge3:draw()
			gameboy:draw()
			love.graphics.rectangle("fill", 0 - graphics.getWidth() / 2, 0 - graphics.getHeight() / 2, 2000, 100)
			love.graphics.setColor(0,0,0)
			love.graphics.setFont(pokeFont)
			love.graphics.printf(curWeekString, -graphics.getWidth() / 2, -330, graphics.getWidth(), "center")
			love.graphics.setColor(1,1,1)

		love.graphics.pop()
	end,

	leave = function(self)
		for i = 1,3 do
			_G["cartridge" .. i] = nil
		end
		gameboy = nil
	end
}
-- BALLS