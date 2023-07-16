return {
    enter = function()
        love.graphics.setDefaultFilter("nearest")
        stageImages = {
            ["background"] = graphics.newImage(graphics.imagePath("shinto/BG_shitno")),
		    ["pokeball"] = love.filesystem.load("sprites/shinto/shitno_pokeball.lua")()
        }

        debug = false

        enemy = love.filesystem.load("sprites/shinto/shitno_assets.lua")()
        stageImages["pokeball"].x, stageImages["pokeball"].y = 532, -307

        enemy.x, enemy.y = 5, -662

        camera.defaultZoom = 0.7

        function shintoEnding()
            stageImages["pokeball"]:animate("anim", false, function()
                stageImages["pokeball"]:animate("anim1", true)
            end)

            enemy:animate("end", false, function()
                enemy:animate("end1", true)
            end)
        end

        if debug then
            stageImages["pokeball"]:animate("anim", true)
        end


    end,

    load = function()
        camera:addPoint("boyfriend", 0, 618, 0.7, 0.7)
        camera:addPoint("enemy", 0, 618, 0.7, 0.7)
        camera:moveToPoint(0, "boyfriend")

     ---   voices:seek(150)
        --inst:seek(150)
    end,

    update = function(self, dt)
        stageImages["pokeball"]:update(dt)

        if musicTime >= 194250 and musicTime < 194250+50 then
            if not didEnding then
                shintoEnding()
            end
        end
    end,
 
    draw = function()
		love.graphics.push()

			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)
            stageImages["background"]:udraw()
			enemy:udraw()
            if stageImages["pokeball"]:isAnimated() then
                stageImages["pokeball"]:udraw(5.5, 5.5)
            end
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