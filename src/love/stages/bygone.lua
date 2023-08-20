return {
    enter = function()
        stageImages = {
            ["buildings1"] = graphics.newImage(graphics.imagePath("bygone/BG1 Buildings")),
		    ["clouds1"] = graphics.newImage(graphics.imagePath("bygone/BG1 Clouds")),
		    ["moon 1"] = graphics.newImage(graphics.imagePath("bygone/BG1 Moon")),
            ["buildings2"] = graphics.newImage(graphics.imagePath("bygone/BG2 Buildings")),
		    ["clouds2"] = graphics.newImage(graphics.imagePath("bygone/BG2 Sky")),
            ["bridge1"] = graphics.newImage(graphics.imagePath("bygone/Bridge")),
		    ["bridge2"] = graphics.newImage(graphics.imagePath("bygone/Bridge2")),
		    ["rope1"] = graphics.newImage(graphics.imagePath("bygone/BridgeRope")),
		    ["rope2"] = graphics.newImage(graphics.imagePath("bygone/BridgeRope2")),
		    ["transition"] = graphics.newImage(graphics.imagePath("bygone/AlexisTransition")),
		    ["hypno"] = graphics.newImage(graphics.imagePath("bygone/BigHypno")),
            ["heavens gate"] = love.filesystem.load("sprites/bygone/Heavens Gate.lua")(),
            ["alexis passing"] = love.filesystem.load("sprites/bygone/GGirl Alexis Passing Spritesheet.lua")(),
            ["alexis"] = love.filesystem.load("sprites/bygone/GGirl Alexis Full Spritesheet.lua")(),
        }



        boyfriend = love.filesystem.load("sprites/bygone/Smol_Hypno_Sprites.lua")()


        --stage 1 stuff
        stageImages["buildings1"].sizeX, stageImages["buildings1"].sizeY = 0.9, 0.9
        stageImages["buildings1"].x, stageImages["buildings1"].y = 86, 20
        stageImages["moon 1"].sizeX, stageImages["moon 1"].sizeY = 0.6, 0.6
        stageImages["moon 1"].x, stageImages["moon 1"].y = -357, -262
        stageImages["bridge1"].sizeX, stageImages["bridge1"].sizeY = 0.8, 0.8
        stageImages["bridge1"].x, stageImages["bridge1"].y = 807, 443
        stageImages["rope1"].sizeX, stageImages["rope1"].sizeY = 0.8, 0.8
        stageImages["rope1"].x, stageImages["rope1"].y = 24, -76
        boyfriend.sizeX, boyfriend.sizeY = 0.8, 0.8
        boyfriend.x, boyfriend.y = -5, 60


        --stage 2 stuff
        stageImages["buildings2"].sizeX, stageImages["buildings2"].sizeY = 0.9, 0.9
        stageImages["buildings2"].x, stageImages["buildings2"].y = 86, 20
        stageImages["bridge2"].sizeX, stageImages["bridge2"].sizeY = 0.8, 0.8
        stageImages["bridge2"].x, stageImages["bridge2"].y = 807, 443
        stageImages["rope2"].sizeX, stageImages["rope2"].sizeY = 0.8, 0.8
        stageImages["rope2"].x, stageImages["rope2"].y = 24, -76
        stageImages["hypno"].sizeX, stageImages["hypno"].sizeY = 0.6, 0.6
        stageImages["hypno"].x, stageImages["hypno"].y = -50, -20
        stageImages["alexis"].sizeX, stageImages["alexis"].sizeY = 0.6, 0.6
        stageImages["alexis"].x, stageImages["alexis"].y = 179, -116
        stageImages["heavens gate"].sizeX, stageImages["heavens gate"].sizeY = 0.9, 0.9
        stageImages["heavens gate"].x, stageImages["heavens gate"].y = 182, -236
        stageImages["alexis passing"].sizeX, stageImages["alexis passing"].sizeY = 0.6, 0.6
        stageImages["alexis passing"].x, stageImages["alexis passing"].y = 181, -207


        stageImages["transition"].sizeX, stageImages["transition"].sizeY = 0.95, 0.95

        enemy = boyfriend

        camera:addPoint("boyfriend", 0, 0, 1, 1)
        camera:addPoint("enemy", 0, 0, 1, 1)

        doneTransition = {false, false, false, false}

        bygoneAlphaValues = {0, 0, 1}


    end,

    load = function()

        camera:addPoint("boyfriend", 0, 0, 1, 1)
        camera:addPoint("enemy", 0, 0, 1, 1)

        doneTransition = {false, false, false, false}
        drawAlexis = true

        bygoneAlphaValues = {0, 0, 0}

    end,

    update = function(self, dt)

        stageImages["heavens gate"]:update(dt)
        stageImages["alexis passing"]:update(dt)
        stageImages["alexis"]:update(dt)


        if (not stageImages["alexis"]:isAnimated()) then
            stageImages["alexis"]:animate("idle", false)

        elseif stageImages["alexis"]:getAnimName() ~= boyfriend:getAnimName() then
            stageImages["alexis"]:animate(boyfriend:getAnimName())
        end

        if not boyfriend:isAnimated() then
            boyfriend:animate("idle")
        end


        if musicTime >= 103762 and not doneTransition[1] then
            doneTransition[1] = true
            Timer.tween(7, bygoneAlphaValues, {[1] = 1})
        end

        if musicTime >= 111705 and not doneTransition[2] then
            doneTransition[2] = true
            Timer.tween(7, bygoneAlphaValues, {[1] = 0, [2] = 1})
        end

        if musicTime >= 125647 and not doneTransition[3] then
            doneTransition[3] = true
            Timer.tween(1.5, bygoneAlphaValues, {[3] = 0.8})
        end

        if musicTime >= 218117 and not doneTransition[4] then
            doneTransition[4] = true
            stageImages["alexis passing"]:animate("anim", false)
            stageImages["heavens gate"]:animate("anim", false)
        end
    end,

    draw = function()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex/2, camera.ey/2)

            stageImages["clouds1"]:draw()
            stageImages["moon 1"]:draw()
            stageImages["buildings1"]:draw()
            stageImages["rope1"]:draw()
            boyfriend:draw()
            stageImages["bridge1"]:draw()


            love.graphics.setColor(1,1,1,bygoneAlphaValues[2])
            stageImages["clouds2"]:draw()
            stageImages["buildings2"]:draw()
            stageImages["rope2"]:draw()
            stageImages["hypno"]:draw()
            stageImages["bridge2"]:draw()

            love.graphics.setColor(1,1,1,bygoneAlphaValues[3])
            if drawAlexis then
                stageImages["alexis"]:draw()
            end

            love.graphics.setColor(1,1,1,bygoneAlphaValues[1])
            stageImages["transition"]:draw()

            love.graphics.setColor(1,1,1,1)

            if stageImages["alexis passing"]:isAnimated() and musicTime > 2000 then
                drawAlexis = false
                stageImages["alexis passing"]:draw()
            end
            if stageImages["heavens gate"]:isAnimated() and musicTime > 2000 then
                stageImages["heavens gate"]:draw()
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