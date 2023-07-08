return {
    enter = function()
        stageImages = {
            graphics.newImage(graphics.imagePath("dt/floor")), -- floor 1
            graphics.newImage(graphics.imagePath("dt/floorbot")), -- floorbot 2
            graphics.newImage(graphics.imagePath("dt/pil")), -- pil 3
		    graphics.newImage(graphics.imagePath("dt/pilfor")), -- pilfor 4
		    graphics.newImage(graphics.imagePath("dt/rocks")), -- rocks 5
		    graphics.newImage(graphics.imagePath("dt/roof")), -- roof 6
		    graphics.newImage(graphics.imagePath("dt/wall")), -- wall 7
            love.filesystem.load("sprites/dt/hellbell.lua")(), -- dt bell 8
            love.filesystem.load("sprites/dt/lavatop.lua")(), -- lavatop 9 
		    love.filesystem.load("sprites/dt/lavabottom.lua")(), -- lava bottom 10
		    love.filesystem.load("sprites/dt/glowleft.lua")(), -- glow left 11
		    love.filesystem.load("sprites/dt/glowright.lua")() -- glow right 12
        }

        stageImages[1].x, stageImages[1].y = -201, 589
		stageImages[2].x, stageImages[2].y = 139, 536
		stageImages[3].x, stageImages[3].y = -164, 349
		stageImages[4].x, stageImages[4].y = 495, 599
		stageImages[5].x, stageImages[5].y = 73, 606
		stageImages[6].x, stageImages[6].y = 0, -1
		stageImages[7].x, stageImages[7].y = 0, 37

        stageImages[8].x, stageImages[8].y = 21, 175
        stageImages[8].sizeX, stageImages[8].sizeY = 0.55, 0.55

        stageImages[9].x, stageImages[9].y = -109, 653
        stageImages[9].sizeX, stageImages[9].sizeY = 0.6, 0.6
        stageImages[10].x, stageImages[10].y = -25, 611
        stageImages[10].sizeX, stageImages[10].sizeY = 0.55, 0.55

        stageImages[11].x, stageImages[11].y = -851, 587
        stageImages[12].x, stageImages[12].y = 785, 745

        boyfriend = love.filesystem.load("sprites/dt/dawn.lua")()
        boyfriend.maxHoldTimer = 2020
        
        enemy = love.filesystem.load("sprites/dt/beelze_normal.lua")()
        enemy2 = love.filesystem.load("sprites/dt/beelze_ooscaryface.lua")()

        enemy.x, enemy.y = 300, 269
        enemy2.x, enemy2.y = 318, 269
        enemy.sizeX, enemy.sizeY = 0.6, 0.6
        enemy2.sizeX, enemy2.sizeY = 0.6, 0.6
        boyfriend.x, boyfriend.y = -351, 450
        boyfriend.sizeX, boyfriend.sizeY = 0.8, 0.8

    end,

    load = function()

    end,

    update = function(self, dt)
        enemy:update(dt)
        stageImages[8]:update(dt)
        stageImages[9]:update(dt)
        stageImages[10]:update(dt)
        stageImages[11]:update(dt)
        stageImages[12]:update(dt)
    end,

    draw = function()
        love.graphics.push()
			love.graphics.translate(camera.x * 0.9, camera.y * 0.9)
            stageImages[7]:draw()
            stageImages[10]:draw()
            stageImages[9]:draw()
            stageImages[5]:draw()
            stageImages[11]:draw()
            stageImages[12]:draw()
            stageImages[6]:draw()
            stageImages[4]:draw()
            stageImages[1]:draw()
            stageImages[2]:draw()
            enemy:draw()
            contract:draw()
            stageImages[8]:draw()

		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            stageImages[3]:draw()
            boyfriend:draw()
			
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(camera.x * 1.1, camera.y * 1.1)

		love.graphics.pop()
    end,

    leave = function()
        
    end
}