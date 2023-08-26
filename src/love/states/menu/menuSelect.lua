local leftFunc, rightFunc, confirmFunc, backFunc, drawFunc

local menuState

local menuButton

local function switchMenu(menu)
	menuState = 1
end

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

        if menuButton == 1 then
            curSelection = "STORY"
        elseif menuButton == 2 then
            curSelection = "FREEPLAY"
        elseif menuButton == 3 then
            curSelection = "CREDITS"
        elseif menuButton == 4 then
            curSelection = "POKEDEX"
        elseif menuButton == 5 then
            curSelection = "OPTIONS"
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
            love.graphics.translate(selectBG.translation - 768, 0)
                for i = 1,5 do
                    selectBG.x = (i-1) * 768
                    selectBG:draw()
                end
            love.graphics.pop()
            love.graphics.push()
            graphics.setColor(1,1,1)
            love.graphics.print("Vanilla Engine " .. (__VERSION__ or "???") .. "\nBuilt on: Funkin Rewritten v1.1.0 Beta 2            " .. curSelection, 0, 0)
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