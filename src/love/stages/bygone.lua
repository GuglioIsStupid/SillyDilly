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
        }


        --stage 1 stuff
        stageImages["buildings1"].sizeX, stageImages["buildings1"].sizeY = 0.9, 0.9
        stageImages["buildingd1"].x, stageImages["buildings1"].y = 86, 20
        stageImages["moon 1"].sizeX, stageImages["moon 1"].sizeY = 0.6, 0.6
        stageImages["moon 1"].x, stageImages["moon 1"].y = -357, -262
        stageImages["bridge1"].sizeX, stageImages["bridge1"].sizeY = 0.8, 0.8
        stageImages["bridge1"].x, stageImages["bridge1"].y = 807, 443
        stageImages["rope1"].sizeX, stageImages["rope1"].sizeY = 0.8, 0.8
        stageImages["rope1"].x, stageImages["rope1"].y = 24, -76





        enemy = boyfriend

        boyfriend = love.filesystem.load("sprites/bygone/Smol_Hypno_Sprites.lua")()
        alexis = love.filesystem.load("sprites/bygone/GGirl Alexis Full Spritesheet.lua")()


    end,

    load = function()

        camera:addPoint("boyfriend", 0, 0, 1, 1)
        camera:addPoint("enemy", 0, 0, 1, 1)

    end,

    update = function(self, dt)
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

            
		love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}