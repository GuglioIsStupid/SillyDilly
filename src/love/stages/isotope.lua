return {
    enter = function()
        stageImages = {
            ["city"] = graphics.newImage(graphics.imagePath("isotope/glitch_City")),
		    ["tiles"] = graphics.newImage(graphics.imagePath("isotope/tiles")),
		    ["haze"] = graphics.newImage(graphics.imagePath("isotope/haze")),
            ["talking"] = love.filesystem.load("sprites/isotope/they_took_everything_from_me.lua")(),
        }

        stageImages["talking"].x, stageImages["talking"].y = 993, 25                    --camera should be 0.9 during scene
        stageImages["talking"].sizeX, stageImages["talking"].sizeY = 1.3, 1.3


        enemy = love.filesystem.load("sprites/red/Glitchy_Red_Assets_elpepe.lua")()
        enemy.sizeX, enemy.sizeY = 1.15, 1.15

        red_but_he_mad = love.filesystem.load("sprites/red/Glitchy_Red_Assets_angrybitch.lua")()
        red_but_he_mad.sizeX, red_but_he_mad.sizeY = 1.15, 1.15



        girlfriend = love.filesystem.load("sprites/isotope/FUCKKKKK.lua")()


        enemy.x, enemy.y = 687, 120
        red_but_he_mad.x, red_but_he_mad.y = enemy.x, enemy.y
        girlfriend.x, girlfriend.y = 173, 375

        camera.defaultZoom = 0.5

        camera:addPoint("cutscene", -700, -25, 0.9)



    end,

    load = function()

        isotopeFades = {0,0,1,1}
        doneFirstFlash = false
        doneSecondFlash = false



    end,

    update = function(self, dt)
        stageImages["talking"]:update(dt)
        red_but_he_mad:update(dt)

        if stageImages["talking"]:isAnimated() then
            voices:setVolume(1)
        end

        if (not red_but_he_mad:isAnimated()) and beatHandler.onBeat() then
            red_but_he_mad:animate("idle", false)

        elseif red_but_he_mad:getAnimName() ~= enemy:getAnimName() then
            red_but_he_mad:animate(enemy:getAnimName())
        end


        if musicTime >= 149361 and musicTime < 149361+50 then
            stageImages["talking"]:animate("anim", false) 
        end

        if musicTime >= 149371 and musicTime < 149371+50 and not doneFirstFlash then
            print("start cutscene")
            camera.camBopIntensity = 0
            doingScene = true
            camera.defaultZoom = 0.9
            camera.zoom = 0.9
            camera:moveToPoint(0, "cutscene")
            stageImages["talking"].x = 1093
            doneFirstFlash = true
            isotopeFades = {1, 0, 0.65, 0}
            Timer.tween(3, isotopeFades, {[1] = 0}, "in-cubic")
            Timer.tween(10, isotopeFades, {[2] = 1}, "linear")
            Timer.tween(10, stageImages["talking"], {x = 993}, "in-out-quad")

        end

        if musicTime >= 159574 and musicTime < 159574+50 and not doneSecondFlash then
            print("end cutscene")
            camera.camBopIntensity = 1
            doingScene = false
            camera.mustHit = true
            doneSecondFlash = true
            isotopeFades = {1, 0, 1, 1}
            camera.defaultZoom = 0.5
            camera.zoom = 0.5
            Timer.after(0.45, function()
                isotopeFades[1] = 0
            end)
        end

        if doingScene then       -- yes i know its dumb but the camera refused to stay in place for the cutscene so i did this
            camera:moveToPoint(0, "cutscene")
        end

    end,

    draw = function()
        love.graphics.push()
			love.graphics.translate(camera.x * 0.9, camera.y * 0.9)
            love.graphics.translate(((camera.ex)/2)/2 * 0.9, (camera.ey)/2 * 0.9)
			stageImages["city"]:draw()
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate((camera.ex)/2, (camera.ey)/2)
            love.graphics.setColor(1,1,1,isotopeFades[3])
            stageImages["tiles"]:draw()
            love.graphics.setColor(1,1,1,1)

		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(camera.x * 1.1, camera.y * 1.1)
            love.graphics.translate((camera.ex)/2 * 1.1, (camera.ey)/2 * 1.1)
            love.graphics.setColor(1,1,1,isotopeFades[4])

            if musicTime < 88085 then
                enemy:draw()
            else
                red_but_he_mad:draw()
            end
            --boyfriend:draw()
            girlfriend:draw()
            love.graphics.setColor(1,1,1,1)
        love.graphics.pop()
        love.graphics.push()
        love.graphics.translate(camera.x, camera.y)


            love.graphics.setColor(1,1,1,isotopeFades[2])
            stageImages["talking"]:draw()
            love.graphics.setColor(0,0,0,isotopeFades[1])
            love.graphics.rectangle("fill",-1000, -1000, 10000, 10000)
            love.graphics.setColor(1,1,1,1)

		love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}