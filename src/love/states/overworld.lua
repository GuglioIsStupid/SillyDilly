overworld = {}

overworld.bg = love.graphics.newImage(graphics.imagePath("overworld/cinnabar"))
overworld.oceanTile = {
    love.graphics.newImage(graphics.imagePath("overworld/ocean")), 0, 0,
    new = function(self, x, y)
        self[2] = x
        self[3] = y
        return self
    end
}
overworld.bgOcean = {}
-- for bg width and height, get oceanTile width and height
for x = 0, overworld.bg:getWidth() / overworld.oceanTile[1]:getWidth() do
    overworld.bgOcean[x] = {}
    for y = 0, overworld.bg:getHeight() / overworld.oceanTile[1]:getHeight() do
        overworld.bgOcean[x][y] = overworld.oceanTile:new(x * overworld.oceanTile[1]:getWidth(), y * overworld.oceanTile[1]:getHeight())
    end
end

overworld.collisionSprite = {w=16,h=16,x=0,y=0,
    new = function(self, x, y)
        self.x = x
        self.y = y
        return self
    end
}

overworld.gameboy = love.graphics.newImage(graphics.imagePath("overworld/gameboy_graphic"))

overworld.collisionBG = love.image.newImageData(graphics.imagePath("overworld/cinnabar-collision"))
-- go through the image data, overword.collisionSprite w and h each
-- if the alpha isn't 0, add a new collisionSprite to overworld.collisionSprites
overworld.collisionMap = {}
for x = 0, overworld.collisionBG:getWidth() / overworld.collisionSprite.w do
    overworld.collisionMap[x] = {}
    for y = 0, overworld.collisionBG:getHeight() / overworld.collisionSprite.h do
        -- check if pixel exists
        local curPixel = overworld.collisionBG:getPixel(x, y)
        --check if nil
        if curPixel ~= nil then
            -- check if alpha is 0
            local r,g,b,a = overworld.collisionBG:getPixel(x, y)
            if a ~= 0 then
                overworld.collisionMap[x][y] = overworld.collisionSprite:new(x * overworld.collisionSprite.w, y * overworld.collisionSprite.h)
            end
        end
    end
end

overworld.gameCam = {
    x = 0,
    y = 0,
    minScrollX = 0,
    minScrollY = 0,
    maxScrollX = overworld.bg:getWidth(),
    maxScrollY = overworld.bg:getHeight() + 60
}

local function wrapAngle(angle)
    while(angle < 0) do
        angle = angle + 360
    end
    return angle
end

local function canMoveNext(x,y,direction)
    local nextPointX = math.floor(x+8+math.sin(direction*(math.pi/180))*16)/16
    local nextPointY = math.floor(y+8+math.cos(direction*(math.pi/180))*16)/16
    

    return true
end

overworld.pointTo = {x=328, y=200}

overworld.shiftX = 0
overworld.fullElapsed = 0

overworld.bf = {}
overworld.bf.img = love.graphics.newImage(graphics.imagePath("overworld/bf"))
overworld.bf.anims = {
    down = {
        love.graphics.newQuad(0, 0, 16, 16, overworld.bf.img),
        love.graphics.newQuad(16, 0, 16, 16, overworld.bf.img),
        love.graphics.newQuad(32, 0, 16, 16, overworld.bf.img),
        love.graphics.newQuad(16, 0, 16, 16, overworld.bf.img),
    },
    up = {
        love.graphics.newQuad(48, 0, 16, 16, overworld.bf.img),
        love.graphics.newQuad(64, 0, 16, 16, overworld.bf.img),
        love.graphics.newQuad(80, 0, 16, 16, overworld.bf.img),
        love.graphics.newQuad(64, 0, 16, 16, overworld.bf.img),
    },
    left = {
        love.graphics.newQuad(112, 0, 16, 16, overworld.bf.img),
        love.graphics.newQuad(96, 0, 16, 16, overworld.bf.img),
    },
    right = {
        love.graphics.newQuad(144, 0, 16, 16, overworld.bf.img),
        love.graphics.newQuad(128, 0, 16, 16, overworld.bf.img),
    },
    curAnim = "down",
    curFrame = 1,
}

overworld.bf.walkSpeed = 1
overworld.bf.movingX = false
overworld.bf.movingY = false

overworld.bf.x = 160
overworld.bf.y = 64

overworld.bf.lastX = 160
overworld.bf.lastY = 64

overworld.bf.direction = 0

function overworld.bf:update(dt)
    local trueDT = (dt/(1/60))
    if not overworld.bf.movingX and not overworld.bf.movingY then
        if not input:down("up") and not input:down("down") then
            if (input:down("left") or input:down("right") and not (input:down("left") and input:down("right"))) then
                direction = wrapAngle(0 + (90 * (input:down("left") and -1 or 0)) + (90 * (input:down("right") and 1 or 0)))
                if direction == 270 then
                    overworld.bf.curAnim = "left"
                elseif direction == 90 then
                    overworld.bf.curAnim = "right"
                end
                if canMoveNext(overworld.bf.x, overworld.bf.y, direction) then
                    overworld.bf.movingX = true
                    overworld.bf.lastX = overworld.bf.x
                end
            end
        end
        if not input:down("left") and not input:down("right") then
            if (input:down("up") or input:down("down") and not (input:down("up") and input:down("down"))) then
                direction = wrapAngle(0 + (90 * (input:down("up") and -1 or 0)) + (90 * (input:down("down") and 1 or 0)))
                if direction == 0 then
                    overworld.bf.curAnim = "down"
                elseif direction == 180 then
                    overworld.bf.curAnim = "up"
                end
                if canMoveNext(overworld.bf.x, overworld.bf.y, direction) then
                    overworld.bf.movingY = true
                    overworld.bf.lastY = overworld.bf.y
                    print("ASASAS")
                end
            end
        end
    else
        if overworld.bf.movingX then
            overworld.bf.x = overworld.bf.x + overworld.bf.walkSpeed * math.sin(direction * (math.pi/180)) * trueDT
            if math.abs((overworld.bf.lastX + 8) - (overworld.bf.x + 8)) >= 16 then
                overworld.bf.movingX = false
                overworld.bf.x = overworld.bf.lastX
            end
        end

        if overworld.bf.movingY then
            overworld.bf.y = overworld.bf.y + overworld.bf.walkSpeed * math.cos(direction * (math.pi/180)) * trueDT
            if math.abs((overworld.bf.lastY + 8) - (overworld.bf.y + 8)) >= 16 then
                overworld.bf.movingY = false
                overworld.bf.y = overworld.bf.lastY
            end
        end
    end
end

function overworld:update(dt)
    fullDT = (fullDT or 0) + (dt / (1/(12)))
    sinAmount = (fullDT/240) * (180/math.pi)
    shiftX = math.floor(math.sin(sinAmount) * 4)

    overworld.bf:update(dt)
end

function overworld:draw()
    love.graphics.push()
        love.graphics.translate(-overworld.gameCam.x, -overworld.gameCam.y)
        love.graphics.draw(overworld.bg, 0, 0)
        for x = 0, #overworld.bgOcean do
            for y = 0, #overworld.bgOcean[x] do
                love.graphics.draw(overworld.bgOcean[x][y][1], overworld.bgOcean[x][y][2], overworld.bgOcean[x][y][3])
            end
        end
        print(#overworld.collisionMap)
    love.graphics.pop()
    --love.graphics.draw(overworld.gameboy, 0, 0)
    love.graphics.draw(overworld.bf.img, overworld.bf.anims[overworld.bf.anims.curAnim][overworld.bf.anims.curFrame], overworld.bf.x, overworld.bf.y)
end

