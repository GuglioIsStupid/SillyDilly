local menuID, selection
local curDir, dirTable
local sprite, spriteAnims, overlaySprite

return {
	shaderViewerSearch = function(self, dir)
		svMode = 1

		if curDir then
			curDir = curDir .. "/" .. dir
		else
			curDir = dir
		end
		selection = 1
		dirTable = love.filesystem.getDirectoryItems(curDir)
	end,

	enter = function(self, previous)
		menuID = 1
		selection = 3

		love.keyboard.setKeyRepeat(true)

		menus = {
			{
				1,
				"Really Bad Debug Menu",
				{
					"Shader Viewer",
					function()
						menuID = 2

						self:shaderViewerSearch("shaders")
					end
				}
			},
			{2}
		}

        debugShader = nil
        debugShaderCanvas = nil

		graphics.setFade(0)
		graphics.fadeIn(0.5)
	end,

	keypressed = function(self, key)
		if menus[menuID][1] == 2 then -- Sprite viewer
			if svMode == 2 then
				if key == "w" then
					sprite.y = sprite.y - 1
				elseif key == "a" then
					sprite.x = sprite.x - 1
				elseif key == "s" then
					sprite.y = sprite.y + 1
				elseif key == "d" then
					sprite.x = sprite.x + 1
				end
			end
		end
	end,

	shaderViewer = function(self, shaderViewer)
		local spriteData = love.filesystem.load("sprites/boyfriend.lua")
        debugShader = love.graphics.newShader(shaderViewer)
        debugShaderCanvas = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())
        print(debugShader)
		svMode = 2

		sprite = spriteData()

		sprite:animate("idle", false)
	end,

	update = function(self, dt)
		-- I wasn't kidding when I said this was a really bad debug menu
		if menus[menuID][1] == 2 then -- Sprite viewer
			if svMode == 2 then
				sprite:update(dt)
			else
				if input:pressed("up") then
					selection = selection - 1

					if selection < 1 then
						selection = #dirTable
					end
				end
				if input:pressed("down") then
					selection = selection + 1

					if selection > #dirTable then
						selection = 1
					end
				end
				if input:pressed("confirm") then
					if love.filesystem.getInfo(curDir .. "/" .. dirTable[selection]).type == "directory" then
						self:shaderViewerSearch(dirTable[selection])
					else
						self:shaderViewer(curDir .. "/" .. dirTable[selection])
					end
				end
			end
		else -- Standard menu
			if input:pressed("up") then
				selection = selection - 1

				if selection < 3 then
					selection = #menus[menuID]
				end
			end
			if input:pressed("down") then
				selection = selection + 1

				if selection > #menus[menuID] then
					selection = 3
				end
			end
			if input:pressed("confirm") then
				menus[menuID][selection][2]()
			end
		end

		if input:pressed("back") then
			-- switch back to this menu
            Gamestate.switch(shaderDebug)
		end
		if input:pressed("debugZoomOut") then
			camera.zoom = camera.zoom - 0.05
		end
		if input:pressed("debugZoomIn") then
			camera.zoom = camera.zoom + 0.05
		end
	end,

	draw = function(self)
		if menus[menuID][1] == 2 then -- Sprite viewer
			if svMode == 2 then
				love.graphics.setCanvas(debugshaderCanvas)
                love.graphics.clear()
                love.graphics.push()
					love.graphics.translate(push:getWidth() / 2, push:getHeight() / 2)
					love.graphics.scale(camera.zoom, camera.zoom)

					sprite:draw()
				love.graphics.pop()
                love.graphics.setCanvas()
                love.graphics.setShader(debugShader)
                love.graphics.draw(debugShaderCanvas, 0, 0, 0, love.graphics.getWidth() / 1280, love.graphics.getHeight() / 720)
                love.graphics.setShader()
			else
				for i = 1, #dirTable do
					if i == selection then
						graphics.setColor(1, 1, 0)
					elseif love.filesystem.getInfo(curDir .. "/" .. dirTable[i]).type == "directory" then
						graphics.setColor(1, 0, 1)
					end
					love.graphics.print(dirTable[i], 0, (i - 1) * 20)
					graphics.setColor(1, 1, 1)
				end
			end
		else -- Standard menu
			love.graphics.print(menus[menuID][2])

			for i = 3, #menus[menuID] do
				if i == selection then
					graphics.setColor(1, 1, 0)
				end
				love.graphics.print(menus[menuID][i][1], 0, (i - 1) * 20)
				graphics.setColor(1, 1, 1)

				love.graphics.print("Press Esc to exit at any time", 0, (#menus[menuID] + 1) * 20)
			end
		end
	end
}
