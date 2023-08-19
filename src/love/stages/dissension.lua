return {
    enter = function()
        stageImages = {
            ["back"] = graphics.newImage(graphics.imagePath("dissension/back")),
		    ["bed"] = graphics.newImage(graphics.imagePath("dissension/bed")),
		    ["pillow"] = graphics.newImage(graphics.imagePath("dissension/pillow")),
            ["portrait"] = graphics.newImage(graphics.imagePath("dissension/portrait")),
		    ["red"] = graphics.newImage(graphics.imagePath("dissension/redoverlay")),
            ["intro enemy"] = love.filesystem.load("sprites/dissension/alt_steven_pov.lua")(),
            ["room enemy"] = love.filesystem.load("sprites/dissension/steven_phase_1.lua")(),
            ["arm enemy"] = love.filesystem.load("sprites/dissension/steven_phase_2.lua")(),
            ["room player"] = love.filesystem.load("sprites/dissension/mike.lua")(),
        }

        enemy = love.filesystem.load("sprites/dissension/steve.lua")()
        boyfriend = love.filesystem.load("sprites/dissension/BRO_DEAD.lua")()


        camera:addPoint("boyfriend", -82, 38, 40, 1.1)  
        camera:addPoint("enemy", -82, 38, 40, 1.1)   --because im too lazy to just lock the camera          actually it turns out this song does have a moving camera so locking it for the whole song wouldnt work anyway


        stageImages["intro enemy"].x, stageImages["intro enemy"].y = 39, 25
        stageImages["intro enemy"].sizeX, stageImages["intro enemy"].sizeY = 1.6 ,1.6


        stageImages["room enemy"].x, stageImages["room enemy"].y = -215, -3
        stageImages["room player"].x, stageImages["room player"].y = -274, 146

        stageImages["room enemy"].sizeX, stageImages["room enemy"].sizeY = 1.3, 1.3
        stageImages["room player"].sizeX, stageImages["room player"].sizeY = 0.8, 0.8

        stageImages["arm enemy"].x, stageImages["arm enemy"].y = 118, 120

        stageImages["red"].x, stageImages["red"].y = 80, -40


        function whatAreYouDoingYouHaveToGoIHitYouOhMyGoshThatShouldBeTheNameWhyDoYouLaughLikeThatIThoughKatherineWasInTheBackNobodyKnowsHowToPlayThatGameYesTheyDoItsNotHardTheresTheHomelessVillageTheresALotOfHomelessPeopleInThsoeTrees()
            enemy.y = 673
            boyfriend.y = -756
            enemy.x = -197
            boyfriend.x = 358
            enemy.sizeX, enemy.sizeY = 0.8, 0.8
            boyfriend.sizeX, boyfriend.sizeY = 0.8, 0.8
            Timer.tween(4, enemy, {y = 142}, "out-quad")
            Timer.tween(4, boyfriend, {y = -221}, "out-quad")

        end



        function L_Bozo_imagine_dying_what_a_loser() --180000
            Timer.tween(1, boyfriend, {y = -756}, "out-quad")

        end

        
    end,

    load = function()
        camera:reset()
        dissensionAlphaValues = {0,0}

        camera.defaultZoom = 1.3
        Timer.tween(3, camera, {defaultZoom = 1.1}, "out-quad")
        camera:moveToPoint(0,"boyfriend")
        Timer.tween(3, dissensionAlphaValues, {[1] = 0}, "linear")


    end,

    update = function(self, dt)
        stageImages["intro enemy"]:update(dt)
        stageImages["room enemy"]:update(dt)
        stageImages["arm enemy"]:update(dt)
        stageImages["room player"]:update(dt)

        if (not stageImages["intro enemy"]:isAnimated()) and beatHandler.onBeat() then
            stageImages["intro enemy"]:animate("idle", false)
            stageImages["room enemy"]:animate("idle", false)
            stageImages["arm enemy"]:animate("idle", false)
        elseif stageImages["intro enemy"]:getAnimName() ~= enemy:getAnimName() then
            stageImages["intro enemy"]:animate(enemy:getAnimName())
            stageImages["room enemy"]:animate(enemy:getAnimName())
            stageImages["arm enemy"]:animate(enemy:getAnimName())
        end

        if (not stageImages["room player"]:isAnimated()) and beatHandler.onBeat() then
            stageImages["room player"]:animate("idle", false)
        elseif stageImages["room player"]:getAnimName() ~= boyfriend:getAnimName() then
            stageImages["room player"]:animate(boyfriend:getAnimName())
        end

    end,

    draw = function()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)

           -- stageImages["back"]:draw()
           love.graphics.setColor(0,0,0)
           love.graphics.rectangle("fill", -1000, -1000, 10000, 10000)
           love.graphics.setColor(1,1,1)


            if introStage then
                stageImages["intro enemy"]:draw()
            elseif bedroomStage then
                stageImages["back"]:draw()
                stageImages["room enemy"]:draw()
                stageImages["bed"]:draw()
                stageImages["pillow"]:draw()
                stageImages["portrait"]:draw()
                stageImages["room player"]:draw()
            elseif idfkWhatToCallThisOneStage then
                enemy:draw()
                boyfriend:draw()
                love.graphics.setColor(1,1,1, dissensionAlphaValues[2])
                stageImages["red"]:draw()
                love.graphics.setColor(1,1,1, 1)
                if drawStrangle then
                    stageImages["arm enemy"]:draw()
                end
            end
            
		love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}