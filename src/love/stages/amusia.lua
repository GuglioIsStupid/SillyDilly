pincushionShaderIntensity = 0.0125
local staticOverlayAlpha = {0}
hoverFactor = 0
horizontalFactor = 0
finishedRotating = false
rotating = false

local function flipStrum(startX, strum)
    local xpos = {}
    for i = 1, #strum do
        xpos[i] = startX + 165 * i
    end

    for i = 1, #strum do
        Timer.tween(beatHandler.stepCrochet/1000 * 16, strum[i], {x = xpos[i]}, "in-out-circ")
    end
end
return {
    enter = function()
        stageImages = {
            ["backgroundGreen"] = graphics.newImage(graphics.imagePath("amusia/background")),
		    ["backgroundPurple"] = graphics.newImage(graphics.imagePath("amusia/background2")),
		    ["jumpscare"] = graphics.newImage(graphics.imagePath("amusia/jumpscare")),
            ["platform"] = graphics.newImage(graphics.imagePath("amusia/Purple_place")),
            ["platform2"] = graphics.newImage(graphics.imagePath("amusia/Purple_place")),
            ["half platform"] = graphics.newImage(graphics.imagePath("amusia/Purple_place_half_part")),
            ["questionare"] = graphics.newImage(graphics.imagePath("amusia/questionare"))
        }


        enemy = love.filesystem.load("sprites/amusia/WigglesTerrorUneashed.lua")()
        boyfriend = love.filesystem.load("sprites/amusia/ponyta_perspective.lua")()



        pincushionShader = love.graphics.newShader("shaders/pincushion.frag")
        pincushionShader:send("distort", 1.5)


        enemy1 = love.filesystem.load("sprites/amusia/wiggles_glitchy.lua")()
        enemy1.x, enemy1.y = -130, 129
        enemy1.sizeX, enemy1.sizeY = 1.2, 1.2
        enemy2 = love.filesystem.load("sprites/amusia/The_death_stare.lua")()
        enemy3 = love.filesystem.load("sprites/amusia/WigglesTerrorUneashed.lua")()


        enemy3.x, enemy3.y = 477, -113
        enemy3.sizeX, enemy3.sizeY = 0.6, 0.6
        boyfriend1 = love.filesystem.load("sprites/amusia/PONYTA.lua")()
        boyfriend1.sizeX, boyfriend1.sizeY = 0.9, 0.9
        boyfriend1.x, boyfriend1.y = 433, -62
       -- boyfriend2 = love.filesystem.load("sprites/amusia/Ponyta_Scared.lua")()     -- this one is unused
        boyfriend2 = boyfriend1  -- it stil needs to exists so that the weeks file works (i dont feel like going back and changing all the for statements from 3 to 2) this doesnt eat any ram this way anyway so its fine
        boyfriend3 = love.filesystem.load("sprites/amusia/ponyta_perspective.lua")()
        green = true

        enemy2.x, enemy2.y = 448, -76
        boyfriend3.x, boyfriend3.y = -166, 181
        boyfriend3.sizeX, boyfriend3.sizeY = 1.2,1.2
        enemy2.sizeX, enemy2.sizeY = 0.6, 0.6


        camera:addPoint("enemy", 0, 0, 1, 1)
        camera:addPoint("boyfriend", -242, 45, 1.2, 1.2)
--[[
        platformPositions = {     -- this is how i wish it could be but it cant because im too dumb to make this work :(
            {-150, 307, 1},
            {452, 37, 0.6}
        }
--]]

        platformPositions = {
            -150, 307, 1,
            452, 37, 0.6
        }
        amusiaAlphaValues = {0,0,0,0,0,0,0,0,0}

        function WigglesChange(myHardCock)
            local wigglyState = myHardCock
            currentWigglyState = wigglyState

            if currentWigglyState == 1 then
                pincushionShaderIntensity = 0.05
            elseif currentWigglyState == 2 then
                pincushionShaderIntensity = 0.125 
            elseif currentWigglyState == 3 then
                pincushionShaderIntensity = 0.5
            else
                pincushionShaderIntensity = 0.0125
            end

            print("WiggleChange(" ..currentWigglyState .. ")")
        end
        flashes = 4


        function introFlash()
            flashes = flashes - 1
            doingFlash = true
            print("start flash")
            Timer.tween(0.3125, amusiaAlphaValues, {[6] = 0.5}, "linear", function()
                Timer.tween(0.3125, amusiaAlphaValues, {[6] = 0}, "linear", function()
                    if flashes > 0 then
                        introFlash()
                        print("continue flash")
                    elseif flashes == 0 then
                        print("end flash")
                        doneFlash = true
                        amusiaAlphaValues[9] = 1
                        Timer.tween(0.5, amusiaAlphaValues, {[9] = 0}, "linear")
                    end
                    doingFlash = false
                    print(flashes)
                end)
            end)
        end
    end,

    load = function()
        doneWigglyTween = false
        donePonytaTween = false

        green = true
        currentWigglyState = 0
        doneSwitch = false
        flashes = 4
        doneFlash = false

        doneIntro = false
        amusiaAlphaValues = {1,1,0,0,0,0,0,0,0}
        camera:addPoint("enemy", -66, -1, 1, 1)
        camera:addPoint("boyfriend", -66, -1, 1.2, 1.2)
        didTransition = false

        staticOverlayAlpha = {0}
        hoverNotes = false
        hoverFactor = 0
        finishedRotating = false
        horizontalFactor = 0
        camera:moveToPoint(0,"enemy")
    end,

    update = function(self, dt) 


        if musicTime >= 2666 and musicTime < 2666+50 then
            camera:addPoint("enemy", 0, 0, 1, 1)
            camera:addPoint("boyfriend", -242, 45, 1.2, 1.2)
            camera:moveToPoint(1,"enemy")
        end



        if musicTime >= 1333 and not doneWigglyTween then
            amusiaAlphaValues[7] = 1
            doneWigglyTween = true
            enemyPos = enemy1.x
            enemy1.x = enemy1.x + 1200
            Timer.tween(0.5, enemy1, {x = enemy1.x - 1200}, "out-quad")
        end

        if musicTime >= 1999 and not donePonytaTween then
            amusiaAlphaValues[8] = 1
            donePonytaTween = true
            playerPos = boyfriend1.x
            boyfriend1.x = boyfriend1.x - 1200
            Timer.tween(0.5, boyfriend1, {x = boyfriend1.x + 1200}, "out-quad")
        end

        if musicTime >= 01 and not doneIntro then
            doneIntro = true
            introFlash()
        end


       -- if doingFlash then
        --    print(amusiaAlphaValues[6])
        --end
        pincushionShader:send("prob", pincushionShaderIntensity)
        pincushionShader:send("time", musicTime / (beatHandler.stepCrochet * 8))


        for i = 1,3 do
            if not _G["enemy" .. i]:isAnimated() and beatHandler.onBeat() then
                _G["enemy" .. i]:animate(currentWigglyState .. "idle")
            end
        end

       -- if not boyfriend1:isAnimated() then
       --     --boyfriend1:animate("idle")  -- to keep the fire always animating (it looks terrible otherwise)     nvm it looks even worse like this 
        --end

        --enemy2.x, enemy2.y = boyfriend1.x, boyfriend1.y
        --boyfriend3.x, boyfriend3.y = enemy1.x, enemy1.y

        if hoverNotes then
            if hoverFactor < 24 then
                hoverFactor = hoverFactor + 4 * dt
            end
            for i = 1, 4 do
                for j = 1, #boyfriendNotes[i] do
                    boyfriendNotes[i][j].offsetY2 = (hoverFactor/2) + math.sin((musicTime / ((beatHandler.stepCrochet*8) - i)) * math.pi) * hoverFactor
                end
                boyfriendArrows[i].offsetY2 = (hoverFactor/2) + math.sin((musicTime / ((beatHandler.stepCrochet*8) - i)) * math.pi) * hoverFactor
                for j = 1, #enemyNotes[i] do
                    enemyNotes[i][j].offsetY2 = (hoverFactor/2) + math.sin((musicTime / ((beatHandler.stepCrochet*8) - i)) * math.pi) * hoverFactor
                end
                enemyArrows[i].offsetY2 = (hoverFactor/2) + math.sin((musicTime / ((beatHandler.stepCrochet*8) - i)) * math.pi) * hoverFactor
            end 

            if finishedRotating then
                if horizontalFactor < 64 then
                    horizontalFactor = horizontalFactor + 8 * dt
                end
                for i = 1, 4 do
                    for j = 1, #boyfriendNotes[i] do
                        boyfriendNotes[i][j].offsetX2 = -math.cos((musicTime/ ((beatHandler.stepCrochet*16))) * math.pi) * horizontalFactor
                    end
                    boyfriendArrows[i].offsetX2 = -math.cos((musicTime/ ((beatHandler.stepCrochet*16))) * math.pi) * horizontalFactor
                    for j = 1, #enemyNotes[i] do
                        enemyNotes[i][j].offsetX2 = -math.cos((musicTime/ ((beatHandler.stepCrochet*16))) * math.pi) * horizontalFactor
                    end
                    enemyArrows[i].offsetX2 = -math.cos((musicTime/ ((beatHandler.stepCrochet*16))) * math.pi) * horizontalFactor
                end
            end
        end

        if doneSwitch then
            if not mustHitSection then
                if camZoomTween then
                    Timer.cancel(camZoomTween)
                end
                camZoomTween = Timer.tween(1.25, camera, {defaultZoom = 1.2, zoom = 1.2}, "out-quad")
               -- print("camera pointed at enemy and zoomed in")
            else
                if camZoomTween then
                    Timer.cancel(camZoomTween)
                end
                camZoomTween = Timer.tween(1.25, camera, {defaultZoom = 1, zoom = 1}, "out-quad")
               -- print("camera pointed at enemy and zoomed out")
            end
        else
            if mustHitSection then
                if camZoomTween then
                    Timer.cancel(camZoomTween)
                end
                camZoomTween = Timer.tween(1.25, camera, {defaultZoom = 1.2, zoom = 1.2}, "out-quad")
                --print("camera pointed at player and zoomed in")
            else
                if camZoomTween then
                    Timer.cancel(camZoomTween)
                end
                camZoomTween = Timer.tween(1.25, camera, {defaultZoom = 1, zoom = 1}, "out-quad")
              --  print("camera pointed at enemy and zoomed out")
            end
        end


        if musicTime >= 45250 and musicTime < 45250+50 then
            green = false
            pincushionShaderIntensity = 0.75
            print("purple")
        end

        if musicTime > 66166 and not doneSwitch then
            doneSwitch = true
            print("switch")
            camera:addPoint("boyfriend", -51, 53, 1, 1)
            camera:addPoint("enemy", -242, 45, 1.2, 1.2)

            Timer.tween((beatHandler.stepCrochet / 1000) * 8, platformPositions, {[1] = platformPositions[1]+1200, [4] = platformPositions[4]-1200}, "in-quad", function()
                enemy2.x = enemy2.x - 1200
                boyfriend3.x = boyfriend3.x + 1200
                Timer.after((beatHandler.stepCrochet / 1000) * 8, function()
                    Timer.tween((beatHandler.stepCrochet / 1000) * 8, platformPositions, {[1] = platformPositions[1]-1200, [4] = platformPositions[4]+1200}, "out-quad")
                    amusiaAlphaValues[4] = 1
                    amusiaAlphaValues[3] = 1
                    Timer.tween((beatHandler.stepCrochet / 1000) * 8, enemy2, {x = enemy2.x + 1200}, "out-quad")
                    Timer.tween((beatHandler.stepCrochet / 1000) * 8, boyfriend3, {x = boyfriend3.x - 1200}, "out-quad")
                end)
            end)
            Timer.tween((beatHandler.stepCrochet / 1000) * 8, enemy1, {x = enemy1.x + 1200}, "in-quad", function()
                amusiaAlphaValues[2] = 0
                print(dump(amusiaAlphaValues))
            end)
            Timer.tween((beatHandler.stepCrochet / 1000) * 8, boyfriend1, {x = boyfriend1.x - 1200}, "in-quad", function()
                amusiaAlphaValues[1] = 0
                print(dump(amusiaAlphaValues))
            end)
        end


        if musicTime >= 109333 and musicTime < 109333+50 then
            amusiaAlphaValues[3] = 0
            amusiaAlphaValues[5] = 1
            print(dump(amusiaAlphaValues))
            camera:addPoint("enemy", -454, 14, 45, 1.3, 1.3)
        end


        if musicTime >= 8000 and musicTime < 8000+50 then
            WigglesChange(1)
        end
        if musicTime >= 10666 and musicTime < 10666+50 then
            WigglesChange(2)
        end
        if musicTime >= 13333 and musicTime < 13333+50 then
            WigglesChange(0)
        end
        if musicTime >= 20000  and musicTime < 20000+50 then
            WigglesChange(1)
        end
        if musicTime >= 21833 and musicTime < 21833+50 then
            WigglesChange(2)
        end
        if musicTime >= 23083 and musicTime < 23083+50 then
            WigglesChange(3)
        end
        if musicTime >= 24000 and musicTime < 24000+50 then
            WigglesChange(0)
        end
        if musicTime >= 25333 and musicTime < 25333+50 then
            WigglesChange(0)
        end
        if musicTime >= 26166 and musicTime < 26166+50 then
            WigglesChange(1)
        end
        if musicTime >= 27166 and musicTime < 27166+50 then
            WigglesChange(1)
        end
        if musicTime >= 28000 and musicTime < 28000+50 then
            WigglesChange(2)
        end
        if musicTime >= 29333 and musicTime < 29333+50 then
            WigglesChange(0)
        end
        if musicTime >= 34666 and musicTime < 34666+50 then
            WigglesChange(3)
        end
        if musicTime >= 35333 and musicTime < 35333+50 then
            WigglesChange(2)
        end
        if musicTime >= 36000 and musicTime < 36000+50 then
            WigglesChange(1)
        end
        if musicTime >= 37833 and musicTime < 37833+50 then
            WigglesChange(2)
        end
        if musicTime >= 38583 and musicTime < 38583+50 then
            WigglesChange(1)
        end
        if musicTime >= 38666 and musicTime < 38666+50 then
            WigglesChange(0)
        end
        if musicTime >= 39500 and musicTime < 39500+50 then
            WigglesChange(0)
        end
        if musicTime >= 40000 and musicTime < 40000+50 then
            WigglesChange(0)
        end
        if musicTime >= 45333 and musicTime < 45333+50 then
            WigglesChange(2)
        end
        if musicTime >= 46666 and musicTime < 46666+50 then
            WigglesChange(3)
        end
        if musicTime >= 48000 and musicTime < 48000+50 then
            WigglesChange(2)
        end
        if musicTime >= 50666 and musicTime < 50666+50 then
            WigglesChange(1)
        end
        if musicTime >= 51333 and musicTime < 51333+50 then
            WigglesChange(2)
        end
        if musicTime >= 51750 and musicTime < 51750+50 then
            WigglesChange(1)
        end
        if musicTime >= 56000 and musicTime < 56000+50 then
            WigglesChange(0)
        end
        if musicTime >= 56666 and musicTime < 56666+50 then
            WigglesChange(1)
        end
        if musicTime >= 57333 and musicTime < 57333+50 then
            WigglesChange(0)
        end
        if musicTime >= 58000 and musicTime < 58000+50 then
            WigglesChange(1)
        end
        if musicTime >= 58166 and musicTime < 58166+50 then
            WigglesChange(2)
        end
        if musicTime >= 58333 and musicTime < 58333+50 then
            WigglesChange(3)
        end
        if musicTime >= 60500 and musicTime < 60500+50 then
            WigglesChange(3)
        end
        if musicTime >= 60583.3333333334 and musicTime < 60583.3333333334+50 then
            ChromaticRiser(1.5, 8)
        end
        if musicTime >= 61000 and musicTime < 61000+50 then
            WigglesChange(1)
        end
        if musicTime >= 61331 and musicTime < 61331+50 then
            WigglesChange(3)
            ChromaticRiser(0, 0.1)
        end

        if musicTime >= 66666.6666666667 and musicTime <= 66666.6666666667+50 and not didTransition then
            didTransition = true

            Timer.tween(beatHandler.stepCrochet/1000 * 8, staticOverlayAlpha, {1}, "in-circ", function()
                pincushionShaderIntensity = 1.25
                for i = 1, 4 do
                    for j = 1, #boyfriendNotes[i] do
                        Timer.tween(beatHandler.stepCrochet/1000 * 16, boyfriendNotes[i][j], {rotation = 360}, "in-out-cubic")
                    end
                    Timer.tween(beatHandler.stepCrochet/1000 * 16, boyfriendArrows[i], {rotation = 360}, "in-out-cubic")

                    for j = 1, #enemyNotes[i] do
                        Timer.tween(beatHandler.stepCrochet/1000 * 16, enemyNotes[i][j], {rotation = 360}, "in-out-cubic")
                    end
                    Timer.tween(beatHandler.stepCrochet/1000 * 16, enemyArrows[i], {rotation = 360}, "in-out-cubic", function()
                        for i = 1, 4 do
                            for j = 1, #boyfriendNotes[i] do
                                boyfriendNotes[i][j].rotation = 0
                            end
                            boyfriendArrows[i].rotation = 0
                            for j = 1, #enemyNotes[i] do
                                enemyNotes[i][j].rotation = 0
                            end
                            enemyArrows[i].rotation = 0
                        end
                    end)
                end

                hoverNotes = true

                flipStrum(-925, boyfriendArrows)
                flipStrum(100, enemyArrows)
            end)
        end

        if musicTime >= 67333.3333333334 and musicTime < 67333.3333333334+50 then
            ChromaticRiser(1.15, 8)
        end

        if musicTime >= 108666.666666667 and musicTime < 108666.666666667+50 then
            ChromaticRiser(0, 8)
        end

        if musicTime >= 169666.666666667 and musicTime <= 169666.666666667+50 then
            runningAway = true
        end


        -- STEP STUFF
        if beatHandler.onStep then
            if not runningAway then 
                if beatHandler.curStep % 32 == 0 and not rotating and musicTime >= 109333 then
                    rotating = true
                    finishedRotating = true
                    for i = 1, 4 do
                        for j = 1, #boyfriendNotes[i] do
                            Timer.tween(beatHandler.stepCrochet/1000 * 8, boyfriendNotes[i][j], {rotation = 360}, "in-out-cubic")
                        end
                        Timer.tween(beatHandler.stepCrochet/1000 * 8, boyfriendArrows[i], {rotation = 360}, "in-out-cubic")

                        for j = 1, #enemyNotes[i] do
                            Timer.tween(beatHandler.stepCrochet/1000 * 8, enemyNotes[i][j], {rotation = 360}, "in-out-cubic")
                        end
                        Timer.tween(beatHandler.stepCrochet/1000 * 8, enemyArrows[i], {rotation = 360}, "in-out-cubic", function() 
                            rotating = false 
                            for i = 1, 4 do
                                for j = 1, #boyfriendNotes[i] do
                                    boyfriendNotes[i][j].rotation = 0
                                end
                                boyfriendArrows[i].rotation = 0
                                for j = 1, #enemyNotes[i] do
                                    enemyNotes[i][j].rotation = 0
                                end
                                enemyArrows[i].rotation = 0
                            end
                        end)
                    end
                end
            end
        end
    end,

    draw = function()
        love.graphics.push()
			love.graphics.translate(camera.x * 0.2, camera.y * 0.2)
            love.graphics.translate(camera.ex * 0.2, camera.ey * 0.2)
            love.graphics.setShader(pincushionShader)
            if green then
                stageImages["backgroundGreen"]:draw()
            else
                stageImages["backgroundPurple"]:draw()
            end
            love.graphics.setShader()
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)


            --[[      i cant tween the platform positions with the way i had the platformPositions table set up, but after redoing the platformPositions table this code cant work

            for i = 1,2 do
                stageImages["platform"].x, stageImages["platform"].y = platformPositions[i][1], platformPositions[i][2]
                stageImages["platform"].sizeX, stageImages["platform"].sizeY = platformPositions[i][3], platformPositions[i][3]
                stageImages["platform"]:draw()
            end

            --]]
            stageImages["platform"].x, stageImages["platform"].y = platformPositions[1], platformPositions[2]
            stageImages["platform2"].x, stageImages["platform2"].y = platformPositions[4], platformPositions[5]
            stageImages["platform"].sizeX, stageImages["platform"].sizeY = platformPositions[3], platformPositions[3]
            stageImages["platform2"].sizeX, stageImages["platform2"].sizeY = platformPositions[6], platformPositions[6]





            stageImages["platform2"]:draw()

            stageImages["platform"]:draw()

            love.graphics.setColor(1,1,1,amusiaAlphaValues[1])
			boyfriend1:draw()

            love.graphics.setColor(1,1,1,amusiaAlphaValues[3])
            enemy2:draw()

            love.graphics.setColor(1,1,1,amusiaAlphaValues[5])
            enemy3:draw()

            love.graphics.setColor(1,1,1,amusiaAlphaValues[2])
            enemy1:draw()

            love.graphics.setColor(1,1,1,amusiaAlphaValues[4])
            boyfriend3:draw()


            ----[[

            if not doneFlash then
                love.graphics.setColor(amusiaAlphaValues[6],amusiaAlphaValues[6],amusiaAlphaValues[6],1)
                love.graphics.rectangle("fill", -1000, -1000, 10000, 10000)
                love.graphics.setColor(0,0,0,1)
                love.graphics.setColor(0,0,0,amusiaAlphaValues[7])
                enemy1:draw()
                love.graphics.setColor(0,0,0,amusiaAlphaValues[8])
                boyfriend1:draw()
            end

            --]]
            love.graphics.setColor(1,1,1,1)

        

           -- boyfriend:draw()
          -- enemy:draw()

 

		love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}