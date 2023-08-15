return {
    enter = function()
        stageImages = {
            ["celebi"] = love.filesystem.load("sprites/gold/Celebi_Assets.lua")(),
            ["note"] = love.filesystem.load("sprites/gold/Note_asset.lua")(),
            ["gold head"] = love.filesystem.load("sprites/gold/GoldHead Sheet.lua")(),
            ["no more"] = love.filesystem.load("sprites/gold/GOLD_NO_MORE.lua")(),
            ["head ripping"] = love.filesystem.load("sprites/gold/GOLD_HEAD_RIPPING_OFF.lua")(),
            ["jumpscare1"] = graphics.newImage(graphics.imagePath("monochrome/Gold")),
            ["jumpscare2"] = graphics.newImage(graphics.imagePath("monochrome/GoldAlt"))
        }

        stageImages["jumpscare1"].sizeX, stageImages["jumpscare1"].sizeY = 0.35, 0.35
        stageImages["jumpscare2"].sizeX, stageImages["jumpscare2"].sizeY = 0.35, 0.35

        stageImages["jumpscare1"].x, stageImages["jumpscare1"].y = 650, 350
        stageImages["jumpscare2"].x, stageImages["jumpscare2"].y = 650, 350


        --stageImages["gold head"].x, stageImages["gold head"].y = 4,2
        stageImages["head ripping"].x, stageImages["head ripping"].y = 11, 24

        stageImages["celebi"].sizeX, stageImages["celebi"].sizeY = 0.9, 0.9

        debug = false



        enemy = love.filesystem.load("sprites/gold/Lost Silver Assets Gold.lua")()


        function jumpscare(length,intense)
            shakeIntensity = intense
            stageImages["jumpscare1"].x, stageImages["jumpscare1"].y = 650, 350
            stageImages["jumpscare2"].x, stageImages["jumpscare2"].y = 650, 350
            jumpscareAlpha = {1}
            if jumpscareTween then
                Timer.cancel(jumpscareTween)
            end
            jumpscareTween = Timer.tween(length, jumpscareAlpha, {[1] = 0}, "in-expo")
        end

        function celebi(x,y)
            print("min health before celebi: " .. minHealth[1])
            stageImages["celebi"].x, stageImages["celebi"].y = x,y
            stageImages["note"].x, stageImages["note"].y = x+0,y+0
            stageImages["celebi"]:animate("anim", false)
            stageImages["note"]:animate("anim", false)
            Timer.tween(1, minHealth, {[1] = minHealth[1] + 0.3333}, "linear")
            print("min health after celebi: " .. minHealth[1])

        end


        celebiPos = {
            {-324, 107},
            {-471, -133},
            {-296, -46},
            {-367, 34},
            {-340, -148},
            {328, -90},
            {265, 149},
            {396, 71},
            {314, -106},
            {482, -105}
        }


        jumpscareAlpha = {0}

        afterTear = false
        doingTear = false
        shakeIntensity = 250

        doneCelebi1 = false
        doneCelebi2 = false
        doneCelebi3 = false

        camera:addPoint("boyfriend", -17, 0, 1.1, 1.1)
        camera:addPoint("enemy", -17, 0, 1.1, 1.1)

        camera.defaultZoom = 1.1
        camera.zoom = 1.1


        
     ---   stageImages["celebi"]:animate("anim", true)

      --  stageImages["note"]:animate("anim", true)



    end,

    load = function()
        jumpscareAlpha = {0}

        afterTear = false
        doingTear = false
        shakeIntensity = 250

        doneCelebi1 = false
        doneCelebi2 = false
        doneCelebi3 = false
        
        minHealth = {0}
        camera:moveToPoint(0, "enemy")
        camera.defaultZoom = 1.1
        camera.zoom = 1.1
        

      --  stageImages["celebi"]:animate("anim", true)

        --stageImages["note"]:animate("anim", true)


    end,

    update = function(self, dt)

        stageImages["jumpscare1"].x = stageImages["jumpscare1"].x + love.math.random(shakeIntensity,-shakeIntensity)*dt
        stageImages["jumpscare1"].y = stageImages["jumpscare1"].y + love.math.random(shakeIntensity,-shakeIntensity)*dt
        stageImages["jumpscare2"].x = stageImages["jumpscare2"].x + love.math.random(shakeIntensity,-shakeIntensity)*dt
        stageImages["jumpscare2"].y = stageImages["jumpscare2"].y + love.math.random(shakeIntensity,-shakeIntensity)*dt

        if musicTime < 50 then
            enemy:animate("spawn", false,  function()
                enemy:animate("idle", false)
            end)
        end


        randomNum = love.math.random(1, #celebiPos)

        if musicTime >= 34500 and not doneCelebi1 then
            doneCelebi1 = true
            celebi(celebiPos[randomNum][1],celebiPos[randomNum][2])
        end

        if musicTime >= 76500 and not doneCelebi2 then
            doneCelebi2 = true
            celebi(celebiPos[randomNum][1],celebiPos[randomNum][2])
        end

        if musicTime >= 118500 and not doneCelebi3 then
            doneCelebi3 = true
            celebi(celebiPos[randomNum][1],celebiPos[randomNum][2])
        end




        if not enemy:isAnimated() and enemy:getAnimName() ~= "idle" then
            enemy:animate("idle", false)
        end

        if stageImages["gold head"]:isAnimated() and beatHandler.onBeat() then
            stageImages["gold head"]:animate("idle", false)

        elseif stageImages["gold head"]:getAnimName() ~= enemy:getAnimName() then
            stageImages["gold head"]:animate(enemy:getAnimName())
        end

        stageImages["celebi"]:update(dt)
        stageImages["note"]:update(dt)
        stageImages["gold head"]:update(dt)
        stageImages["no more"]:update(dt)
        stageImages["head ripping"]:update(dt)


        if musicTime >= 150750 and musicTime < 150800 then
            doingTear = true
            stageImages["no more"]:animate("anim", false, function()
                stageImages["head ripping"]:animate("anim", false, function()
                    afterTear = true
                    doingTear = false
                end)
            end)
        end

        if debug then
            if not stageImages["no more"]:isAnimated() then
                stageImages["no more"]:animate("anim", false)
            end
            if not stageImages["head ripping"]:isAnimated() then
                stageImages["head ripping"]:animate("anim", false)
            end
        end



         

        --jumpscares
            if musicTime >= 47250 and musicTime < 47250+50 then
                jumpscare(0.4,250)
            end
            if musicTime >= 89250 and musicTime < 89250+50 then
                jumpscare(0.4,250)
            end
            if musicTime >= 90375 and musicTime < 90375+50 then
                jumpscare(0.1,250)
            end
            if musicTime >= 91031 and musicTime < 91031+50 then
                jumpscare(0.1,250)
            end
            if musicTime >= 91875 and musicTime < 91875+50 then
                jumpscare(0.1,250)
            end
            if musicTime >= 104625 and musicTime < 104625+50 then
                jumpscare(0.4,250)
            end
            if musicTime >= 113250 and musicTime < 113250+50 then
                jumpscare(0.4,250)
            end
            if musicTime >= 144000 and musicTime < 144000+50 then
                jumpscare(0.4,250)
            end
            if musicTime >= 186181 and musicTime < 186181+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 186909 and musicTime < 186909+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 189090 and musicTime < 189090+50 then
                jumpscare(0.1, 250)
            end
            if musicTime >= 189272 and musicTime < 189272+50 then
                jumpscare(0.1, 250)
            end
            if musicTime >= 189454 and musicTime < 189454+50 then
                jumpscare(0.4, 250)
            end 
            if musicTime >=  190181 and musicTime < 190181+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 197818 and musicTime < 197818+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 198545 and musicTime < 198545+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 216727 and musicTime < 216727+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 219636 and musicTime < 219636+50 then
                jumpscare(0.1, 250)
            end
            if musicTime >= 219818 and musicTime < 219818+50 then
                jumpscare(0.1, 250)
            end
            if musicTime >= 228363 and musicTime < 228363+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 229818 and musicTime < 229818+50 then
                jumpscare(0.1, 250)
            end
            if musicTime >= 229999 and musicTime < 229999+50 then
                jumpscare(0.1, 250)
            end
            if musicTime >= 231272 and musicTime < 231272+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 234181 and musicTime < 234181+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 235636 and musicTime < 235636+50 then
                jumpscare(0.1, 250)
            end
            if musicTime >= 235818 and musicTime < 235818+50 then
                jumpscare(0.1, 250)
            end
            if musicTime >= 237090 and musicTime < 237090+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 239999 and musicTime < 239999+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 241454 and musicTime < 241454+50 then
                jumpscare(0.1, 250)
            end
            if musicTime >= 241636 and musicTime < 241636+50 then
                jumpscare(0.1, 250)
            end
            if musicTime >= 242909 and musicTime < 242909+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 245818 and musicTime < 245818+50 then
                jumpscare(0.4, 250)
            end
            if musicTime >= 251999 and musicTime < 251999+50 then
                stageImages["jumpscare2"].sizeX, stageImages["jumpscare2"].sizeY = 0.5, 0.5
                jumpscare(2, 500)
            end


    end,

    draw = function()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)


            ----[[
            if not doingTear and not afterTear then
                enemy:draw()
            end


            if afterTear then
                stageImages["gold head"]:draw()
            end

            if stageImages["no more"]:isAnimated() and musicTime > 2000 then
                stageImages["no more"]:draw()
            end
            if stageImages["head ripping"]:isAnimated() and musicTime > 2000 then
                stageImages["head ripping"]:draw()
            end
                        --]]


            if debug then
                love.graphics.setColor(1,1,1,0.5)
                enemy:draw()
                stageImages["gold head"]:draw()
                stageImages["no more"]:draw()
                stageImages["head ripping"]:draw()
                love.graphics.setColor(1,1,1,1)
            end


            if stageImages["celebi"]:isAnimated() then
                stageImages["celebi"]:draw()
            end
            --stageImages["note"]:draw()






            graphics.setColor(1,1,1)
        love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end  

        graphics.clearCache()
    end
}