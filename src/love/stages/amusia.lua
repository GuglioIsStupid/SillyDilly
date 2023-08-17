return {
    enter = function()
        stageImages = {
            ["backgroundGreen"] = graphics.newImage(graphics.imagePath("amusia/background")),
		    ["backgroundPurple"] = graphics.newImage(graphics.imagePath("amusia/background2")),
		    ["jumpscare"] = graphics.newImage(graphics.imagePath("amusia/jumpscare")),
            ["platform"] = graphics.newImage(graphics.imagePath("amusia/Purple_place")),
            ["half platform"] = graphics.newImage(graphics.imagePath("amusia/Purple_place_half_part")),
            ["questionare"] = graphics.newImage(graphics.imagePath("amusia/questionare"))
        }


        enemy = love.filesystem.load("sprites/amusia/wiggles_glitchy.lua")()
        boyfriend = love.filesystem.load("sprites/amusia/PONYTA.lua")()




        enemy1 = love.filesystem.load("sprites/amusia/wiggles_glitchy.lua")()
        enemy1.x, enemy1.y = -130, 129
        enemy1.sizeX, enemy1.sizeY = 1.2, 1.2
        enemy2 = love.filesystem.load("sprites/amusia/The_death_stare.lua")()
        enemy3 = love.filesystem.load("sprites/amusia/WigglesTerrorUneashed.lua")()

        boyfriend1 = love.filesystem.load("sprites/amusia/PONYTA.lua")()
        boyfriend1.sizeX, boyfriend1.sizeY = 0.9, 0.9
        boyfriend1.x, boyfriend1.y = 433, -62
        boyfriend2 = love.filesystem.load("sprites/amusia/Ponyta_Scared.lua")()
        boyfriend3 = love.filesystem.load("sprites/amusia/ponyta_perspective.lua")()
        green = true


        camera:addPoint("enemy", 0, 0, 1, 1)
        camera:addPoint("boyfriend", -242, 45, 1.2, 1.2)

        platformPositions = {
            {-150, 307, 1},
            {452, 37, 0.6}
        }


    end,

    load = function()
        green = true
        doneSwitch = false
    end,

    update = function(self, dt) 

        if mustHitSection then
            if camZoomTween then
                Timer.cancel(camZoomTween)
            end

            camZoomTween = Timer.tween(1.25, camera, {defaultZoom = 1.2, zoom = 1.2}, "out-quad")
        else
            if camZoomTween then
                Timer.cancel(camZoomTween)
            end
            camZoomTween = Timer.tween(1.25, camera, {defaultZoom = 1, zoom = 1}, "out-quad")
        end


        if musicTime >= 45250 and musicTime < 45250+50 then
            green = false
        end

        if musicTime > 66166 and not doneSwitch then
            doneSwitch = true
            --Timer.tween(1, platformPositions, {[1][1] = 850, [2][1] = -548}, "in-quad")
            Timer.tween(1, enemy1, {x = enemy1.x + 1200}, "in-quad")
            Timer.tween(1, boyfriend1, {x = boyfriend1.x - 1200}, "in-quad")
        end

    end,

    draw = function()
        love.graphics.push()
			love.graphics.translate(camera.x * 0.2, camera.y * 0.2)
            love.graphics.translate(camera.ex * 0.2, camera.ey * 0.2)
            if green then
                stageImages["backgroundGreen"]:draw()
            else
                stageImages["backgroundPurple"]:draw()
            end
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)

            for i = 1,2 do
                stageImages["platform"].x, stageImages["platform"].y = platformPositions[i][1], platformPositions[i][2]
                stageImages["platform"].sizeX, stageImages["platform"].sizeY = platformPositions[i][3], platformPositions[i][3]
                stageImages["platform"]:draw()
            end


			boyfriend1:draw()
            enemy1:draw()


		love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}