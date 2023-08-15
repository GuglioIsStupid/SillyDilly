return {
    enter = function()
        stageImages = {
            ["1"] = graphics.newImage(graphics.imagePath("purin/1darknessoverlay")),
            ["2"] = graphics.newImage(graphics.imagePath("purin/2painting")),
            ["3"] = graphics.newImage(graphics.imagePath("purin/3window")),
            ["4"] = graphics.newImage(graphics.imagePath("purin/4toplayer")),
            ["5"] = graphics.newImage(graphics.imagePath("purin/5table")),
            ["6"] = graphics.newImage(graphics.imagePath("purin/6nursejoy")),
            ["7"] = graphics.newImage(graphics.imagePath("purin/7backlayer")),
            ["8"] = graphics.newImage(graphics.imagePath("purin/8floor")),

        }


        enemy = love.filesystem.load("sprites/purin/jigglyassets.lua")()
        boyfriend = love.filesystem.load("sprites/purin/Full_pico_purin.lua")()

        enemy.x, enemy.y = -303, 448
        enemy.sizeX, enemy.sizeY = 0.5, 0.5
        boyfriend.x, boyfriend.y = 334, 364
        camera.defaultZoom = 0.9
        camera.zoom = 0.9
        camera:addPoint("enemy", 229, -331, 0.9, 0.9)
        camera:addPoint("boyfriend", -268, -242, 0.8, 0.8)

        stageImages["6"].x, stageImages["6"].y = 0, -70
        stageImages["6"].sizeX, stageImages["6"].sizeY = 0.9, 0.9

        function loserIsDeadLmaoImagine()
            Timer.tween(1, stageImages["6"], {orientation = -0.07}, "out-quad", function()
                Timer.tween(1, stageImages["6"], {orientation = 0}, "in-quad", function()
                    Timer.tween(1, stageImages["6"], {orientation = 0.07}, "out-quad", function()
                        Timer.tween(1, stageImages["6"], {orientation = 0}, "in-quad", function()
                            loserIsDeadLmaoImagine()
                        end)
                    end)
                end)
            end)
        end
        loserIsDeadLmaoImagine()

    end,

    load = function()
        camera:moveToPoint(1.25, "enemy")

    end,

    update = function(self, dt)
        if mustHitSection then
            if camZoomTween then
                Timer.cancel(camZoomTween)
            end

            camZoomTween = Timer.tween(1.25, camera, {defaultZoom = 0.8, zoom = 0.8}, "out-quad")
        elseif not doingScene then
            if camZoomTween then
                Timer.cancel(camZoomTween)
            end
            camZoomTween = Timer.tween(1.25, camera, {defaultZoom = 0.9, zoom = 0.9}, "out-quad")
        end
    end,

    draw = function()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)
            stageImages["8"]:draw()
            stageImages["7"]:draw()
            stageImages["6"]:draw()
            stageImages["5"]:draw()
            stageImages["4"]:draw()
            stageImages["3"]:draw()
            stageImages["2"]:draw()
            stageImages["1"]:draw()

			enemy:draw()
			boyfriend:draw()
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