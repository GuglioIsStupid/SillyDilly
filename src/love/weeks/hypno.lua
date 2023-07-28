local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		hypnoWeek:enter()

        enemy = Sprite()
        enemy:setFrames(getSparrow("hypno/Hypno Phase 1 Sheet"))

        enemy:addAnimByPrefix("idle", "Hypno Idle 1", 24, false)

        enemy:addAnimByPrefix("singUP", "Hypno Up", 24, false)
        enemy:addAnimByPrefix("singRIGHT", "Hypno Right", 24, false)
        enemy:addAnimByPrefix("singDOWN", "Final Hypno Down", 24, false)
        enemy:addAnimByPrefix("singLEFT", "Hypno Left", 24, false)
        enemy:addAnimByPrefix("psyshock", "Psyshock Full", 24, false)
		
		enemy:addOffset("idle", 0, 0)
		enemy:addOffset("singUP", -89, 217)
		enemy:addOffset("singLEFT", 144, 22)
		enemy:addOffset("singRIGHT", -338, 93)
		enemy:addOffset("singDOWN", -150, -120)
		enemy:addOffset("psyshock", -312, 22)

		enemy.cameraPosition = {x=-115, y=0}

        enemy:setGraphicSize(math.floor(enemy.width * 1.3))
        enemy:updateHitbox()
		enemy.holdTimer = 0
		enemy.maxHoldTimer = 0.05
        enemy:play("idle")
		enemy.useXML = true

		enemy.y = 50
		enemy.x = -600

		boyfriend = Sprite()
		boyfriend:setFrames(getSparrow("hypno/Hypno Girlfriend"))

		boyfriend:addAnimByPrefix("idle", "gf_idle_not_hypno_2s", 24, false)
		boyfriend:addAnimByPrefix("idle-alt1", "gf_idle_ok_maybe_shes_hypno_2s", 24, false)
		boyfriend:addAnimByPrefix("idle-alt2", "gf_idle_ok_shes_hypno_2s", 24, false)

		boyfriend:addAnimByPrefix("singUP", "gf_up instance 1", 24, false)
		boyfriend:addAnimByPrefix("singLEFT", "gf_left_alt instance 1", 24, false)
		boyfriend:addAnimByPrefix("singRIGHT", "gf_right_better instance 1", 24, false)
		boyfriend:addAnimByPrefix("singDOWN", "gf_down instance 1", 24, false)
		
		boyfriend:addAnimByPrefix("singUPmiss", "gf_up_MISS instance 1", 24, false)
		boyfriend:addAnimByPrefix("singLEFTmiss", "gf_left_alt_MISS instance 1", 24, false)
		boyfriend:addAnimByPrefix("singRIGHTmiss", "gf_right_better_miss instance 1", 24, false)
		boyfriend:addAnimByPrefix("singDOWNmiss", "gf_down_MISS instance 1", 24, false)

		boyfriend:addOffset("idle", -6, 0)
		boyfriend:addOffset("idle-alt1", 5, -8)
		boyfriend:addOffset("idle-alt2", 49, -23)

		boyfriend:addOffset("singUP", -25, 49)
		boyfriend:addOffset("singLEFT", 68, -24)
		boyfriend:addOffset("singRIGHT", -10, -43)
		boyfriend:addOffset("singDOWN", -16, -125)
		boyfriend:addOffset("singUPmiss", -35, 50)
		boyfriend:addOffset("singLEFTmiss", 65, -27)
		boyfriend:addOffset("singRIGHTmiss", -1, -60)
		boyfriend:addOffset("singDOWNmiss", -18, -136)

		boyfriend.cameraPosition = {x=350,y=-100}

		boyfriend.x = 750
		boyfriend.y = 325

		boyfriend.useXML = true

		consistentPosition = {-800, -300}
		resizeBG = 0.7
		camera.defaultZoom = 0.65

		background = Sprite(consistentPosition[1], consistentPosition[2])
		background:load(getImage("hypno/BACKGROUND"))
		background:setGraphicSize(math.floor(background.width * resizeBG))
		background.scrollFactor = {x=0.6, y=0.6}

		grass = Sprite(consistentPosition[1], consistentPosition[2])
		grass:load(getImage("hypno/Behind the clouds and fence"))
		grass:setGraphicSize(math.floor(grass.width * resizeBG))
		grass.scrollFactor = {x=0.7, y=0.7}

		fog = Sprite(consistentPosition[1], consistentPosition[2])
		fog:load(getImage("hypno/Behind the Fence"))
		fog:setGraphicSize(math.floor(fog.width * resizeBG))
		fog.scrollFactor = {x=0.8, y=0.8}

		midground = Sprite(consistentPosition[1], consistentPosition[2])
		midground:load(getImage("hypno/MIDGROUND"))
		midground:setGraphicSize(math.floor(midground.width * resizeBG))

		stageForeground = Sprite(consistentPosition[1] - 100, consistentPosition[2])
		stageForeground:load(getImage("hypno/FOREGROUND TREE"))
		stageForeground:setGraphicSize(math.floor(stageForeground.width * resizeBG))
		stageForeground.scrollFactor = {x=1.2, y=1.2}

		boyfriend.x = boyfriend.x + 200

		enemy.x = enemy.x - 200
        
		song = songNum
		difficulty = songAppend

		camGame = xmlcamera()
		camHUD = xmlcamera()
		camGame.follow = {x=0, y=0}
		camGame.target = {x=0, y=0}

		enemyIcon:animate("daddy dearest", false)

		boyfriend.camera = camGame
		enemy.camera = camGame

		tranceSound = love.audio.newSource("sounds/hypno/Trance.ogg", "stream")
		tranceSound:setLooping(true)
		tranceSound:setVolume(0)
		tranceSound:play()

		self:load()
	end,

	load = function(self)
		hypnoWeek:load()
		stages["stage"]:load()
		drawPend = true

		if song == 3 then
			inst = love.audio.newSource("songs/hypno/lost-cause/Inst.ogg", "stream")
			voices = love.audio.newSource("songs/hypno/lost-cause/Voices.ogg", "stream")

			drawPend = false
			tranceActive = false

			enemy = Sprite()
			enemy:setFrames(getSparrow("hypno/ABOMINATION_HYPNO"))

			enemy:addAnimByPrefix("idle", "idle", 24, true)
			enemy:addAnimByPrefix("singUP", "up", 24, false)
			enemy:addAnimByPrefix("singRIGHT", "right", 24, false)
			enemy:addAnimByPrefix("singDOWN", "down", 24, false)
			enemy:addAnimByPrefix("singLEFT", "left", 24, false)

			enemy:addOffset("idle", 0, 0)
			enemy:addOffset("singLEFT", 115, -69)
			enemy:addOffset("singRIGHT", -3, -27)
			enemy:addOffset("singDOWN", -2, -211)
			enemy:addOffset("singUP", -5, 181)

			enemy:animate("idle", true)

			enemyEntrance = Sprite(585, -155)
			enemyEntrance:setFrames(getSparrow("hypno/ABOMINATION_HYPNO_ENTRANCE"))
			enemyEntrance.alpha = 0

			enemy.cameraPosition = {x=0,y=0}

			enemyEntrance:addAnimByPrefix("anim", "Entrance instance", 24, true)

			enemyJumpscare = Sprite(75, -400)
			enemyJumpscare:setFrames(getSparrow("hypno/hypno_ending_sequence"))
			enemyJumpscare:addAnimByPrefix("ending", "Ending instance 1", 24, false)

			enemyJumpscare.alpha = 0

			background = nil
			midground = nil
			grass = nil
			fog = nil
			stageForeground = nil

			background = Sprite(-450, -400)
			camera.defaultZoom = 0.8
			resizeBG = 1

			background:load(getImage("hypno/cave"))
			background:setGraphicSize(math.floor(background.width * resizeBG))

			enemy.alpha = 0
			enemy.x = 800
			enemy.y = -150

			enemyEntrance.x = 800
			enemyEntrance.y = -150

			boyfriend = Sprite()
			boyfriend:setFrames(getSparrow("hypno/phase_3"))

			boyfriend:addAnimByPrefix("idle", "GF_SHAKING_BF_she_is_like_real_hot_tho_because_she_is_lullaby_girlfriend", 24, false)
			boyfriend:addAnimByPrefix("singUP", "up_GF_SHAKING_BF_she_is_like_real_hot_tho_because0", 24, false)
			boyfriend:addAnimByPrefix("singRIGHT", "right_GF_SHAKING_BF_she_is_like_real_hot_tho_because0", 24, false)
			boyfriend:addAnimByPrefix("singDOWN", "down_GF_SHAKING_BF_she_is_like_real_hot_tho_because0", 24, false)
			boyfriend:addAnimByPrefix("singLEFT", "left_GF_SHAKING_BF_she_is_like_real_hot_tho_because0", 24, false)

			boyfriend:addAnimByPrefix("bfdrop", "GF_SHAKING_BF_drop", 24, false)

			boyfriend:animate("idle")

			boyfriend2 = Sprite()
			boyfriend2:setFrames(getSparrow("hypno/last_stand"))

			boyfriend2:addAnimByPrefix("idle", "Lullaby_GF_Idle_2", 24, false)
			boyfriend2:addAnimByPrefix("singUP", "Lullaby_GF_up0", 24, false)
			boyfriend2:addAnimByPrefix("singRIGHT", "Lullaby_GF_right0", 24, false)
			boyfriend2:addAnimByPrefix("singDOWN", "Lullaby_GF_down0", 24, false)

			boyfriend2:addOffset("idle", 0, 0)
			boyfriend2:addOffset("singLEFT", 4, -5)
			boyfriend2:addOffset("singRIGHT", 2, 1)
			boyfriend2:addOffset("singDOWN", -7, -17)
			boyfriend2:addOffset("singUP", -3, 12)

			boyfriend.x = 150
			boyfriend.y = 650

			camera.defaultZoom = 1

			pendulum = Sprite()
			pendulum:setFrames(getSparrow("hypno/Pendulum_Phase2"))

			pendulumShadow = Sprite()
			pendulumShadow:setFrames(getSparrow("hypno/Pendulum_Phase2"))

			pendulum:addAnimByPrefix("idle", "Pendelum Phase 2", 24, true)
			pendulum:play("idle")
			pendulum:updateHitbox()

			pendulumShadow:addAnimByPrefix("idle", "Pendelum Phase 2", 24, true)
			pendulumShadow:play("idle")
			pendulumShadow:updateHitbox()

			pendulum.x = -75
			pendulumShadow.x = -75

			pendulum.y = -360
			pendulumShadow.y = -360

			pendulum.origin = {x=65, y=0}
			pendulumShadow.origin = {x=65, y=0}

			pendulum.camera = camHUD
			pendulumShadow.camera = camHUD

			pendulumOffset = 0

			pendulumShadow.alpha = 0

			beatInterval = 2

		elseif song == 2 then
			inst = love.audio.newSource("songs/hypno/left-unchecked/Inst.ogg", "stream")
			voices = love.audio.newSource("songs/hypno/left-unchecked/Voices.ogg", "stream")

			enemy = Sprite()
			enemy:setFrames(getSparrow("hypno/Hypno Phase 2 Sheet"))

			enemy:addAnimByPrefix("idle", "Hypno2 Idle", 24, true)
			enemy:addAnimByPrefix("singUP", "Hypno Up Finished", 24, false)
			enemy:addAnimByPrefix("singRIGHT", "Hypno Right Finished", 24, false)
			enemy:addAnimByPrefix("singDOWN", "Hypno Down", 24, false)
			enemy:addAnimByPrefix("singLEFT", "Hypno Left final", 24, false)

			enemy:addOffset("idle", -4, 6)
			enemy:addOffset("singLEFT", 59, -94)
			enemy:addOffset("singRIGHT", 4, -139)
			enemy:addOffset("singDOWN", 11, -348)
			enemy:addOffset("singUP", -3, 141)

			enemy:setGraphicSize(math.floor(enemy.width * 1.3))
			enemy:updateHitbox()

			enemy.x = -600
			enemy.y = -75

			enemy.cameraPosition = {x=-300,y=100}

			enemy:play("idle")

			midground = Sprite(consistentPosition[1], consistentPosition[2])
			midground:load(getImage("hypno/MIDGROUND BLOOD"))
			midground:setGraphicSize(math.floor(midground.width * resizeBG))

			pendulum = Sprite()
			pendulum:setFrames(getSparrow("hypno/Pendulum_Phase2"))

			pendulumShadow = Sprite()
			pendulumShadow:setFrames(getSparrow("hypno/Pendulum_Phase2"))

			pendulum:addAnimByPrefix("idle", "Pendelum Phase 2", 24, true)
			pendulum:play("idle")
			pendulum:updateHitbox()

			pendulumShadow:addAnimByPrefix("idle", "Pendelum Phase 2", 24, true)
			pendulumShadow:play("idle")
			pendulumShadow:updateHitbox()

			pendulum.x = -75
			pendulumShadow.x = -75

			pendulum.y = -360
			pendulumShadow.y = -360

			pendulum.origin = {x=65, y=0}
			pendulumShadow.origin = {x=65, y=0}

			pendulum.camera = camHUD
			pendulumShadow.camera = camHUD

			pendulumOffset = 0

			pendulumShadow.alpha = 0

			beatInterval = 2
		else
			inst = love.audio.newSource("songs/hypno/safety-lullaby/Inst.ogg", "stream")
			voices = love.audio.newSource("songs/hypno/safety-lullaby/Voices.ogg", "stream")
		end

		self:initUI()

		hypnoWeek:setupCountdown()

		thething = 1
	end,

	initUI = function(self)
		hypnoWeek:initUI()

		if song == 3 then
			hypnoWeek:generateNotes("songs/hypno/lost-cause/lost-cause-hard.json")
		elseif song == 2 then
			hypnoWeek:generateNotes("songs/hypno/left-unchecked/left-unchecked-hard.json")
		else
			hypnoWeek:generateNotes("songs/hypno/safety-lullaby/safety-lullaby-hard.json")
			Lyrics.parseLyrics("songs/hypno/safety-lullaby/lyrics.json")
		end
	end,

	update = function(self, dt)
		hypnoWeek:update(dt)
		if enemyEntrance then enemyEntrance:update(dt) end
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

		if song == 3 then
			if musicTime >= 26735.2941176471 and musicTime < 26795.2941176471 and thething == 1 then
				thething = 2
				camera.zooming = false
				tranceNotActiveYet = false
				enemyEntrance.alpha = 1
				enemyEntrance:animate("anim", true, function()
					enemyEntrance.alpha = 0
					enemy.alpha = 1

					enemy.cameraZoom = 0.53

					enemy.cameraPosition = {
						x= 300,
						y= -50
					}

					tranceActive = true
					tranceNotActiveYet = false

					drawPend = true
				end)
				Timer.tween(0.3, camera, {zoom=0.52})

				Timer.after(
					1.5,
					function()
						boyfriend.cameraPosition = {
							x= 200,
							y= -150
						}
						boyfriend.cameraZoom = 0.7
						camera.zooming = true
					end
				)

				Timer.after(
					2,
					function()
						boyfriend:animate("bfdrop", true, function()
							boyfriend = boyfriend2

							boyfriend.x = 375
							boyfriend.y = 690
						end)
					end
				)
			end
		end

		camGame.target.x, camGame.target.y = util.coolLerp(camGame.target.x, camGame.follow.x, 0.04), util.coolLerp(camGame.target.y, camGame.follow.y, 0.04)

		if mustHitSection then
            local midPoint = boyfriend:getMidpoint()
            camGame.follow.x = midPoint.x - 100 - boyfriend.cameraPosition.x
            camGame.follow.y = midPoint.y - 100 + boyfriend.cameraPosition.y
			camera.defaultZoom = boyfriend.cameraZoom or camera.defaultZoom
        else
            local midPoint = enemy:getMidpoint()
            camGame.follow.x = midPoint.x + 150 - enemy.cameraPosition.x
            camGame.follow.y = midPoint.y - 100 - enemy.cameraPosition.y
			camera.defaultZoom = enemy.cameraZoom or camera.defaultZoom
        end

		hypnoWeek:checkSongOver()

		hypnoWeek:updateUI(dt)

		if trance > 1 then
			tranceVolume = (trance - 1) / 2
		else
			tranceVolume = 0
		end

		tranceSound:setVolume(tranceVolume)

		if trance < -0.25 then
			trance = -0.25
		end

		if song ~= 3 then
			if trance >= 0.8 then
				if trance >= 1.6 then
					boyfriend.idleSuffix = "-alt2"
				else
					boyfriend.idleSuffix = "-alt1"
				end
			else
				boyfriend.idleSuffix = ""
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.scale(camera.zoom, camera.zoom)
			
			background:draw()
			if song ~= 3 then
				grass:draw()
				fog:draw()
				midground:draw()
			end

			if enemyJumpscare then enemyJumpscare:draw() end
			enemy:draw()
			if enemyEntrance then enemyEntrance:draw() end
			if song == 1 then
				pendulum:draw()
				pendulumShadow:draw()
			end
			boyfriend:draw()

			if song ~= 3 then
				stageForeground:draw()
			end

		love.graphics.pop()

		if song ~= 1 and drawPend then
			pendulum:draw()
			pendulumShadow:draw()
		end

		graphics.setColor(1,0,0,trance/2)
		love.graphics.rectangle("fill", 0, 0, 1920, 1080)
		graphics.setColor(1,1,1,1)

		hypnoWeek:drawUI()

		for i = 1, #Lyrics.drawLyrics do
			Lyrics.drawLyrics[i]:draw()
		end
	end,

	leave = function(self)
		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		hypnoWeek:leave()
	end
}
