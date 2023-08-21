return {
    enter = function()
        stageImages = {
            ["ben"] = love.filesystem.load("sprites/pasta/Ben_Drowned_BG.lua")(),
            ["brian"] = love.filesystem.load("sprites/pasta/brian_idle.lua")(),  --brian 😭
            ["slender"] = love.filesystem.load("sprites/pasta/Buds_Slender_Effects.lua")(),
            ["peach"] = love.filesystem.load("sprites/pasta/CoronationPeach.lua")(),
            ["GB"] = love.filesystem.load("sprites/pasta/GB_PastaNight_Assets.lua")(),
            ["gold"] = love.filesystem.load("sprites/pasta/GOLD_PASTA_NIGHT.lua")(),
            ["jack"] = love.filesystem.load("sprites/pasta/Jack.lua")(),
            ["jeff"] = love.filesystem.load("sprites/pasta/Jeff.lua")(),
            ["jeff arm"] = love.filesystem.load("sprites/pasta/JeffArm.lua")(),
            ["mouse"] = love.filesystem.load("sprites/pasta/Mousetable.lua")(),
            ["widemouth"] = love.filesystem.load("sprites/pasta/MrWidemouth.lua")(),
            ["block"] = love.filesystem.load("sprites/pasta/mxblock.lua")(),
            ["salad fingers"] = love.filesystem.load("sprites/pasta/SFingers.lua")(),
            ["shinto"] = love.filesystem.load("sprites/pasta/ShintoPastaNight.lua")(),
            ["squirtward"] = love.filesystem.load("sprites/pasta/Squirtward.lua")(),  -- squirtward 😭
            ["squirtward head"] = love.filesystem.load("sprites/pasta/Squirtward.lua")(),
            ["toad"] = love.filesystem.load("sprites/pasta/TOAD_WITH_A_TRUMPET.lua")(),

           ["background"]  = graphics.newImage(graphics.imagePath("pasta/bar")),
           ["chair"]  = graphics.newImage(graphics.imagePath("pasta/chair")),
           ["chair2"]  = graphics.newImage(graphics.imagePath("pasta/chair")),
           ["CHAIRS"]  = graphics.newImage(graphics.imagePath("pasta/CHAIRS")),
           ["glow"]  = graphics.newImage(graphics.imagePath("pasta/golw_ADD")),
           ["holder"]  = graphics.newImage(graphics.imagePath("pasta/holder")),
           ["lamp"]  = graphics.newImage(graphics.imagePath("pasta/lamp")),
           ["lamp light"]  = graphics.newImage(graphics.imagePath("pasta/lamp_light_ADD")),
           ["machine"]  = graphics.newImage(graphics.imagePath("pasta/machine")),
           ["shine"]  = graphics.newImage(graphics.imagePath("pasta/shine")),
           ["sky"]  = graphics.newImage(graphics.imagePath("pasta/SKY")),
           ["table"]  = graphics.newImage(graphics.imagePath("pasta/TABLE")),
           ["table misc"]  = graphics.newImage(graphics.imagePath("pasta/TableMisc")),


           ["temp mario back"] = love.filesystem.load("sprites/pasta/mxback.lua")(),           --these are temporary, you can remove them from the stageimages table when you make the actual song (unless you wanna leave them in the table)
           ["temp mario front"] = love.filesystem.load("sprites/pasta/mxfront.lua")(),
           ["temp sonic"] = love.filesystem.load("sprites/pasta/GAMBLE_X.lua")(),


        }


        stageImages["ben"]:animate("down", true)
        stageImages["brian"]:animate("anim", true)
        stageImages["slender"]:animate("anim", true)
        stageImages["peach"]:animate("anim", true)
        stageImages["GB"]:animate("anim", true)
        stageImages["gold"]:animate("anim", true)
        stageImages["jack"]:animate("anim", true)
        stageImages["jeff"]:animate("anim", true)
        stageImages["jeff arm"]:animate("anim", true)
        stageImages["mouse"]:animate("anim", true)
        stageImages["widemouth"]:animate("anim", true)
        stageImages["block"]:animate("anim", true)
        stageImages["salad fingers"]:animate("anim", true)
        stageImages["shinto"]:animate("anim", true)
        stageImages["squirtward"]:animate("body", true)
        stageImages["squirtward head"]:animate("head", true)
        stageImages["toad"]:animate("anim", true)


        stageImages["temp mario back"]:animate("idle", true)
        stageImages["temp mario front"]:animate("idle", true)
        stageImages["temp sonic"]:animate("idle", true)

        stageImages["temp mario back"].sizeX, stageImages["temp mario back"].sizeY = 0.8, 0.8
        stageImages["temp mario back"].x, stageImages["temp mario back"].y = -384, 27
        stageImages["temp mario front"].sizeX, stageImages["temp mario front"].sizeY = 0.8, 0.8
        stageImages["temp mario front"].x, stageImages["temp mario front"].y = -429, 26
        stageImages["temp sonic"].sizeX, stageImages["temp sonic"].sizeY = 0.8, 0.8
        stageImages["temp sonic"].x, stageImages["temp sonic"].y = 54, 112


        stageImages["sky"].sizeX, stageImages["sky"].sizeY = 1.3, 1.3
        stageImages["sky"].x, stageImages["sky"].y = 89, -208
        stageImages["holder"].x, stageImages["holder"].y = 285, -299
        stageImages["machine"].sizeX, stageImages["machine"].sizeY = 0.4, 0.4
        stageImages["machine"].x, stageImages["machine"].y = -157, -170
        stageImages["brian"].sizeX, stageImages["brian"].sizeY = 1.2, 1.2
        stageImages["brian"].x, stageImages["brian"].y = -181, -143
        stageImages["salad fingers"].x, stageImages["salad fingers"].y = 90, -181
        stageImages["shinto"].sizeX, stageImages["shinto"].sizeY = 0.6, 0.6
        stageImages["shinto"].x, stageImages["shinto"].y = 84, -155
        stageImages["widemouth"].x, stageImages["widemouth"].y = 189, -165
        stageImages["jack"].sizeX, stageImages["jack"].sizeY = 0.7, 0.7
        stageImages["jack"].x, stageImages["jack"].y = -279, -103
        stageImages["mouse"].sizeX, stageImages["mouse"].sizeY = 0.6, 0.6
        stageImages["mouse"].x, stageImages["mouse"].y = -73, 0
        stageImages["jeff"].sizeX, stageImages["jeff"].sizeY = 0.9, 0.9
        stageImages["jeff"].x, stageImages["jeff"].y = 22, -116
        stageImages["jeff arm"].sizeX, stageImages["jeff arm"].sizeY = 0.9, 0.9
        stageImages["jeff arm"].x, stageImages["jeff arm"].y = 30, -49
        stageImages["table misc"].sizeX, stageImages["table misc"].sizeY = 0.6, 0.6
        stageImages["table misc"].x, stageImages["table misc"].y = 472, 60
        stageImages["slender"].sizeX, stageImages["slender"].sizeY = 0.6, 0.6
        stageImages["slender"].x, stageImages["slender"].y = 397, -149
        stageImages["squirtward"].sizeX, stageImages["squirtward"].sizeY = 0.6, 0.6
        stageImages["squirtward"].x, stageImages["squirtward"].y = 235, -106
        stageImages["squirtward head"].sizeX, stageImages["squirtward head"].sizeY = 0.6, 0.6
        stageImages["squirtward head"].x, stageImages["squirtward head"].y = 233, -172
        stageImages["ben"].sizeX, stageImages["ben"].sizeY = 0.55, 0.55
        stageImages["ben"].x, stageImages["ben"].y = 549, -111
        stageImages["peach"].sizeX, stageImages["peach"].sizeY = 0.6, 0.6
        stageImages["peach"].x, stageImages["peach"].y = -14, -161
        stageImages["chair2"].sizeX, stageImages["chair2"].sizeY = 0.6, 0.6
        stageImages["chair2"].x, stageImages["chair2"].y = 272, 13
        stageImages["chair"].sizeX, stageImages["chair"].sizeY = 0.6, 0.6
        stageImages["chair"].x, stageImages["chair"].y = 446, 0
        stageImages["table"].sizeX, stageImages["table"].sizeY = 0.7, 0.7
        stageImages["table"].x, stageImages["table"].y = 53, 496
        stageImages["block"].sizeX, stageImages["block"].sizeY = 0.8, 0.8
        stageImages["block"].x, stageImages["block"].y = -650, 253
        stageImages["shine"].sizeX, stageImages["shine"].sizeY = 0.9, 0.9
        stageImages["shine"].x, stageImages["shine"].y = 86, -237




        camera:addPoint("left", 121, 44, 0.8, 0.8)
        camera:addPoint("middle", -35, 44, 0.8, 0.8)
        camera:addPoint("right", -135, 44, 0.8, 0.8)

        camera.defaultZoom = 0.8
        camera.zoom = 0.8





        enemy = love.filesystem.load("sprites/week1/daddy-dearest.lua")()
    end,

    load = function()
        camera:addPoint("left", 121, 44, 0.8, 0.8)
        camera:addPoint("middle", -35, 44, 0.8, 0.8)
        camera:addPoint("right", -135, 44, 0.8, 0.8)


        camera:addPoint("boyfriend", -35, 44, 0.8, 0.8)
        camera:addPoint("enemy", -35, 44, 0.8, 0.8)


        camera.defaultZoom = 0.8
        camera.zoom = 0.8

    end,

    update = function(self, dt)
        stageImages["ben"]:update(dt)
        stageImages["brian"]:update(dt)
        stageImages["slender"]:update(dt)
        stageImages["peach"]:update(dt)
        stageImages["GB"]:update(dt)
        stageImages["gold"]:update(dt)
        stageImages["jack"]:update(dt)
        stageImages["jeff"]:update(dt)
        stageImages["jeff arm"]:update(dt)
        stageImages["mouse"]:update(dt)
        stageImages["widemouth"]:update(dt)
        stageImages["block"]:update(dt)
        stageImages["salad fingers"]:update(dt)
        stageImages["shinto"]:update(dt)
        stageImages["squirtward"]:update(dt)
        stageImages["squirtward head"]:update(dt)
        stageImages["toad"]:update(dt)


        stageImages["temp mario back"]:update(dt)
        stageImages["temp mario front"]:update(dt)
        stageImages["temp sonic"]:update(dt)
    end,

    draw = function()
        love.graphics.push()
			love.graphics.translate(camera.x * 0.95, camera.y * 0.95)
            love.graphics.translate(camera.ex * 0.95, camera.ey * 0.95)

            stageImages["sky"]:draw()
            stageImages["background"]:draw()
            stageImages["shine"]:draw()
            stageImages["holder"]:draw()
            stageImages["machine"]:draw()
            stageImages["salad fingers"]:draw()
            stageImages["peach"]:draw()
            stageImages["shinto"]:draw()
            stageImages["widemouth"]:draw()
            stageImages["brian"]:draw()
            stageImages["jack"]:draw()
            stageImages["jeff"]:draw()
            stageImages["mouse"]:draw()
            stageImages["jeff arm"]:draw()
            stageImages["chair"]:draw()
            stageImages["slender"]:draw()
            stageImages["ben"]:draw()
            stageImages["chair2"]:draw()
            stageImages["squirtward"]:draw()
            stageImages["squirtward head"]:draw()
            stageImages["table misc"]:draw()



		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)

            stageImages["temp mario back"]:draw()
            stageImages["table"]:draw()
            stageImages["temp sonic"]:draw()
            stageImages["temp mario front"]:draw()
            stageImages["block"]:draw()

            
		love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}