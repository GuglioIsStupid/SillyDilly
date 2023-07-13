return {
    enter = function()
        stageImages = {
            ["background"]  = graphics.newImage(graphics.imagePath("stages/mountain/bg")),
            ["blastoise"]  = graphics.newImage(graphics.imagePath("stages/mountain/Blastoise")),
            ["charizard"]  = graphics.newImage(graphics.imagePath("stages/mountain/Charizard")),
            ["fog"]  = graphics.newImage(graphics.imagePath("stages/mountain/fog")),
            ["pokemon"]  = graphics.newImage(graphics.imagePath("stages/mountain/Pokemons")),
            ["pikachu"] = love.filesystem.load("sprites/red/Freakachu.lua")(),
            ["pikachu entrance"] = love.filesystem.load("sprites/red/freakachu_entrance.lua")(),
        }

        debug = false



        enemy = love.filesystem.load("sprites/red/mt_silver_red_norm.lua")()
        deadRed = love.filesystem.load("sprites/red/mt_silver_red_dead.lua")()
        boyfriend = love.filesystem.load("sprites/gold/Cold_Gold.lua")()
        typhlosion = love.filesystem.load("sprites/gold/TYPHLOSION_MECHANIC.lua")()

        camera.defaultZoom = 0.7
        camera:addPoint("boyfriend", 184, 45, 0.7, 0.7)
        camera:addPoint("enemy", 184, 45, 0.7, 0.7)
        camera:addPoint("pikachuZoom", 80, 99, 1.7, 1.7)
        boyfriend.x, boyfriend.y = -730, 233
        enemy.x, enemy.y = 369, -201
        enemy.sizeX, enemy.sizeY = 0.8, 0.8
        typhlosion.x, typhlosion.y = -406, 399
        stageImages["blastoise"].x, stageImages["blastoise"].y = -709, -187
        stageImages["blastoise"].sizeX, stageImages["blastoise"].sizeY = 0.5, 0.5
        stageImages["pokemon"].x, stageImages["pokemon"].y = 276, -342
        stageImages["pokemon"].sizeX, stageImages["pokemon"].sizeY = 0.3, 0.3
        deadRed.sizeX, deadRed.sizeY = 0.8, 0.8
        deadRed.x, deadRed.y = 369, -201
        stageImages["pikachu entrance"].x, stageImages["pikachu entrance"].y = 126, -188
        stageImages["pikachu"].sizeX, stageImages["pikachu"].sizeY = 1.6, 1.6
        stageImages["pikachu"].x, stageImages["pikachu"].y = -44, -85

        stageImages["pikachu"]:animate("idle", true)

        if debug then
            stageImages["pikachu entrance"]:animate("anim", true)
        end

    end,

    load = function()
        coldnessIdk = 0
        changedScrollSpeed = false
        pikachuSpawned = false





        voices:seek(85)
        inst:seek(85)
    end,

    update = function(self, dt)
        deadRed:update(dt)
        typhlosion:update(dt)
        stageImages["pikachu entrance"]:update(dt)
        stageImages["pikachu"]:update(dt)


        if (not deadRed:isAnimated())  and beatHandler.onBeat() then
            deadRed:animate("idle", false)
        elseif deadRed:getAnimName() ~= enemy:getAnimName() then
            deadRed:animate(enemy:getAnimName())
        end


       -- if musicTime >= 89739 and musicTime < 89789 then


          --  89739 summon pikachu
          --  90652 change scroll speed to something idk it doesnt say, change snow amount and intesity (idk what the difference in intensity and amount is but i guess its different)
          --  90695 change camera bop


        if musicTime >= 89739 and musicTime < 89739+50 then
            print("pikachu entrance")
            camera:addPoint("boyfriend", 80, 99, 1.7, 1.7)
            camera:addPoint("enemy", 80, 99, 1.7, 1.7)
            stageImages["pikachu entrance"]:animate("anim", false, function()
                pikachuSpawned = true
                print("pikachu")
            end)
            if pikachuEventCamZoom1 then
                Timer.cancel(pikachuEventCamZoom1)
            end
            pikachuEventCamZoom1 = Timer.tween(0.5, camera, {defaultZoom = 2.5}, "out-quad", function()
                print("timer.after started")
                Timer.after(1, function()
                    print("timer.after finished")
                    Timer.tween(0.6, camera, {defaultZoom = 0.7}, "out-quad")
                    camera:addPoint("boyfriend", 184, 45, 0.7, 0.7)
                    camera:addPoint("enemy", 184, 45, 0.7, 0.7)
                end)
            end)
            camera:moveToPoint(0.5, "pikachuZoom")
        end

        if musicTime >= 90652 and musicTime < 90652+50 then
            --i love how the game doesnt say what the scroll speed changes to so i have to just guess

            if customScrollSpeed == 1 then
                speed = 3
            else
                if not changedScrollSpeed then
                    changedScrollSpeed = true
                    speed = speed + 1.2
                end
            end

            print("scroll speed change")
            print("scroll speed: " .. speed)
        end

             
             
    end,

    draw = function()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)
            graphics.setColor(1,1,1)
            stageImages["background"]:draw()
            stageImages["pokemon"]:draw()
            stageImages["blastoise"]:draw()

            if not pikachuSpawned and not stageImages["pikachu entrance"]:isAnimated() then
                enemy:draw()
            else
                if not stageImages["pikachu entrance"]:isAnimated() then
                    deadRed:draw()
                end
            end

            if musicTime < 89740 then
                enemy:draw()
            else
                if stageImages["pikachu entrance"]:isAnimated() then
                    stageImages["pikachu entrance"]:draw()
                end
            end

            if pikachuSpawned then
                stageImages["pikachu"]:draw()
            end


            if debug then
                love.graphics.setColor(1,1,1,0.6)
                enemy:draw()
                deadRed:draw()
                stageImages["pikachu entrance"]:draw()
                stageImages["pikachu"]:draw()
                love.graphics.setColor(1,1,1,1)
            end

            typhlosion:draw()            
            boyfriend:draw()
            stageImages["fog"]:draw()
		love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}