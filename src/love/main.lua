--[[----------------------------------------------------------------------------
Friday Night Funkin' Rewritten v1.1.0 beta 2

Copyright (C) 2021  HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]
__VERSION__ = love.filesystem.read("version.txt")
--if love.filesystem.isFused() then function print() end end -- print functions tend the make the game lag when in update functions, so we do this to prevent that
consoleTable = {"Press ALT+C to clear console."}
local oprint = print
function print(...)
    local text = ""
    local args = {...}

    for i = 1, #args do
        text = text .. tostring(args[i]) .. " | "
    end

    text = text:sub(1, #text - 3)

    table.insert(consoleTable, 1, text .. "\n")

    if #consoleTable > 70 then
        table.remove(consoleTable, #consoleTable)
    end

    oprint(...)
end
function dump(o)
   if type(o) == 'table' then
      local s = ''
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. dump(v) 
      end
      return s 
   else
      return tostring(o)
   end
end
function uitextflarge(text,x,y,limit,align,hovered,r,sx,sy,ox,oy,kx,ky)
	local x = x or 0
	local y = y or 0
	local r = r or 0
	local limit = limit or 750
	local align = align or "center"
	local hovered = hovered or false
	local sx = sx or 1
	local sy = sy or 1
	local ox = ox or 0
	local oy = oy or 0
	local kx = kx or 0
	local ky = ky or 0
	if not hovered then graphics.setColor(0,0,0) else graphics.setColor(1,1,1) end
	love.graphics.printf(text,x-6,y,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x+6,y,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x,y-6,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x,y+6,limit,align,r,sx,sy,ox,oy,kx,ky)
	if not hovered then graphics.setColor(1,1,1) else graphics.setColor(0,0,0) end
	love.graphics.printf(text,x,y,limit,align,r,sx,sy,ox,oy,kx,ky)
end
function uitextf(text,x,y,limit,align,r,sx,sy,ox,oy,kx,ky,alpha)
	local x = x or 0
	local y = y or 0
	local r = r or 0
	local limit = limit or 750
	local align = align or "left"
	local sx = sx or 1
	local sy = sy or 1
	local ox = ox or 0
	local oy = oy or 0
	local kx = kx or 0
	local ky = ky or 0
	graphics.setColor(0,0,0, alpha or 1)
	love.graphics.printf(text,x-2,y,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x+2,y,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x,y-2,limit,align,r,sx,sy,ox,oy,kx,ky)
	love.graphics.printf(text,x,y+2,limit,align,r,sx,sy,ox,oy,kx,ky)
	graphics.setColor(1,1,1, alpha or 1)
    love.graphics.printf(text,x,y,limit,align,r,sx,sy,ox,oy,kx,ky)
end
function uitext(text,x,y,r,sx,sy,ox,oy,kx,ky,alpha)
	local x = x or 0
	local y = y or 0
	local r = r or 0
	local sx = sx or 1
	local sy = sy or 1
	local ox = ox or 0
	local oy = oy or 0
	local kx = kx or 0
	local ky = ky or 0
	graphics.setColor(0,0,0, alpha or 1)
	love.graphics.print(text,x-2,y,r,sx,sy,a,ox,oy,kx,ky)
	love.graphics.print(text,x+2,y,r,sx,sy,a,ox,oy,kx,ky)
	love.graphics.print(text,x,y-2,r,sx,sy,a,ox,oy,kx,ky)
	love.graphics.print(text,x,y+2,r,sx,sy,a,ox,oy,kx,ky)
	graphics.setColor(1,1,1, alpha or 1)
    love.graphics.print(text,x,y,r,sx,sy,a,ox,oy,kx,ky)
end

function borderedText(text,x,y,r,sx,sy,ox,oy,kx,ky,alpha)
	local x = x or 0
	local y = y or 0
	local r = r or 0
	local sx = sx or 1
	local sy = sy or 1
	local ox = ox or 0
	local oy = oy or 0
	local kx = kx or 0
	local ky = ky or 0
	graphics.setColor(0,0,0, alpha or 1)
	love.graphics.print(text,x-1,y,r,sx,sy,a,ox,oy,kx,ky)
	love.graphics.print(text,x+1,y,r,sx,sy,a,ox,oy,kx,ky)
	love.graphics.print(text,x,y-1,r,sx,sy,a,ox,oy,kx,ky)
	love.graphics.print(text,x,y+1,r,sx,sy,a,ox,oy,kx,ky)
	graphics.setColor(1,1,1, alpha or 1)
	love.graphics.print(text,x,y,r,sx,sy,a,ox,oy,kx,ky)
end

function saveSettings()
    if settings.hardwareCompression ~= settingdata.hardwareCompression then
        settingdata = {}
        if settings.hardwareCompression then
            imageTyppe = "dds" 
        else
            imageTyppe = "png"
        end
        settingdata = {
            hardwareCompression = settings.hardwareCompression,
            downscroll = settings.downscroll,
            ghostTapping = settings.ghostTapping,
            showDebug = settings.showDebug,
            setImageType = imageTyppe,
            sideJudgements = settings.sideJudgements,
            botPlay = settings.botPlay,
            middleScroll = settings.middleScroll,
            randomNotePlacements = settings.randomNotePlacements,
            practiceMode = settings.practiceMode,
            noMiss = settings.noMiss,
            customScrollSpeed = settings.customScrollSpeed,
            keystrokes = settings.keystrokes,
            scrollUnderlayTrans = settings.scrollUnderlayTrans,
            Hitsounds = settings.Hitsounds,
            vocalsVol = settings.vocalsVol,
            instVol = settings.instVol,
            hitsoundVol = settings.hitsoundVol,
            noteSkins = settings.noteSkins,
            flashinglights = settings.flashinglights,
			colourByQuantization = settings.colourByQuantization,
            window = settings.window,
            customBindDown = customBindDown,
            customBindUp = customBindUp,
            customBindLeft = customBindLeft,
            customBindRight = customBindRight,
            settingsVer = settingsVer
        }
        serialized = lume.serialize(settingdata)
        love.filesystem.write("settings", serialized)
        love.window.showMessageBox("Settings Saved!", "Settings saved. Vanilla Engine will now restart to make sure your settings saved")
        love.event.quit("restart")
    else
        settingdata = {}
        if settings.hardwareCompression then
            imageTyppe = "dds" 
        else
            imageTyppe = "png"
        end
        settingdata = {
            hardwareCompression = settings.hardwareCompression,
            downscroll = settings.downscroll,
            ghostTapping = settings.ghostTapping,
            showDebug = settings.showDebug,
            setImageType = settings.setImageType,
            sideJudgements = settings.sideJudgements,
            botPlay = settings.botPlay,
            middleScroll = settings.middleScroll,
            randomNotePlacements = settings.randomNotePlacements,
            practiceMode = settings.practiceMode,
            noMiss = settings.noMiss,
            customScrollSpeed = settings.customScrollSpeed,
            keystrokes = settings.keystrokes,
            scrollUnderlayTrans = settings.scrollUnderlayTrans,
            Hitsounds = settings.Hitsounds,
            vocalsVol = settings.vocalsVol,
            instVol = settings.instVol,
            hitsoundVol = settings.hitsoundVol,
            noteSkins = settings.noteSkins,
            flashinglights = settings.flashinglights,
			colourByQuantization = settings.colourByQuantization,

            customBindDown = customBindDown,
            customBindUp = customBindUp,
            customBindLeft = customBindLeft,
            customBindRight = customBindRight,
            settingsVer = settingsVer
        }
        serialized = lume.serialize(settingdata)
        love.filesystem.write("settings", serialized)
        graphics:fadeOutWipe(
            0.7,
            function()
                Gamestate.switch(menuSelect)
                status.setLoading(false)
            end
        )
    end
end
--[[

function love.load() -- Todo, add custom framerate support

end
]]

canRise = true
camEffectDistortion = 0
riserTimer = nil

function onCompleteRiser()
	canRise = false
end

function ChromaticRiser(v1, v2)
	local newZoom = v1 or 0
	local timestep = v2 or 0

	if riserTimer then
		Timer.cancel(riserTimer)
	end
	
	canRise = true
	if newZoom > camEffectDistortion then
		riserTimer = Timer.tween(
			(timestep * beatHandler.stepCrochet)/1000, 
			_G, 
			{camEffectDistortion = newZoom}, 
			"in-cubic", 
			onCompleteRiser
		)
	else
		riserTimer = Timer.tween(
			(timestep * beatHandler.stepCrochet)/1000, 
			_G, 
			{camEffectDistortion = newZoom}, 
			"out-cubic", 
			onCompleteRiser
		)
	end
end

function love.load()
	paused = false
	settings = {}
	local curOS = love.system.getOS()

	-- Load libraries
	baton = require "lib.baton"
	ini = require "lib.ini"
	push = require "lib.push"
	Gamestate = require "lib.gamestate"
	Timer = require "lib.timer"
	json = require "lib.json"
	lume = require "lib.lume"
	Object = require "lib.classic"
	xml = require "lib.xml".parse

	-- Load modules
	status = require "modules.status"
	audio = require "modules.audio"
	graphics = require "modules.graphics"
	camera = require "modules.camera"
	beatHandler = require "modules.beatHandler"
	util = require "modules.util"
	cutscene = require "modules.cutscene"
	dialogue = require "modules.dialogue"
	settings = require "settings"
	NoteSplash = require "modules.Splash"
	require "modules.savedata"
	require "modules.Lyrics"
	loadSavedata()
	
	-- XML Modules
	Sprite = require "modules.xml.Sprite"
	xmlcamera = require "modules.xml.camera"

	playMenuMusic = true

	-- Global Shaders
	camEffect = love.graphics.newShader("shaders/camEffects.frag")

	if love.filesystem.getInfo("settings") then 
		settingsdata = lume.deserialize(love.filesystem.read("settings"))
	
		settings = settingsdata

		customBindLeft = settings.customBindLeft
		customBindRight = settings.customBindRight
		customBindUp = settings.customBindUp
		customBindDown = settings.customBindDown
	
		settingsVer = settings.settingsVer
	
		settingdata = {
			hardwareCompression = settings.hardwareCompression,
			downscroll = settings.downscroll,
			ghostTapping = settings.ghostTapping,
			showDebug = settings.showDebug,
			setImageType = settings.setImageType,
			sideJudgements = settings.sideJudgements,
			botPlay = settings.botPlay,
			middleScroll = settings.middleScroll,
			practiceMode = settings.practiceMode,
			noMiss = settings.noMiss,
			customScrollSpeed = settings.customScrollSpeed,
			keystrokes = settings.keystrokes,
			scrollUnderlayTrans = settings.scrollUnderlayTrans,
			customBindDown = customBindDown,
			customBindUp = customBindUp,
			customBindLeft = customBindLeft,
			customBindRight = customBindRight,
			colourByQuantization = settings.colourByQuantization,
			settingsVer = settingsVer
		}
		serialized = lume.serialize(settingdata)
		love.filesystem.write("settings", serialized)
	end
	if settingsVer ~= 2 then
		love.window.showMessageBox("Uh Oh!", "Settings have been reset.", "warning")
		love.filesystem.remove("settings")
	end
	if not love.filesystem.getInfo("settings") or settingsVer ~= 2 then
		settings.hardwareCompression = true
		graphics.setImageType("dds")
		settings.setImageType = "dds"
		settings.downscroll = false
		settings.middleScroll = false
		settings.ghostTapping = false
		settings.showDebug = false
		settings.sideJudgements = false
		settings.botPlay = false
		settings.practiceMode = false
		settings.noMiss = false
		settings.customScrollSpeed = 1
		settings.keystrokes = false
		settings.scrollUnderlayTrans = 0
		settings.colourByQuantization = false
		--settings.noteSkins = 1
		customBindLeft = "a"
		customBindRight = "d"
		customBindUp = "w"
		customBindDown = "s"
	
		settings.flashinglights = false
		settingsVer = 2
		settingdata = {}
		settingdata = {
			hardwareCompression = settings.hardwareCompression,
			downscroll = settings.downscroll,
			ghostTapping = settings.ghostTapping,
			showDebug = settings.showDebug,
			setImageType = settings.setImageType,
			sideJudgements = settings.sideJudgements,
			botPlay = settings.botPlay,
			middleScroll = settings.middleScroll,
			practiceMode = settings.practiceMode,
			noMiss = settings.noMiss,
			customScrollSpeed = settings.customScrollSpeed,
			keystrokes = settings.keystrokes,
			scrollUnderlayTrans = settings.scrollUnderlayTrans,
			colourByQuantization = settings.colourByQuantization,

			customBindLeft = "a",
			customBindRight = "d",
			customBindUp = "w",
			customBindDown = "s",
			
			settingsVer = settingsVer
		}
		serialized = lume.serialize(settingdata)
		love.filesystem.write("settings", serialized)
	end

	graphics.setImageType(settings.setImageType)

	volumeWidth = {width = 160}
	volFade = 0

	-- Load settings
	--settings = require "settings"
	input = require "input"

	-- Load Debugs
	debugMenu = require "states.debug.debugMenu"
	spriteDebug = require "states.debug.sprite-debug"
	stageDebug = require "states.debug.stage-debug"

	-- Sounds
	selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
	confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")

	-- Load stages
	stages = {
		["stage"] = require "stages.stage",
		["dt"] = require "stages.dt",
		["frostbite"] = require "stages.frostbite",
		["shinto"] = require "stages.shinto",
		["isotope"] = require "stages.isotope",
		["insomnia"] = require "stages.insomnia",
		["dissension"] = require "stages.dissension",
		["pokecenter"] = require "stages.pokecenter",
		["mono"] = require "stages.mono",
		["shitno"] = require "stages.shitno",
		["amusia"] = require "stages.amusia",
		["bygone"] = require "stages.bygone",
		["pasta"] = require "stages.pasta",
	}

	-- Load Menus
	clickStart = require "states.click-start"
	menu = require "states.menu.menu"
	menuWeek = require "states.menu.menuWeek"
	menuFreeplay = require "states.menu.menuFreeplay"
	menuSettings = require "states.menu.menuSettings"
	menuCredits = require "states.menu.menuCredits"
	menuSelect = require "states.menu.menuSelect"
	pokedex = require "states.menu.pokedex"

	firstStartup = true

	-- Load weeks
	weeks = require "states.weekss" -- default
	hypnoWeek = require "states.weeks.hypno"
	dtWeek = require "states.weeks.dt"
	weeksFrostbite = require "states.weeks.weeksFrostbite"
	weeksMono = require "states.weeks.weeksMono"
	weeksShitno = require "states.weeks.weeksShitno"
	weeksAmusia = require "states.weeks.weeksAmusia"
	weeksBrimstone = require "states.weeks.brimstone"
	weeksPasta = require "states.weeks.weeksPasta"

	-- Load substates
	gameOver = require "substates.game-over"
	gameOverFeralisleep = require "substates.game-over-feralisleep"
	settingsKeybinds = require "substates.settings-keybinds"

	require "states.overworld"

	-- Load week data
	weekData = {
		require "weeks.hypno",
		require "weeks.dt",
		require "weeks.frostbite",
		require "weeks.shinto",
		require "weeks.isotope",
		require "weeks.insomnia",
		require "weeks.dissension",
		require "weeks.purin",
		require "weeks.mono",
		require "weeks.shitno",
		require "weeks.amusia",
		require "weeks.bygone",
		require "weeks.brimstone",
		require "weeks.pasta"
	}
	testData = require "weeks.test"

	weekDesc = { -- Add your week description here
		"LEARN TO FUNK",
		"DADDY DEAREST",
		"SPOOKY MONTH",
		"PICO",
		"MOMMY MUST MURDER",
		"RED SNOW",
		"HATING SIMULATOR FT. MOAWLING",
		"TANKMAN",
		"MONOCHROME",
		"SHITNO",
		"AMUSIA",
		"BYGONE PURPOSE",
		"PASTA NIGHT"
	} 


	weekMeta = { -- Add/remove weeks here
		{
			"Hypno",
			{
				"Safety Lullaby",
				"Left Unchecked",
				"Lost Cause"
			}
		},
		{
			"Death Toll",
			{
				"Death Toll"
			}
		},
		{
			"Frostbite",
			{
				"Frostbite"
			}
		},
		{
			"Shinto",
			{
				"Shinto"
			}
		},
		{
			"Isotope",
			{
				"Isotope"
			}
		},
		{
			"Insomnia",
			{
				"Insomnia"
			}
		},
		{
			"Dissension",
			{
				"Dissension"
			}
		},
		{
			"Purin",
			{
				"Purin"
			}
		},
		{
			"Monochrome",
			{
				"Monochrome"
			}
		},
		{
			"Shitno",
			{
				"Shitno"
			}
		},
		{
			"Amusia",
			{
				"Amusia"
			}
		},
		{
			"Bygone Purpose",
			{
				"Bygone Purpose"
			}
		},
		{
			"Brimstone",
			{
				"Brimstone"
			}
		},
		{
			"Pasta Night",
			{
				"Pasta Night"
			}
		}
	}

	-- LÖVE init
	if curOS == "OS X" then
		love.window.setIcon(love.image.newImageData("icons/macos.png"))
	else
		love.window.setIcon(love.image.newImageData("icons/default.png"))
	end

	push.setupScreen(1280, 720, {upscale="normal", canvas = true})

	function hex2rgb(hex)
		hex = hex:gsub("#",""):gsub("0x","")
		local r = hex:sub(1,2) 
		local g = hex:sub(3,4)
		local b = hex:sub(5,6)

		hexR = tonumber("0x".. r)
		hexG = tonumber("0x".. g)
		hexB = tonumber("0x".. b)
		return {hexR/255, hexG/255, hexB/255}
	end
	
	-- Variables
	font = love.graphics.newFont("fonts/vcr.ttf", 24)
	FNFFont = love.graphics.newFont("fonts/fnFont.ttf", 24)
	credFont = love.graphics.newFont("fonts/fnFont.ttf", 32)   -- guglio is a bitch 
	uiFont = love.graphics.newFont("fonts/Dosis-SemiBold.ttf", 32)
	pauseFont = love.graphics.newFont("fonts/Dosis-SemiBold.ttf", 96)
	weekFont = love.graphics.newFont("fonts/Dosis-SemiBold.ttf", 84)
	weekFontSmall = love.graphics.newFont("fonts/Dosis-SemiBold.ttf", 54)
	pokeFont = love.graphics.newFont("fonts/poketext.ttf", 24)
	theOtherPokeFont = love.graphics.newFont("fonts/poke.ttf", 24)

	weekNum = 1
	songDifficulty = 2

	storyMode = false
	countingDown = false

	uiScale = {zoom = 1, x = 1, y = 1, sizeX = 1, sizeY = 1}

	musicTime = 0
	health = 0

	music = love.audio.newSource("music/menu/menu.ogg", "stream")
	music:setLooping(true)

	fixVol = tonumber(string.format(
		"%.1f  ",
		(love.audio.getVolume())
	))

	-- mod folder stuff
	modweek = require "mods.week"
	modfolder = require "mods.folder"

	if curOS == "Web" then
		Gamestate.switch(clickStart)
	else
		Gamestate.switch(menu)
	end
end

function love.resize(width, height)
	push.resize(width, height)
	if Gamestate.resize then Gamestate.resize(width, height) end
end

function love.keypressed(key)
	if key == "6" then
		love.filesystem.createDirectory("screenshots")

		love.graphics.captureScreenshot("screenshots/" .. os.time() .. ".png")
	elseif key == "7" and not love.keyboard.isDown("lalt") then
		Gamestate.switch(debugMenu)
	elseif key == "7" and love.keyboard.isDown("lalt") then
		status.setLoading(true)
        graphics:fadeOutWipe(
            0.7,
            function()
                _psychmod = false
                storyMode = false
    
                music:stop()
    
                Gamestate.switch(testData, songNum)
    
                status.setLoading(false)
            end
        )
	elseif key == "0" then
		volFade = 1
		if fixVol == 0 then
			love.audio.setVolume(lastAudioVolume)
		else
			lastAudioVolume = love.audio.getVolume()
			love.audio.setVolume(0)
		end
	elseif key == "-" then
		volFade = 1
		if fixVol > 0 then
			love.audio.setVolume(love.audio.getVolume() - 0.1)
		end
	elseif key == "=" then
		volFade = 1
		if fixVol <= 0.9 then
			love.audio.setVolume(love.audio.getVolume() + 0.1)
		end
    elseif key == "c" and love.keyboard.isDown("lalt") then
		consoleTable = {}
	else
		Gamestate.keypressed(key)
	end
end

function love.textinput(t)
	Gamestate.textinput(t)
end

function love.mousepressed(x, y, button, istouch, presses)
	Gamestate.mousepressed(x, y, button, istouch, presses)
end

function love.update(dt)
	dt = math.min(dt, 1 / 30)

	if volFade > 0 then
		volFade = volFade - 1 * dt
	end

	input:update()

	camEffect:send("distort", camEffectDistortion)

	if status.getNoResize() then
		Gamestate.update(dt)
	else
		love.graphics.setFont(font)
		graphics.screenBase(push:getWidth(), push:getHeight())
		graphics.setColor(1, 1, 1) -- Fade effect on
		Gamestate.update(dt)
		love.graphics.setColor(1, 1, 1) -- Fade effect off
		graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())
		love.graphics.setFont(font)
	end

	Timer.update(dt)
end

function love.draw()
	love.graphics.setFont(font)
	graphics.screenBase(push:getWidth(), push:getHeight())

	push:start()
		graphics.setColor(1, 1, 1) -- Fade effect on
		Gamestate.draw()
		love.graphics.setColor(1, 1, 1) -- Fade effect off
		love.graphics.setFont(font)
		if status.getLoading() then
			love.graphics.print("Loading...", push:getWidth() - 175, push:getHeight() - 50)
		end
		if volFade > 0  then
			love.graphics.setColor(1, 1, 1, volFade)
			fixVol = tonumber(string.format(
				"%.1f  ",
				(love.audio.getVolume())
			))
			love.graphics.setColor(0.5, 0.5, 0.5, volFade - 0.3)

			love.graphics.rectangle("fill", 1110, 0, 170, 50)

			love.graphics.setColor(1, 1, 1, volFade)

			if volTween then Timer.cancel(volTween) end
			volTween = Timer.tween(
				0.2, 
				volumeWidth, 
				{width = fixVol * 160},
				"out-quad"
			)
			love.graphics.rectangle("fill", 1113, 10, volumeWidth.width, 30)
			graphics.setColor(1, 1, 1, 1)
		end
		if fade.mesh then 
			graphics.setColor(1,1,1)
			love.graphics.draw(fade.mesh, 0, fade.y, 0, push:getWidth(), fade.height)
		end
	push:finish()

	graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())

	-- Debug output
	if settings.showDebug then
		borderedText(status.getDebugStr(settings.showDebug)..(settings.showDebug == "console" and "\n\n"..dump(consoleTable) or ""), 5, 5, nil, 0.6, 0.6)
	end
end

function love.focus(t)
	Gamestate.focus(t)
end

function love.quit()
	saveSavedata()
end