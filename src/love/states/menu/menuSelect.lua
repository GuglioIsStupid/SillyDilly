local leftFunc, rightFunc, confirmFunc, backFunc, drawFunc

local menuState

local menuButton

local function switchMenu(menu)
	menuState = 1
end

local symbols = {"!", "?", ".", ",", "'", "-", "(", ")", ":", ";", "/", "&", "+", "=", "_", "<", ">", "[", "]", "{", "}", "#", "$", "%", "@", "*"}
-- preload our stuffies
function CreateText(text, isBold, canUnown)
    local isLowercase = false
    local isNumber = false
    local o = {
        x = 0,
        y = 0,
        text = {},
        size = 1,
        string = text,

        setup = function(self, text, isBold)
            self.text = {}
            for i = 1, #text do
                local char = text:sub(i, i)
                -- is letter uppercase?
                isLowercase = char:lower() == char
                -- is letter a number?
                isNumber = tonumber(char) ~= nil
                char = char:lower()

                if char ~= " " then
                    table.insert(self.text, Sprite())
                    self.text[#self.text]:setFrames(getSparrow(graphics.imagePath("alphabet")))
                    -- check if its isNumber or in symbols
                    if not isNumber and not table.contains(symbols, char) then
                        self.text[#self.text]:addAnimByPrefix("anim", char .. (isBold and " bold" or (isLowercase and " lowercase" or " uppercase")), 24, true)
                    else
                        print(char .. (isBold and " bold" or " normal"))
                        -- replace lowercase or uppercase with normal
                        self.text[#self.text]:addAnimByPrefix("anim", char .. (isBold and " bold" or " normal"), 24, true)
                    end
                    self.text[#self.text]:play("anim", true)
                    self.text[#self.text]:updateHitbox()
                    self.text[#self.text].x = 15 + (isBold and 45 or 50) * (i-1)
                end
            end
        end,

        update = function(self, dt)
            for i, char in ipairs(self.text) do
                char:update(dt)
                -- sin the y pos depending on index and time
                char.y = char.y + math.sin(i + love.timer.getTime() * 2) * 0.05
            end
        end,

        draw = function(self)
            love.graphics.push()
            love.graphics.scale(self.size, self.size)
            love.graphics.translate(self.x, self.y)
            for i, char in ipairs(self.text) do
                char:draw()
            end
            love.graphics.pop()
        end
    }
    o:setup(text, isBold)
    return o
end
ButtonOrder = {"STORY", "FREEPLAY", "CREDITS", "POKEDEX", "OPTIONS"}
buttons = {
    ["STORY"] = {
        button = CreateText("STORY", true),
        func = function() end
    },
    ["FREEPLAY"] = {
        button = CreateText(freeplayUnlocked and "FREEPLAY" or "--------", true),
        func = function() end
    },
    ["CREDITS"] = {
        button = CreateText("CREDITS", true),
        func = function() end
    },
    ["POKEDEX"] = {
        button = CreateText(pokedexUnlocked and "POKEDEX" or "-------", true),
        func = function() end
    },
    ["OPTIONS"] = {
        button = CreateText("OPTIONS", true),
        func = function() end
    }
}

buttons.STORY.button.x = 125
buttons.STORY.button.y = 65

buttons.FREEPLAY.button.x = 65
buttons.FREEPLAY.button.y = 185

buttons.CREDITS.button.x = 25
buttons.CREDITS.button.y = 305

buttons.POKEDEX.button.x = 65
buttons.POKEDEX.button.y = 425

buttons.OPTIONS.button.x = 125
buttons.OPTIONS.button.y = 545

return {
	enter = function(self, previous)
		menuButton = 1
		songNum = 0
        curSelection = "STORY"
        selectBGRandom = love.math.random(0, 100)

        if selectBGRandom < 1 then
            selectBG = graphics.newImage(graphics.imagePath("menu/quagmire_car"))   -- we are not removing quagmire car
            selectBG.x = 430
            selectBG.y = 300
            selectBGwidth = 1080
        else
            selectBG = graphics.newImage(graphics.imagePath("menu/select/pokemon_yellow_noise"))
            selectBGwidth = 768

        end

        selectBG.translation = 0

        
		--for i = 1,23 do
		--	_G["characters" .. i] = love.filesystem.load("sprites/menu/characters/" .. i .. ".lua")()
		--	_G["characters" .. i]:animate("anim", true)
		--end

		menuCharacter = love.filesystem.load("sprites/menu/characters/" .. love.math.random(1,23) .. ".lua")()

		menuCharacter:animate("anim", true)
        menuCharacter.sizeX, menuCharacter.sizeY = 0.75, 0.75
        menuCharacter.x, menuCharacter.y = 1000, 480

        -- set all button alphas to 0.7
        for i, button in pairs(buttons) do
            for i, v in ipairs(button.button.text) do
                --v.alpha = 0.7
                -- if it includes "-", set alpha to 0.3, else 0.7
                if string.find(button.button.string, "-") then
                    v.alpha = 0.3
                else
                    v.alpha = 0.7
                end
            end
        end
        -- set first to 1
        for i, v in ipairs(buttons.STORY.button.text) do
            v.alpha = 1
        end

        function confirmFunc()
            if menuButton == 1 then
                status.setLoading(true)
                graphics:fadeOutWipe(
                    0.7,
                    function()
                        Gamestate.switch(menuWeek)
                        status.setLoading(false)
                    end
                )

            elseif menuButton == 2 then
                status.setLoading(true)
                graphics:fadeOutWipe(
                    0.7,
                    function()
                        Gamestate.switch(menuFreeplay)
                        status.setLoading(false)
                    end
                )

            elseif menuButton == 3 then
                status.setLoading(true)
                graphics:fadeOutWipe(
                    0.7,
                    function()
                        Gamestate.push(menuCredits)
                        status.setLoading(false)
                    end
                )

            elseif menuButton == 4 then
                status.setLoading(true)
                graphics:fadeOutWipe(
                    0.7,
                    function()
                        Gamestate.switch(pokedex)
                        status.setLoading(false)
                    end
                )
            elseif menuButton == 5 then
                status.setLoading(true)
                graphics:fadeOutWipe(
                    0.7,
                    function()
                        Gamestate.switch(menuSettings)
                        status.setLoading(false)
                    end
                )

            end
        end

        function bgTween()
            Timer.tween(2.5, selectBG, {y = selectBG.y - 75}, "out-sine", function()
                Timer.tween(2.5, selectBG, {y = selectBG.y + 75}, "in-sine", function()
                    Timer.tween(2.5, selectBG, {y = selectBG.y + 75}, "out-sine", function()
                        Timer.tween(2.5, selectBG, {y = selectBG.y - 75}, "in-sine", function()
                            bgTween()
                        end)
                    end)
                end)
            end)
        end
        bgTween()

		switchMenu(1)

		graphics:fadeInWipe(0.6)

	end,

	update = function(self, dt)
        menuCharacter:update(dt)
        for i, button in pairs(buttons) do
            button.button:update(dt)
        end

        -- set alpha to the corresponding button that is selected
        for i = 1, #ButtonOrder do
            if menuButton == i then
                for _, v in pairs(buttons[ButtonOrder[i]].button.text) do
                    -- set to 1 if "-" is not found, else 0.6
                    if string.find(buttons[ButtonOrder[i]].button.string, "-") then
                        v.alpha = 0.4
                    else
                        v.alpha = 1
                    end
                end
            else
                for _, v in pairs(buttons[ButtonOrder[i]].button.text) do
                    if string.find(buttons[ButtonOrder[i]].button.string, "-") then
                        v.alpha = 0.3
                    else
                        v.alpha = 0.5
                    end
                end
            end
        end

        selectBG.translation = selectBG.translation + 40 * dt
        if selectBG.translation > selectBGwidth then
            selectBG.translation = 0
        end

		if not graphics.isFading() then
			if input:pressed("up") then
				audio.playSound(selectSound)

                menuButton = menuButton ~= 1 and menuButton - 1 or 5

			elseif input:pressed("down") then
				audio.playSound(selectSound)

                menuButton = menuButton ~= 5 and menuButton + 1 or 1

			elseif input:pressed("confirm") then
				audio.playSound(confirmSound)

				confirmFunc()
			elseif input:pressed("back") then
				audio.playSound(selectSound)

				Gamestate.switch(menu)
			end
		end
	end,

	draw = function(self)
        love.graphics.push()
		    love.graphics.push()
            love.graphics.setFont(uiFont)
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
            love.graphics.setColor(0,0,0)
            love.graphics.rectangle("fill", -1000, -1000, 10000, 10000)
            love.graphics.setColor(1,1,1)
            love.graphics.pop()
            love.graphics.push()
            love.graphics.translate(selectBG.translation - selectBGwidth, 0)
                for i = 1,5 do
                    selectBG.x = (i-1) * selectBGwidth
                    selectBG:draw()
                end
            love.graphics.pop()
            love.graphics.push()
            for i, button in pairs(buttons) do
                button.button:draw()
            end
            love.graphics.pop()
            love.graphics.push()
            graphics.setColor(1,1,1)
            love.graphics.print("Vanilla Engine " .. (__VERSION__ or "???") .. "\nBuilt on: Funkin Rewritten v1.1.0 Beta 2            ", 0, 0)
            menuCharacter:draw()
            love.graphics.pop()
            love.graphics.setFont(font)
		love.graphics.pop()
        
	end,

	leave = function(self)
        titleBG = nil

		Timer.clear()
	end
}