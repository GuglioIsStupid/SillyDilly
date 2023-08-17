return {
    enter = function()
        stageImages = {
            ["floor"] = graphics.newImage(graphics.imagePath("shitno/floor"))
        }


 
        enemy = love.filesystem.load("sprites/shitno/shitno.lua")()
        boyfriend = love.filesystem.load("sprites/shitno/Grey_Assets.lua")()

        stageImages["floor"].x, stageImages["floor"].y = -633, 189
        enemy.x, enemy.y = -626, -129
        boyfriend.x, boyfriend.y = 272, 150
        boyfriend.sizeX, boyfriend.sizeY = 1.8, 1.8



        function shitnoAppear()
        end



    end,

    load = function()

        shitnoAlpha = 0

        camera:addPoint("enemy", 328, 0, 1, 1)
        camera:addPoint("boyfriend", 328, 0, 1, 1)


    end,

    update = function(self, dt)

        if musicTime >= 34666 and musicTime < 34666+50 then          -- guglio pls make this look actually good it looks nothing like the real mod and idk why :(
            shitnoAlpha = 0.125
        end
        if musicTime >= 35000 and musicTime < 35000+50 then
            shitnoAlpha = 0.25
        end
        if musicTime >= 35333 and musicTime < 35333+50 then
            shitnoAlpha = 0.375
        end
        if musicTime >= 35666 and musicTime < 35666+50 then
            shitnoAlpha = 0.5
        end
        if musicTime >= 36000 and musicTime < 36000+50 then
            shitnoAlpha = 0.625
        end
        if musicTime >= 36333 and musicTime < 36333+50 then
            shitnoAlpha = 0.75
        end
        if musicTime >= 36666 and musicTime < 36666+50 then
            shitnoAlpha = 0.875
        end
        if musicTime >= 37000 and musicTime < 37000+50 then
            shitnoAlpha = 1
        end



    end,

    draw = function()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)
            love.graphics.setColor(0,0,0)
            love.graphics.rectangle("fill", -1000, -1000, 10000, 10000)
            love.graphics.setColor(1,1,1)
            stageImages["floor"]:draw()
            love.graphics.setColor(1,1,1,shitnoAlpha)
			enemy:draw()
            love.graphics.setColor(1,1,1,1)

			boyfriend:draw()
            
		love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}