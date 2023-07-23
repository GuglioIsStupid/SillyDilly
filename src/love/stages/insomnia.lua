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
    end,

    update = function(self, dt)
        stageImages["feralisleep"]:update(dt)

        if not enemy:isAnimated() then
            enemy:animate("idle", false)  -- to make him always animate
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