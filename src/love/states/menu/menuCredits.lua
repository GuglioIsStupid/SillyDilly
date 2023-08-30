
return {
    enter = function(self)
        credY = {
            250
        }
        graphics:fadeInWipe(0.6)
        bg = graphics.newImage(graphics.imagePath("menu/select/pokemon_yellow_noise"))
        bg.translation = 0
        
        if not CreditsMenuTheme:isPlaying() then
            if hypnoMenuTheme:isPlaying() then
                hypnoMenuTheme:stop()
            end
            if FreeplayMenuTheme:isPlaying() then
                FreeplayMenuTheme:stop()
            end
            if pokedexTheme:isPlaying() then
                pokedexTheme:stop()
            end
        end
        CreditsMenuTheme:play()
        CreditsMenuTheme:setLooping(true)

        background = {
            members = {},
            add = function(self, member)
                table.insert(self.members, member)
            end,
            remove = function(self, member)
                for i = #self.members, 1, -1 do
                    if self.members[i] == member then
                        table.remove(self.members, i)
                    end
                end
            end,
            update = function(self, dt)
                for i = 1, #self.members do
                    if self.members[i].update then self.members[i]:update(dt) end
                end
            end,
            draw = function(self)
                love.graphics.push()
                love.graphics.setColor(1,1,1)
                for i = 1, #self.members do
                    self.members[i]:draw()
                end
                love.graphics.pop()
            end
        }

        moverCooldown = 0
        verticalSelection = 0

        iconList = {}
        personList = {}
        local list = {}
        -- load data/credits/iconorder.txt -- every newline is a new value
        for line in love.filesystem.lines("data/credits/iconorder.txt") do
            table.insert(list, line)
        end

        monitorCanvas = love.graphics.newCanvas(640*1.45, 360*1.45)
        monitorShader = love.graphics.newShader("shaders/monitor.frag")

        box = graphics.newImage(graphics.imagePath("menu/box"))
        box.x = 475
        box.y = 255

        -- for person in list
        for i = 1, #list do
            local person = list[i]
            local name = person:gsub(" ", "_")
            local icon = Sprite()
            -- check if "data/menu/credits/"..name.json exists
            if love.filesystem.getInfo("data/credits/" .. name .. ".json") then
                -- check if name is nothing
                if name ~= "" then
                    -- check if graphics.imagePath("menu/icons/" .. name ) exists
                    if love.filesystem.getInfo(graphics.imagePath("menu/icons/" .. name)) then
                        --icon = graphics.newImage(graphics.imagePath("menu/icons/" .. name))
                        icon:load(graphics.imagePath("menu/icons/" .. name))
                    else
                        -- load placeholder
                        --icon = graphics.newImage(graphics.imagePath("menu/icons/placeholder"))
                        icon:load(graphics.imagePath("menu/icons/placeholder"))
                    end
                    icon:setGraphicSize(math.floor(icon.width * (3/5)))

                    table.insert(iconList, icon)
                    background:add(icon)
                    print(person)
                    local credits = json.decode(love.filesystem.read("data/credits/" .. name .. ".json")).info
                    print(credits.quote)
                    credits.name = person
                    table.insert(personList, credits)
                end
            end
        end

        function bgTween()
            Timer.tween(2.5, bg, {y = bg.y - 75}, "out-sine", function()
                Timer.tween(2.5, bg, {y = bg.y + 75}, "in-sine", function()
                    Timer.tween(2.5, bg, {y = bg.y + 75}, "out-sine", function()
                        Timer.tween(2.5, bg, {y = bg.y - 75}, "in-sine", function()
                            bgTween()
                        end)
                    end)
                end)
            end)
        end
        bgTween()

        CREDITS_TV = love.filesystem.load("sprites/menu/CREDITS_TV.lua")()
        CREDITS_TV.x = graphics.getWidth()/2
        CREDITS_TV.y = graphics.getHeight()/2

        -- change all alpha to 0.6
        for i = 1, #iconList do
            iconList[i].alpha = 0.3
        end
        iconList[1].alpha = 1
    end,
    update = function(self, dt)
        background:update(dt)
        CREDITS_TV:update(dt)
        local newSelection = verticalSelection
        local up = input:pressed("up")
        local down = input:pressed("down")
        local left = input:pressed("left")
        local right = input:pressed("right")
        local directionVertial = (up and -2 or 0) + (down and 2 or 0)
        local directionHorizontal = (left and -1 or 0) + (right and 1 or 0)

        bg.translation = bg.translation + 40 * dt
        if bg.translation > 768 then bg.translation = 0 end

        if math.abs(directionVertial) > 0 then
            if moverCooldown <= 0 then
                newSelection = newSelection + directionVertial
                local even = ((newSelection % 2) == 0) and 1 or 0

                if newSelection < 0 then
                    newSelection = #iconList-1 - even
                elseif newSelection > #iconList-1 then
                    newSelection = newSelection % 2
                end  

                moverCooldown = moverCooldown + ((1/dt) / 4)
            else
                moverCooldown = moverCooldown - 1
            end

        elseif math.abs(directionHorizontal) > 0 then
            if moverCooldown <= 0 then
                newSelection = newSelection + directionHorizontal

                if newSelection < 0 then
                    newSelection = #iconList-1
                elseif newSelection > #iconList-1 then
                    newSelection = 0
                end

                moverCooldown = moverCooldown + ((1/dt) / 4)
            else
                moverCooldown = moverCooldown - 1
            end
        else
            moverCooldown = 0
        end

        if input:pressed("back") then
        graphics:fadeOutWipe(0.7, function()
            Gamestate.switch(menuSelect)
        end)
    end
    
    audio.playSound(selectSound)

        if verticalSelection ~= newSelection then
            verticalSelection = newSelection
            audio.playSound(selectSound)

            for i = 1, #iconList do
                iconList[i].alpha = 0.3
            end
            iconList[verticalSelection+1].alpha = 1
        end

        local step = 0
        local j = 0
        local constant = 150
        constant = constant * (11/12)
        local fakeElapsed = util.clamp(dt, 0, 1)
        for i = 1, #iconList do
            local iconX = 125 + (step * constant) - (iconList[i].width/2)
            local iconY = 125 + (constant * (j - math.floor(verticalSelection / 2) + 0.5)) - (iconList[i].height/2) + ((constant/2)*step)
            iconList[i].x = iconX
            iconList[i].y = util.fakeLerp(iconList[i].y, iconY, fakeElapsed/(1/15))
            step = step + 1
            if step > 1 then
                step = 0
                j = j + 1
            end
        end
    end,
    draw = function(self)
        CREDITS_TV:draw()

        -- draw canvas in the middle of the screen
        love.graphics.push()

        love.graphics.setCanvas(monitorCanvas)
        love.graphics.clear()
        love.graphics.push()
            love.graphics.setColor(0.25,0.25,0.25)
            love.graphics.rectangle("fill", -1000, -1000, 10000, 10000)
            graphics.setColor(1, 1, 1, 1)
            love.graphics.translate(bg.translation - 786, 0)

            for i = 1,5 do
                bg.x = (i-1) * 768
                bg:draw()
            end
        love.graphics.pop()
        background:draw()

        love.graphics.push()
            love.graphics.translate(-600, -315)
            for i = 1, #iconList do
                iconList[i]:draw()
            end
        love.graphics.pop()

        box:draw()

        -- quote stuffs
        love.graphics.setFont(font)
        -- print name
        graphics.setColor(1, 1, 1, 1)
        love.graphics.printf(personList[verticalSelection+1].name, 425, 35, 300, "center", 0, 1.5, 1.5)
        -- print profession
        love.graphics.printf(personList[verticalSelection+1].profession, 400, 75, 475, "center", 0, 1, 1)
        -- print quote
        love.graphics.printf("\"" .. personList[verticalSelection+1].quote .. "\"", 485, 135, 475, "center", 0, 0.65, 0.65)
        -- print description
        love.graphics.printf(personList[verticalSelection+1].description, 425, 180, 525, "left", 0, 0.85, 0.85)
        love.graphics.setCanvas()

        love.graphics.setShader(monitorShader)
        love.graphics.draw(monitorCanvas, graphics.getWidth()/2 - monitorCanvas:getWidth()/2, graphics.getHeight()/2 - monitorCanvas:getHeight()/2-90)
        love.graphics.setShader()

        love.graphics.pop()
        -- print creditsQuotes[verticalSelection+1][1]
    end,
    leave = function(self)

    end
}
