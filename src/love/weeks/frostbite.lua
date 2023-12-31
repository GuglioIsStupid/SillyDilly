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
		weeksFrostbite:enter()

		enemyHealthColor = {98,49.8,53.3}
		playerHealthColor = {94.9,91,100}

		typlosionSound = love.audio.newSource("sounds/frostbite/TyphlosionUse.ogg", "static")
		typlosionDeath = love.audio.newSource("sounds/frostbite/TyphlosionDeath.ogg", "static")


		local debug = true




		stages["frostbite"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("red", false)

		self:load()

		typhlosionUses = 10

		--inst:setVolume(0)
		--voices:setVolume(0)
		coldness = 0
		doingColdnessTween = false

		coldnessDisplay = {coldness}

		snowfall = love.graphics.newShader("shaders/snowfall.frag")
		
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
				--coldness = coldness - (0.35 * (typhlosionUses * 0.075)) + 0.20          idk how this is supposed to work so im just gonna kinda make something similar, if you can figure out how the real game works you can change this to be more accurate
				if coldness < 140 then
					coldness = 0 
				else
					coldness = coldness - 140
				end
				print("typhlosion uses: " .. typhlosionUses)
				if coldnessTween then
					Timer.cancel(coldnessTween)
				end
				if doingColdnessTween then
					doingColdnessTween = false
				end
				doingColdnessTween = true
				coldnessTween = Timer.tween(1, coldnessDisplay, {coldness}, "out-quad", function()
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

		function nextSong()
			Gamestate.switch(weekData[13],1)
		end


		--coldnessReadout()

		gameCanvas = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())
	end,

	load = function(self)
		weeksFrostbite:load()
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
		weeksFrostbite:initUI()
		for i = 1,4 do
			enemyArrows[i].x = 100 + 165 * i
			boyfriendArrows[i].x = -925 + 165 * i
		end
		weeksFrostbite:generateNotes("songs/frostbite/frostbite-hard.json")

	end,

	update = function(self, dt)
		weeksFrostbite:update(dt)
		stages["frostbite"]:update(dt)

		health = health - (coldness/850) * dt

		snowfall:send("intensity", snowIntensity[1])
		snowfall:send("amount", snowAmount[1])
		snowfall:send("time", musicTime / (beatHandler.stepCrochet*8))

		if coldness < 323 then

			coldness = coldness + 3 * dt
		end

		if not doingColdnessTween then
			coldnessDisplay[1] = coldness
		end
		if doingColdnessTween then
			print(coldnessDisplay[1])
		end

		if health >= 1.595 then
			if enemyIcon:getAnimName() == "red" then
				enemyIcon:animate("red losing", false)
			end
		else
			if enemyIcon:getAnimName() == "red losing" then
				enemyIcon:animate("red", false)
			end
		end

		if input:pressed("space") and not settings.botplay then
			useTyphlosion()
		end

		if settings.botPlay and coldness > 125 and health < 1.3 then
			useTyphlosion()
		end


		if not (countingDown or graphics.isFading()) and not (inst:isPlaying()) and not paused and not inCutscene then
			if storyMode then
				weeksFrostbite:saveData()
				song = song + 1
				print(song)

				Gamestate.switch(weekData[13],1)
			else
				weeksFrostbite:saveData()

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
		weeksFrostbite:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

			stages["frostbite"]:draw()
		love.graphics.pop()

		weeksFrostbite:drawUI()
		love.graphics.scale(uiScale.zoom, uiScale.zoom)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill", stageImages["thermometer"].x-7, stageImages["thermometer"].y + 138, 13, -coldnessDisplay[1])      -- completely full is -322
		love.graphics.setColor(1,1,1,1)

		stageImages["thermometer"]:draw()

		stageImages["thermometer typhlosion"]:draw()

		-- SNOW
		love.graphics.setShader(snowfall)
		love.graphics.draw(gameCanvas, 0, 0, 0, love.graphics.getWidth() / 1280, love.graphics.getHeight() / 720)
		love.graphics.setShader()
	end,

	leave = function(self)
		stages["frostbite"]:leave()
		camera.camBopIntensity = 1
		camera.camBopInterval = 4

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeksFrostbite:leave()
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