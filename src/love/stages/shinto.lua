return {
    enter = function()
        stageImages = {
            ["background"] = graphics.newImage(graphics.imagePath("shinto/BG_shitno")),
		    ["pokeball"] = love.filesystem.load("sprites/shinto/shitno_pokeball.lua")()
        }

        enemy = love.filesystem.load("sprites/shinto/shitno_assets.lua")()

        enemy.x, enemy.y = 5, -662

        camera.defaultZoom = 0.7


    end,

    load = function()
        camera:addPoint("boyfriend", 0, 618, 0.7, 0.7)
        camera:addPoint("enemy", 0, 618, 0.7, 0.7)
        camera:moveToPoint(0, "boyfriend")
        love.graphics.setDefaultFilter("linear")
    end,

    update = function(self, dt)
    end,

    draw = function()
		love.graphics.push()

			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)
            stageImages["background"]:udraw()
			enemy:udraw()
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