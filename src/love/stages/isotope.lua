return {
    enter = function()
        stageImages = {
            ["city"] = graphics.newImage(graphics.imagePath("isotope/glitch_City")),
		    ["tiles"] = graphics.newImage(graphics.imagePath("isotope/tiles")),
		    ["haze"] = graphics.newImage(graphics.imagePath("isotope/haze")),
            ["talking"] = love.filesystem.load("sprites/isotope/they_took_everything_from_me.lua")(),
        }



        enemy = love.filesystem.load("sprites/red/Glitchy_Red_Assets_elpepe.lua")()

        red_but_he_mad = love.filesystem.load("sprites/red/Glitchy_Red_Assets_angrybitch.lua")()



        girlfriend = love.filesystem.load("sprites/isotope/FUCKKKKK.lua")()


        enemy.x, enemy.y = 687, 120
        red_but_he_mad.x, red_but_he_mad.y = enemy.x - 400, enemy.y
        girlfriend.x, girlfriend.y = 173, 375

        camera.defaultZoom = 0.5


    end,

    load = function()

        isotopeFades = {0,0}
        doneFirstFlash = false
        doneSecondFlash = false



    end,

    update = function(self, dt)
        stageImages["talking"]:update(dt)
        red_but_he_mad:update(dt)

        if (not red_but_he_mad:isAnimated()) and beatHandler.onBeat() then
            red_but_he_mad:animate("idle", false)

        elseif red_but_he_mad:getAnimName() ~= enemy:getAnimName() then
            red_but_he_mad:animate(enemy:getAnimName())
        end


        if musicTime >= 149361 and musicTime < 149361+50 then
            stageImages["talking"]:animate("anim", false) 
        end

        if musicTime >= 149371 and musicTime < 149371+50 and not doneFirstFlash then
            doneFirstFlash = true
            isotopeFades[1] = 1
            isotopeFades[2] = 0
           -- if firstFadeTimer then
           --     Timer.cancel(firstFadeTimer)
            --end
            firstFadeTimer = Timer.tween(1, isotopeFades, {[1] = 0, [2] = 1}, "in-expo")
        end

        if musicTime >= 159574 and musicTime < 159574+50 and not doneSecondFlash then
            doneSecondFlash = true
            isotopeFades[1] = 1
            isotopeFades[2] = 0
            --if secondFadeTimer then
            --    Timer.cancel(secondFadeTimer)
            --end

            secondFadeTimer = Timer.after(0.45, function()
                isotopeFades[1] = 0
            end)
        end
    end,

    draw = function()
        love.graphics.push()
			love.graphics.translate(camera.x * 0.9, camera.y * 0.9)
            love.graphics.translate(camera.ex * 0.9, camera.ey * 0.9)
			stageImages["city"]:draw()
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)
            stageImages["tiles"]:draw()
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(camera.x * 1.1, camera.y * 1.1)
            love.graphics.translate(camera.ex * 1.1, camera.ey * 1.1)
            enemy:draw()
            red_but_he_mad:draw()
            --boyfriend:draw()
            girlfriend:draw()
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