return {
    enter = function()
        stageImages = {
            --["floor"] = graphics.newImage(graphics.imagePath("shitno/"))
        }

        enemy = love.filesystem.load("sprites/shitno/shitno.lua")()
        boyfriend = love.filesystem.load("sprites/shitno/Grey_Assets.lua")()


    end,

    load = function()

    end,

    update = function(self, dt)
    end,

    draw = function()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)
			enemy:draw()
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