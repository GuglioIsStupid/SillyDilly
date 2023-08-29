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

local fromState

return {
	enter = function(self, from)
		graphics.setFade(1)
		fromState = from

		video = love.graphics.newVideo("images/png/gameover/insomnia/feraligatr.ogv")
		video:play()
		if inst then inst:stop() end
		voices:stop()

		Timer.clear()

		videoX = -640
		videoY = -361
		videoSize = 0.67
		--MoveAmount = 1

	end,

	update = function(self, dt)
		if input:pressed("confirm") or pauseRestart then
			pauseRestart = false
			if inst then inst:stop() end -- In case inst is nil and "confirm" is pressed before game over music starts


			Timer.clear()
			
			if feraligatrDeath then
				feraligatrDeath = false
			end

			
			graphics.fadeOut(
				3,
				function()
					Gamestate.pop()

					fromState:load()
				end
			)
		elseif input:pressed("gameBack") then
			status.setLoading(true)

			graphics:fadeOutWipe(
				0.7,
				function()
					Gamestate.pop()
					if storyMode then
						Gamestate.switch(menuWeek)
					else
						Gamestate.switch(menuFreeplay)
					end
					status.setLoading(false)

				end
			)
		end



		--[[               debug shit
		if input:down("gameLeft") then
			videoX = videoX - MoveAmount
		elseif input:down("gameRight") then
			videoX = videoX + MoveAmount
		elseif input:down("gameUp") then
			videoY = videoY - MoveAmount
		elseif input:down("gameDown") then
			videoY = videoY + MoveAmount
		end

		if input:down("space") then
			MoveAmount = 10
		else
			MoveAmount = 1
		end

		if input:pressed("debugZoomOut") then
			videoSize = videoSize - 0.1
		elseif input:pressed("debugZoomIn") then
			videoSize = videoSize + 0.1
		end

		if input:pressed("tab") then
			print("X Position: " .. videoX)
			print("Y Position: " .. videoY)
			print("Size: " .. videoSize)
		end

		--]]

	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			

			love.graphics.rectangle("fill", -1000, -1000, 10000, 10000)

			love.graphics.push()
			love.graphics.draw(video,videoX, videoY, 0, videoSize, videoSize)


			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		Timer.clear()
		graphics.setFade(1)
		if inst then inst:stop() end
		if voices then voices:stop() end
	end
}
