snowIntensTween = nil
snowAmountTween = nil
speedTween = nil

snowIntensity = {0}
snowAmount = {0}

function changeSnowRiser()
	canChangeIntensity = true
end
local function ChangeSnowIntensity(v1, v2)
	local newIntensity = v1 or 0
	local timestep = v2 <= 0 and 1 or v2

	if snowIntensTween then
		Timer.cancel(snowIntensTween)
	end

	canChangeIntensity = true
	
	snowIntensTween = Timer.tween(timestep * beatHandler.stepCrochet/1000, snowIntensity, {newIntensity}, "linear", changeSnowRiser)
end

local function ChangeSnowAmount(v1, v2)
	local newAmount = v1 or 0
	local timestep = v2 <= 0 and 1 or v2

	if snowAmountTween then
		Timer.cancel(snowAmountTween)
	end

	snowAmountTween = Timer.tween(timestep * beatHandler.stepCrochet/1000, snowAmount, {newAmount}, "linear")
end

local function ChangeScrollSpeed(v1, v2)
    local v1 = v1 or 1
    local v2 = v2 or 0

    local newValue = speed * v1

    if speedTween then
        Timer.cancel(speedTween)
    end
    if v2 <= 0 then
        speed = newValue
    else
        -- omg it tweens!!!
        speedTween = Timer.tween(v2 * beatHandler.stepCrochet/1000, _G, {speed = newValue}, "linear")
    end
end

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
            ["thermometer"] = love.filesystem.load("sprites/frostbite/thermometer.lua")(),
            ["thermometer typhlosion"] = love.filesystem.load("sprites/frostbite/typhlosion.lua")(),
            ["test typhlosion"] = love.filesystem.load("sprites/gold/TYPHLOSION_MECHANIC.lua")(),
        }

        debug = false

        

        enemy = love.filesystem.load("sprites/red/mt_silver_red_norm.lua")()
        deadRed = love.filesystem.load("sprites/red/mt_silver_red_dead.lua")()
        boyfriend = love.filesystem.load("sprites/gold/Cold_Gold.lua")()
        typhlosion = love.filesystem.load("sprites/gold/TYPHLOSION_MECHANIC.lua")()

        camera.defaultZoom = 0.8
        camera:addPoint("boyfriend", 184, 192, 0.7, 0.7)
        camera:addPoint("enemy", 184, 192, 0.7, 0.7)
        camera:addPoint("pikachuZoom", 80, 99, 1.7, 1.7)
        boyfriend.x, boyfriend.y = -619, 50
        enemy.x, enemy.y = 369, -201
        enemy.sizeX, enemy.sizeY = 0.7, 0.7
        typhlosion.x, typhlosion.y = -282, 221
        stageImages["blastoise"].x, stageImages["blastoise"].y = -812, -411
        stageImages["blastoise"].sizeX, stageImages["blastoise"].sizeY = 0.4, 0.4
        stageImages["pokemon"].x, stageImages["pokemon"].y = 276, -342
        stageImages["pokemon"].sizeX, stageImages["pokemon"].sizeY = 0.2, 0.2
        deadRed.sizeX, deadRed.sizeY = 0.7, 0.7
        deadRed.x, deadRed.y = 369, -201
        stageImages["pikachu entrance"].x, stageImages["pikachu entrance"].y = 152, -194
        stageImages["pikachu entrance"].sizeX, stageImages["pikachu entrance"].sizeY = 0.9, 0.9
        stageImages["pikachu"].sizeX, stageImages["pikachu"].sizeY = 1.5, 1.5
        stageImages["pikachu"].x, stageImages["pikachu"].y = 2, -106
        stageImages["charizard"].x, stageImages["charizard"].y = 20, -503
        stageImages["charizard"].sizeX, stageImages["charizard"].sizeY = 0.5, 0.5
        stageImages["fog"].x, stageImages["fog"].y = 0, -290
        stageImages["fog"].sizeX, stageImages["fog"].sizeY = 1.8, 1.8
        stageImages["background"].x, stageImages["background"].y = 0, -319

        stageImages["thermometer"].x, stageImages["thermometer"].y = 35, 350
        stageImages["thermometer typhlosion"].x, stageImages["thermometer typhlosion"].y = stageImages["thermometer"].x, stageImages["thermometer"].y -218
    




        typhlosion:animate("idle", true)




        stageImages["pikachu"]:animate("idle", true)
        stageImages["thermometer typhlosion"]:animate("stage1", true)

        if debug then
            stageImages["pikachu entrance"]:animate("anim", true)
        end

        ChangeSnowAmount(75, 0.125)
        ChangeSnowIntensity(0.25, 0.125)

    end,

    load = function()
        coldnessIdk = 0
        changedScrollSpeed = false
        pikachuSpawned = false

        introFade = {1}
        Timer.tween(6, introFade, {0}, "in-expo")

        typhlosion.x, typhlosion.y = -282, 221




        camera.camBopIntensity = 1
        camera.camBopInterval = 4




      --  voices:seek(85)
       -- inst:seek(85)
    end,

    update = function(self, dt)
        deadRed:update(dt)
        typhlosion:update(dt)
        stageImages["test typhlosion"]:update(dt)
        stageImages["thermometer typhlosion"]:update(dt)
        stageImages["pikachu entrance"]:update(dt)
        stageImages["pikachu"]:update(dt)




        --print(musicTime)




        if (not deadRed:isAnimated()) then
            deadRed:animate("idle", false)    -- He isnt supposed to do the idle with the bpm 

        elseif deadRed:getAnimName() ~= enemy:getAnimName() then
            deadRed:animate(enemy:getAnimName())
        end





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
                    Timer.tween(0.6, camera, {defaultZoom = 0.8}, "out-quad")
                    camera:addPoint("boyfriend", 184, 192, 0.7, 0.7)
                    camera:addPoint("enemy", 184, 192, 0.7, 0.7)
                end)
            end)
            camera:moveToPoint(0.5, "pikachuZoom")
        end

       -- --[[    wtf i just learned you can comment out the start of a block comment

        if musicTime >= 90652 and musicTime < 90652+50 then
            --i love how the game doesnt say what the scroll speed changes to so i have to just guess
            -- ermm akthually in the event file it says newValue = PlayState.SONG.speed * val1 🤓🤓🤓

            ChangeScrollSpeed(1.06125, 16)

            print("scroll speed change")
            print("scroll speed: " .. speed)
            camera.camBopIntensity = 3
            camera.camBopInterval = 1
        end

        if musicTime >= 157434.782608696 and musicTime <= 157434.782608696+50 then
            ChangeScrollSpeed(1, 16)
        end

        if musicTime >= 41739.1304347826 and musicTime <=41739.1304347826+50 then
            ChangeSnowIntensity(0.3, 96)
        end
        if musicTime >= 73043.4782608696 and musicTime <= 73043.4782608696+50 then
            ChangeSnowIntensity(0.4, 128)
        end
        if musicTime >= 90782.6086956522 and musicTime <= 90782.6086956522+50 then
            ChangeSnowAmount(150, 1)
        end
        if musicTime >= 90913.0434782609 and musicTime <=90913.0434782609+50 then
            ChangeSnowIntensity(0.45, 1)
        end
        if musicTime >= 179086.956521739 and musicTime <= 179086.956521739+50 then
            ChangeSnowAmount(0, 1)
        end
        if musicTime >= 179217.391304348 and musicTime <= 179217.391304348+50 then
            ChangeSnowIntensity(0, 1)
        end

    --]]
             
             
    end,

    draw = function()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)
            graphics.setColor(1,1,1)
            stageImages["background"]:draw()
            stageImages["pokemon"]:draw()
            stageImages["blastoise"]:draw()
            stageImages["charizard"]:draw()

            if not pikachuSpawned and not stageImages["pikachu entrance"]:isAnimated() then
                enemy:draw()
            else
                if not stageImages["pikachu entrance"]:isAnimated() then
                   deadRed:draw()
                end
            end

            if musicTime < 89739 then
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
            --stageImages["test typhlosion"]:draw()     
            boyfriend:draw()
            stageImages["fog"]:draw()
            love.graphics.setColor(1,1,1,introFade[1])
            love.graphics.rectangle("fill", -1000, -1000, 10000, 10000)
            love.graphics.setColor(1,1,1,1)

		love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end
        camera:reset()

        graphics.clearCache()
    end
}

