return {
    enter = function()
        stageImages = {
            ["background"]  = graphics.newImage(graphics.imagePath("stages/mountain/bg")),
            ["blastoise"]  = graphics.newImage(graphics.imagePath("stages/mountain/Blastoise")),
            ["charizard"]  = graphics.newImage(graphics.imagePath("stages/mountain/Charizard")),
            ["fog"]  = graphics.newImage(graphics.imagePath("stages/mountain/fog")),
            ["pokemon"]  = graphics.newImage(graphics.imagePath("stages/mountain/Pokemons")),
            ["temp typhlosion"] = love.filesystem.load("sprites/gold/TYPHLOSION_MECHANIC.lua")()
        }


        enemy = love.filesystem.load("sprites/red/mt_silver_red_norm.lua")()
        deadRed = love.filesystem.load("sprites/red/mt_silver_red_dead.lua")()
        boyfriend = love.filesystem.load("sprites/gold/Cold_Gold.lua")()
        typhlosion = love.filesystem.load("sprites/gold/TYPHLOSION_MECHANIC.lua")()

    end,

    load = function()
        coldnessIdk = 0
    end,

    update = function(self, dt)
        deadRed:update(dt)
        typhlosion:update(dt)
        if deadRed:getAnimName() ~= enemy:getAnimName() then
            deadRed:animate(enemy:getAnimName())
        end
    end,

    draw = function()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
            love.graphics.translate(camera.ex, camera.ey)
            graphics.setColor(1,1,1)
            stageImages["background"]:draw()
            stageImages["pokemon"]:draw()
            stageImages["blastoise"]:draw()
            enemy:draw()
            deadRed:draw()
            stageImages["temp typhlosion"]:draw()
            boyfriend:draw()
           -- stageImages["fog"]:draw()
		love.graphics.pop()
    end,

    leave = function()
        for i, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}