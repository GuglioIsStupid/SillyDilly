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

		stages["frostbite"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("daddy dearest", false)

		self:load()


		--[[

		function useTyphlosion()
			typlosionSound:play()
			typhlosion:animate("anim", false, function()
				typhlosion:animate("idle", true)
			end)
			typhlosionUses = typhlosionUses - 1
			if typhlosionUses 
		end

		--]]
	end,

	load = function(self)
		weeks:load()
		inst = love.audio.newSource("songs/frostbite/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/frostbite/Voices.ogg", "stream")
		stages["frostbite"]:load()
		self:initUI()
		countingDown = false
		previousFrameTime = love.timer.getTime() * 1000
		musicTime = 0
		beatHandler.reset(0)
		if inst then inst:play() end
		if voices then voices:play() end
		countdownFade[1] = 0
		typhlosionUses = 10
	end,

	initUI = function(self)
		weeks:initUI()
		for i = 1,4 do
			enemyArrows[i].x = 100 + 165 * i
			boyfriendArrows[i].x = -925 + 165 * i
		end
		weeks:generateNotes("songs/frostbite/frostbite-hard.json")

	end,

	update = function(self, dt)
		weeks:update(dt)
		stages["frostbite"]:update(dt)

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

			stages["frostbite"]:draw()
		love.graphics.pop()

		weeks:drawUI()
		love.graphics.scale(uiScale.zoom, uiScale.zoom)

		stageImages["thermometer"]:draw()
		stageImages["thermometer typhlosion"]:draw()
	end,

	leave = function(self)
		stages["frostbite"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeks:leave()
	end
}



--[[
    function useTyphlosion()
    {
        FlxG.sound.play(Paths.sound('TyphlosionUse'));

        typhlosion.playAnim('fire');
        typhlosion.animation.finishCallback = function(name:String)
            typhlosion.playAnim('idle');
        typhlosionUses -= 1;
        switch (typhlosionUses)
        {
            case 8: frostbiteTheromometerTyphlosion.animation.play('stage2');
            case 6: frostbiteTheromometerTyphlosion.animation.play('stage3');
            case 4: frostbiteTheromometerTyphlosion.animation.play('stage4');
            case 2: frostbiteTheromometerTyphlosion.animation.play('stage5');
        }
        coldness -= (0.35 * (typhlosionUses * 0.075)) + 0.20;

        if (typhlosionUses == 0)
            {
                new FlxTimer().start(0.85, function(tmr:FlxTimer)
                    {
                        FlxG.sound.play(Paths.sound('TyphlosionDeath'));
                        typhlosion.playAnim('fire', true);
                        typhlosion.animation.finishCallback = function(name:String)
                            {
                                typhlosion.animation.curAnim.pause();
                            }
                        FlxTween.tween(typhlosion, {y: typhlosion.y + 500}, 1.5, {ease: FlxEase.quadInOut});
                    });
            }
    }

    --]]