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

		stages["dissension"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("daddy dearest", false)

		self:load()
	end,

	load = function(self)
		weeks:load()
		stages["dissension"]:load()

		inst = love.audio.newSource("songs/dissension/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/dissension/Voices.ogg", "stream")

		self:initUI()

		weeks:setupCountdown()
		sceneHUDHide = true
		introStage = true
		bedroomStage = false
		idfkWhatToCallThisOneStage = false
		changedScrollSpeed = false
		drawStrangle = false
		didBedroomZoom = false
		doneDeath = false
		dissensionAlphaValues = {0,0}
		switchToTheGoofyStageIdk = false
		function startShake(duration, magnitude)
            t, shakeDuration, shakeMagnitude = 0, duration or 1, magnitude or 5
        end

        screenshakex = 0
		shakeMagnitude = 0
        screenshakey = 0




		--[[delete everything under this line

		inst:seek(170)
		voices:seek(170)
		introStage = false
		bedroomStage = false
		idfkWhatToCallThisOneStage = true
		changedScrollSpeed = true
		switchToTheGoofyStageIdk = true
		whatAreYouDoingYouHaveToGoIHitYouOhMyGoshThatShouldBeTheNameWhyDoYouLaughLikeThatIThoughKatherineWasInTheBackNobodyKnowsHowToPlayThatGameYesTheyDoItsNotHardTheresTheHomelessVillageTheresALotOfHomelessPeopleInThsoeTrees()  --named it this cuz i thought it was funny now i dont remember what this does 💀
		sceneHUDHide = false
		drawStrangle = true

--		dissensionAlphaValues[2] = 1


--]]
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes("songs/dissension/dissension-hard.json")

	end,

	update = function(self, dt)
		weeks:update(dt)
		stages["dissension"]:update(dt)

		----[[


		if bedroomStage then
			if mustHitSection then
				if camZoomTween then
					Timer.cancel(camZoomTween)
				end
	
				camZoomTween = Timer.tween(1.25, camera, {defaultZoom = 1.1, zoom = 1.1}, "out-quad")
			elseif not doingScene then
				if camZoomTween then
					Timer.cancel(camZoomTween)
				end
				camZoomTween = Timer.tween(1.25, camera, {defaultZoom = 1.2, zoom = 1.2}, "out-quad")
			end
		end

		--]]


		if health >= 1.595 then
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end


		if musicTime >= 16000 and musicTime < 16000+50 then
			introStage = false
			bedroomStage = true
			idfkWhatToCallThisOneStage = false
			sceneHUDHide = false
			if not didBedroomZoom then
				didBedroomZoom = true
				camera.defaultZoom = 2
				camera.zoom = 2
				Timer.tween(0.8, camera, {defaultZoom = 1.1, zoom = 1.1}, "out-quad")
			end
			camera:addPoint("boyfriend", -96, 26, 1.1, 1.1)
			camera:addPoint("enemy", 53, 55, 1.2, 1.2)

		end

		if musicTime >= 50000 and musicTime < 50000+50 and not switchToTheGoofyStageIdk then
			introStage = false
			bedroomStage = false
			idfkWhatToCallThisOneStage = true
			changedScrollSpeed = true
			switchToTheGoofyStageIdk = true
			camera.camBopIntensity = 2.5
			camera.camBopInterval = 1

			camera.defaultZoom = 1
			camera.zoom = 1
			camera:addPoint("boyfriend", -82, 38, 40, 1.1)  
			camera:addPoint("enemy", -82, 38, 40, 1.1) 
			camera:moveToPoint(0, "boyfriend")
			
			whatAreYouDoingYouHaveToGoIHitYouOhMyGoshThatShouldBeTheNameWhyDoYouLaughLikeThatIThoughKatherineWasInTheBackNobodyKnowsHowToPlayThatGameYesTheyDoItsNotHardTheresTheHomelessVillageTheresALotOfHomelessPeopleInThsoeTrees()  --named it this cuz i thought it was funny now i dont remember what this does 💀
            print("scroll speed before change: " .. speed)
			
			--[[if customScrollSpeed == 1 then
                speed = 4.9
				print("custom scroll off")
            else
                if not changedScrollSpeed then
                    changedScrollSpeed = true
                    speed = speed + 2
					print("custom scroll on")

                end
            end--]]

			if customScrollSpeed == 1 then
                speed = 3
            else
                if not changedScrollSpeed then
                    changedScrollSpeed = true
                    speed = speed + 1.2
                end
            end
            print("scroll speed: " .. speed)
		end

		if musicTime >= 113000 and musicTime < 113000+50 then
			if stevenTimer then
				Timer.cancel(stevenTimer)
			end
			drawStrangle = true
			dissensionAlphaValues = {1,1}
			stevenTimer = Timer.after(0.8, function()
				dissensionAlphaValues = {0, 1}
			end)
		end


		if musicTime >= 130000 and musicTime < 130000+50 then
			if redOverlayTimer then
				Timer.cancel(redOverlayTimer)
			end
			redOverlayTimer = Timer.tween(0.6, dissensionAlphaValues, {[2] = 0}, "linear")
		end


		if musicTime >= 65875 and musicTime < 65875+50 then
			camera.camBopIntensity = 1
			camera.camBopInterval = 4
		end


		if musicTime >= 180000 and musicTime < 180000+50 and not doneDeath then
			doneDeath = true
			dissensionAlphaValues[2] = 1
			Timer.tween(1, dissensionAlphaValues, {[2] = 0}, "linear")

			Timer.tween(1, boyfriend, { y = -756}, "in-quad")
			camera.zoom = camera.zoom + 0.015 * 4
			uiScale.zoom = uiScale.zoom + 0.03 * 4

		end

		weeks:checkSongOver()

		weeks:updateUI(dt)
	end,

	draw = function(self)
		if musicTime < 183625 then
			love.graphics.push()
			if not paused then
				screenshakex = love.math.random(-shakeMagnitude, shakeMagnitude)
				screenshakey = love.math.random(-shakeMagnitude, shakeMagnitude)
				love.graphics.translate(screenshakex, screenshakey)
			end
				love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
				love.graphics.scale(camera.zoom, camera.zoom)

				stages["dissension"]:draw()
				love.graphics.setColor(0,0,0,dissensionAlphaValues[1])

				love.graphics.rectangle("fill",-1000, -1000, 100000, 10000)
			love.graphics.pop()
			if not sceneHUDHide then
				weeks:drawUI()
			end
		end
	end,

	leave = function(self)
		stages["dissension"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeks:leave()
	end
}
