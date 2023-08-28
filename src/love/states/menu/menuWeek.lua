

return {
	enter = function(self, previous)
		curWeek = 1


	end,

	update = function(self, dt)
		if not graphics.isFading() then

			if input:pressed("left") then
				curWeek = curWeek - 1
				if curWeek < 1 then
					curWeek = 3
				end
			elseif input:pressed("right") then
				curWeek = curWeek + 1
				if curWeek > 3 then
					curWeek = 1
				end

			elseif input:pressed("confirm") then
				graphics:fadeOutWipe(0.7, function()
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

			end
		end




	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.print(curWeek)
		love.graphics.pop()
	end,

	leave = function(self)

	end
}
-- BALLS