local upFunc, downFunc, confirmFunc, drawFunc, musicStop
local menuState
local menuNum = 1
local songNum, songAppend
local songDifficulty = 2
local transparency

return {
	enter = function(self, previous)
		beatHandler.setBPM(102)
		overlayColor = 0
        if not hypnoMenuTheme:isPlaying() then
            if FreeplayMenuTheme:isPlaying() then
                FreeplayMenuTheme:stop()
            end
            if CreditsMenuTheme:isPlaying() then
                CreditsMenuTheme:stop()
            end
            if pokedexTheme:isPlaying() then
                pokedexTheme:stop()
            end
        end
        hypnoMenuTheme:play()
        hypnoMenuTheme:setLooping(true)		pressStartAlpha = {0,1}
		pressStartBoolean = false
		static = graphics.newImage(graphics.imagePath("menu/hypno/staticBG"))
		grass = graphics.newImage(graphics.imagePath("menu/hypno/bgGrass"))
		treesFar = graphics.newImage(graphics.imagePath("menu/hypno/bgTreesfar"))
		trees = graphics.newImage(graphics.imagePath("menu/hypno/bgTrees"))
		overlay = graphics.newImage(graphics.imagePath("menu/hypno/darknessOverlay"))
		pressStart = graphics.newImage(graphics.imagePath("menu/hypno/pressStart"))
		pressedStart = graphics.newImage(graphics.imagePath("menu/hypno/pressStartSelected"))
		pressedStartFade = graphics.newImage(graphics.imagePath("menu/hypno/pressStartSelected"))
		treesFar.translation = 0
		trees.translation = 0
		changingMenu = false
		logo = love.filesystem.load("sprites/menu/hypno/Start_Screen_Assets.lua")()
		logo.sizeX, logo.sizeY = 0.6, 0.6
		logo.y = -50
		pressStart.sizeX, pressStart.sizeY = 0.6, 0.6
		pressStart.y = 250
		pressedStart.sizeX, pressedStart.sizeY = 0.6, 0.6
		pressedStart.y = 250
		pressedStartFade.sizeX, pressedStartFade.sizeY = 0.6, 0.6
		pressedStartFade.y = 250
		logo:animate("anim", false)
		songNum = 0
		if firstStartup then
			graphics.setFade(0) 
			graphics.fadeIn(0.5)       --?????????? so it fades in very slightly faster if its the first time?   why?? or am i misunderstanding this?
		else graphics:fadeInWipe(0.6) end
		firstStartup = false
		introFade = Timer.tween(3, pressStartAlpha, {[2] = 0})
	end,

	update = function(self, dt)
		logo:update(dt)
		beatHandler.update(dt)
		if not logo:isAnimated() then
			logo:animate("anim", false)
		end
		treesFar.translation = treesFar.translation + 60 * dt
		if treesFar.translation > 1280 then
			treesFar.translation = 0
		end
		trees.translation = trees.translation + 80 * dt
		if trees.translation > 1280 then
			trees.translation = 0
		end
		if not graphics.isFading() then
			if input:pressed("confirm") then
				if not changingMenu then
					if introFade then
						Timer.cancel(introFade)
					end
					audio.playSound(confirmSound)
					overlayColor = 1
					changingMenu = true
					pressStartBoolean = true
					pressStartAlpha[1] = 1
					Timer.tween(1.2, pressStartAlpha, {[1] = 0})
					Timer.tween(1.2, pressedStartFade, {sizeX = 0.8, sizeY = 0.8}, "out-quad", function()
						graphics:fadeOutWipe(0.7, function()
							Gamestate.switch(menuSelect)
							status.setLoading(false)							
						end)
					end)
					pressStartAlpha[2] = 1
					Timer.tween(1, pressStartAlpha, {[2] = 0})
				end
			elseif input:pressed("back") then
				audio.playSound(selectSound)
				love.event.quit()
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.push()
			static:draw()
			love.graphics.translate(treesFar.translation - 1280,0)
			for i = 1,4 do
				treesFar.x = (i-1) * 1280
				treesFar:draw()
			end
			love.graphics.pop()
			love.graphics.push()
			love.graphics.translate(trees.translation - 1280,0)
			for i = 1,4 do
				trees.x = (i-1) * 1280
				grass.x = (i-1) * 1280
				trees:draw()
				grass:draw()
			end
			love.graphics.pop()
			love.graphics.push()
			overlay:draw()
			logo:draw()
			if pressStartBoolean then
				pressedStart:draw()
			else
				pressStart:draw()
			end
			love.graphics.setColor(1,1,1,pressStartAlpha[1])
			pressedStartFade:draw()
			love.graphics.setColor(overlayColor,overlayColor,overlayColor,pressStartAlpha[2])
			love.graphics.rectangle("fill", -1000, -1000, 10000, 10000)
			love.graphics.setColor(1,1,1,1)
			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		girlfriendTitle = nil
		logo = nil
		Timer.clear()
	end
}
