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

		typlosionSound = love.audio.newSource("sounds/frostbite/TyphlosionUse.ogg", "static")
		typlosionDeath = love.audio.newSource("sounds/frostbite/TyphlosionDeath.ogg", "static")


		stages["frostbite"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("daddy dearest", false)

		self:load()

		typhlosionUses = 10

		--inst:setVolume(0)
		--voices:setVolume(0)
		coldness = 0
		doingColdnessTween = false

		coldnessDisplay = {coldness}


		

		function useTyphlosion()
			if typhlosionUses > 0 then
				if typlosionSound:isPlaying() then
					typlosionSound:stop()
				end
				typlosionSound:play()
				typhlosion:animate("fire", false, function()
					typhlosion:animate("idle", true)
				end)
				typhlosionUses = typhlosionUses - 1
				if typhlosionUses > 8 then
					stageImages["thermometer typhlosion"]:animate("stage2", true)
				elseif typhlosionUses > 6 then
					stageImages["thermometer typhlosion"]:animate("stage3", true)
				elseif typhlosionUses > 4 then
					stageImages["thermometer typhlosion"]:animate("stage4", true)
				elseif typhlosionUses > 2 then
					stageImages["thermometer typhlosion"]:animate("stage5", true)
				elseif typhlosionUses == 0 then
					Timer.tween(1.5, typhlosion, {y = typhlosion.y + 500}, "in-out-quad")  -- why tf is this an in out quad its really like that in the real game
					typlosionDeath:play()
				end
			coldness = coldness - (0.35 * (typhlosionUses * 0.075)) + 0.20
				print("typhlosion uses: " .. typhlosionUses)
				if coldnessTween then
					Timer.cancel(coldnessTween)
				end
				if doingColdnessTween then
					doingColdnessTween = false
				end
				doingColdnessTween = true
				coldnessTween = Timer.tween(0.5, coldnessDisplay, {coldness}, "out-quad", function()
					doingColdnessTween = false
				end)
				print("ACTUAL COLDNESS: " .. coldness)
			end
		end


		function coldnessReadout()
			Timer.after(3, function()
				print(coldness)
				coldnessReadout()
			end)
		end


		coldnessReadout()

		
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
		coldness = 0
		doingColdnessTween = false
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

		if coldness < 323 then

			coldness = coldness + 6 * dt
		end

		if not doingColdnessTween then
			coldnessDisplay[1] = coldness
		end
		if doingColdnessTween then
			print(coldnessDisplay[1])
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

		if input:pressed("space") then
			useTyphlosion()
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


		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill", stageImages["thermometer"].x-7, stageImages["thermometer"].y + 138, 13, -coldnessDisplay[1])      -- completely full is -322
		love.graphics.setColor(1,1,1,1)

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