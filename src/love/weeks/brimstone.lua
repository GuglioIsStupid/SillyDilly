local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		weeksBrimstone:enter("pixel")

		stages["stage"]:enter()

		song = songNum
		difficulty = songAppend

		enemyIcon:animate("daddy dearest", false)
        
        camera.camBopIntensity = 0

        camWow = {
            x = 0,
            y = 0,
        }

        bg = graphics.newImage(graphics.imagePath("buried/brimstoneBack"))
        floor = graphics.newImage(graphics.imagePath("buried/floor"))
        graves = graphics.newImage(graphics.imagePath("buried/graves"))
        shadow = graphics.newImage(graphics.imagePath("pixel/shadow"))

        rectanglesXYWH = {}
        for i = 1, 20 do
            table.insert(rectanglesXYWH, {x = 0, y = -40 + 40 * i, width =  graphics.getWidth(), height = 40})
        end

        function shakeCam()
            if wowwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww then
                Timer.cancel(wowwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww)
            end
            wowwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww = Timer.tween(0.025, camWow, {x = camWow.x + 11}, "in-out-cubic", function()
                Timer.tween(0.025, camWow, {x = camWow.x - 19}, "linear", function()
                    Timer.tween(0.025, camWow, {x = camWow.x + 8}, "linear")
                end)
            end)
        end

		function nextSong()
			Gamestate.switch(menuWeek)
		end

		self:load()
	end,

	load = function(self)
		weeksBrimstone:load()
		stages["stage"]:load()

		inst = love.audio.newSource("songs/brimstone/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/brimstone/Voices.ogg", "stream")

		self:initUI()

        for i = 1, #rectanglesXYWH do
            if i % 2 == 0 then
                Timer.tween(2.25, rectanglesXYWH[i], {x = graphics.getWidth()}, "linear",
                function()
                    if i == #rectanglesXYWH then
                        Timer.tween(2.8, boyfriend, {x = -475}, "linear")
                    end
                end)
            else
                Timer.tween(2.25, rectanglesXYWH[i], {x = -graphics.getWidth()}, "linear")
            end
        end

		countingDown = false

		previousFrameTime = love.timer.getTime() * 1000
		musicTime = 0

		if inst then 
			inst:play() 
		end
		voices:play()
        countdownFade = {0}
	end,

	initUI = function(self)
		weeksBrimstone:initUI()

		weeksBrimstone:generateNotes("songs/brimstone/brimstone-hard.json")
	end,

	update = function(self, dt)
		weeksBrimstone:update(dt)
		stages["stage"]:update(dt)

		if health >= 1.595 then
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end

        if musicTime >= 7309.64467005076 and musicTime < 7334.64467005076 then 
            shakeCam()
        end
        if musicTime >= 8527.91878172589 and musicTime < 8552.91878172589 then 
            shakeCam()
        end
        if musicTime >= 9746.19289340102 and musicTime < 9771.19289340102 then 
            shakeCam()
        end
        if musicTime >= 10355.3299492386 and musicTime < 10385.3299492386 then 
            shakeCam()
        end
        if musicTime >= 10964.4670050761 and musicTime < 10989.4670050761 then 
            shakeCam()
        end

		if not (countingDown or graphics.isFading()) and not (inst:isPlaying()) and not paused and not inCutscene then
			if storyMode then
				weeksBrimstone:saveData()
				song = song + 1
				print(song)

				Gamestate.switch(menuWeek)
			else
				weeksBrimstone:saveData()

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
		weeksBrimstone:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

			love.graphics.translate(camWow.x, camWow.y)

            bg:udraw(3.5,3.5)
            floor:udraw(3.5,3.5)
            graves:udraw(3.5,3.5)
		love.graphics.pop()

		weeksBrimstone:drawUI()
	end,

	leave = function(self)
		stages["stage"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

        camera.camBopIntensity = 1

		graphics.clearCache()

		weeksBrimstone:leave()
	end
}
