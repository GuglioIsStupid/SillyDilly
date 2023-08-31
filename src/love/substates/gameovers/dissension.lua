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

		if inst then inst:stop() end
		voices:stop()
		

		dissensionDeath = love.filesystem.load("sprites/gameover/dissension/Red_Game_Over_Assets_culosfortnite.lua")()
		dissensionDeath:animate("death", false, function()
			dissensionDeath:animate("loop", true)
		end)

		Timer.clear()

	end,

	update = function(self, dt)
		dissensionDeath:update(dt)

		if input:pressed("confirm") or pauseRestart then
			pauseRestart = false
			if inst then inst:stop() end -- In case inst is nil and "confirm" is pressed before game over music starts

			dissensionDeath:animate("confirm", false)

			if not pixel then
				inst = love.audio.newSource("music/game-over-end.ogg", "stream")
			else
				inst = love.audio.newSource("music/pixel/game-over-end.ogg", "stream")
			end
			inst:play()

			Timer.clear()


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

					Gamestate.switch(menuWeek)

					status.setLoading(false)

					if not music:isPlaying() then
						music:play()
					end
				end
			)
		end

	end,

	draw = function(self)

		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
				love.graphics.scale(camera.zoom, camera.zoom)
				love.graphics.translate(camera.x, camera.y)
				dissensionDeath:draw()

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
