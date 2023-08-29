return {
    enter = function()
        stageImages = {
            ["background"] = graphics.newImage(graphics.imagePath("silver/Lost_silver_back")),
            ["fog"] = graphics.newImage(graphics.imagePath("silver/Lost_silver_fog")),
            ["ground"] = graphics.newImage(graphics.imagePath("silver/Lost_silver_ground")),
            ["tree"] = graphics.newImage(graphics.imagePath("silver/Lost_silver_tree")),
            ["lake"] = graphics.newImage(graphics.imagePath("silver/Lost_silver_lake")),
            ["feralisleep"] = love.filesystem.load("sprites/silver/Feralisleep.lua")()
        }


        enemy = love.filesystem.load("sprites/silver/Silver_Spritesheet.lua")()

        enemy.x, enemy.y = 309, 77

        camera.defaultZoom = 0.8

        camera:addPoint("boyfriend", -277, -72, 0.8)
        camera:addPoint("enemy", -277, -72, 0.8)
        camera:addPoint("feralisleep", 231, 254, 1.2)
 
        --stageImages["fog"].x, stageImages["fog"].y = 
        stageImages["background"].x, stageImages["background"].y = 0, -455
        stageImages["ground"].x, stageImages["ground"].y = 0, 406
        stageImages["tree"].x, stageImages["tree"].y = 0, -108
        stageImages["lake"].x, stageImages["lake"].y = 0, 184
        stageImages["feralisleep"].x, stageImages["feralisleep"].y = -232, -57
        stageImages["feralisleep"]:animate("anim", true)
    end,

    load = function()
        camera:moveToPoint(0,"boyfriend")
        camera.defaultZoom = 0.8
    end,

    update = function(self, dt)
        stageImages["feralisleep"]:update(dt)

        if not enemy:isAnimated() then
            enemy:animate("idle", false)  -- to make him always animate
        end

        local accuracy = math.floor(ratingPercent * 10000) / 100
        if accuracy < 90 and score ~= 0 then
            if feralisleepZooming then
                Timer.cancel(feralisleepZooming)
            end
            feralisleepZooming = Timer.tween(10, camera, {zoom = 1.2, defaultZoom = 1.2})
            camera:moveToPoint(10, "feralisleep")
        else
            if feralisleepZooming then
                Timer.cancel(feralisleepZooming)
            end
            camera:moveToPoint(1, "boyfriend")
            feralisleepZooming = Timer.tween(1, camera, {zoom = 0.8, defaultZoom = 0.8})

        end

        if camera.zoom > 1.1 then
            feraligatrDeath = true
            Gamestate.push(gameOver)  -- had to do this cuz i couldnt get a timer to work (pls guglio make a timer work this is a terrible way of doing it)
                            -- actually after just chaning it to 1.1 it feels exactly like the real game so its fine but still if you wanna make a timer that would be nice but this is fine as it is
        end



    end,

    draw = function()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex/2, camera.ey/2)
            stageImages["background"]:draw()
            stageImages["lake"]:draw()
            stageImages["fog"]:draw()
            stageImages["ground"]:draw()
            stageImages["tree"]:draw()
            stageImages["feralisleep"]:draw()
            enemy:draw()

            
		love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}