--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

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

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		dtWeek:enter()
        stages["dt"]:enter()
		song = songNum
		difficulty = songAppend

        contractFinish = false
        CONTRACTTEXT = "BOYFRIEND"
		curText = ""

		enemyIcon:animate("daddy dearest", false)

        function bong()
			stageImages[8]:animate("bongLmao", false)
		end

        function ContractAdvance(text, isContractDone)
			-- everytime this function is called, it will advance the contract text by one letter
			isContractDone = isContractDone or false
			if not isContractDone then
				print("ContractAdvance called", text)
				contract:animate(text, false)
			else
				contractFinish = true
			end
		end
        newTime= 0

        contract = love.filesystem.load("sprites/dt/ContractBF.lua")()

		self:load()
	end,

	load = function(self)
		dtWeek:load()
        stages["dt"]:load()

		inst = love.audio.newSource("songs/death-toll/Inst.ogg", "stream")
		voices = love.audio.newSource("songs/death-toll/Voices.ogg", "stream")

		self:initUI()

		dtWeek:setupCountdown()
	end,

	initUI = function(self)
		dtWeek:initUI()

		dtWeek:generateNotes("songs/death-toll/death-toll-hard.json")
	end,

	update = function(self, dt)
		dtWeek:update(dt)
        stages["dt"]:update(dt)
        contract:update(dt)

		if health >= 1.595 then
			if enemyIcon:getAnimName() == "daddy dearest" then
				enemyIcon:animate("daddy dearest losing", false)
			end
		else
			if enemyIcon:getAnimName() == "daddy dearest losing" then
				enemyIcon:animate("daddy dearest", false)
			end
		end

        if not stageImages[8]:isAnimated() and stageImages[8]:getAnimName() == "bongLmao" then
			stageImages[8]:animate("idle", true)
		end

		newTime = newTime + dt
		contract.y = math.sin(newTime) * 0.15

        -- hell bell bong
		if musicTime >= 10212.7659574468 and musicTime < 10237.7659574468 then  -- its indented a bit so i can just hide it         thats actually genius i never thought of doing that         loser
                bong()
            end
            if musicTime >= 11489.3617021277 and musicTime < 11514.3617021277 then 
                bong()
            end
            if musicTime >= 13244.6808510638 and musicTime < 13269.6808510638 then 
                bong()
            end
            if musicTime >= 14042.5531914894 and musicTime < 14067.5531914894 then 
                bong()
            end
            if musicTime >= 14042.5531914894 and musicTime < 14067.5531914894 then 
                bong()
            end
            if musicTime >= 15319.1489361702 and musicTime < 15344.1489361702 then 
                bong()
            end
            if musicTime >= 16595.7446808511 and musicTime < 16620.7446808511 then 
                bong()
            end
            if musicTime >= 17872.3404255319 and musicTime < 17897.3404255319 then 
                bong()
            end
            if musicTime >= 19148 and musicTime < 19173 then 
                bong()
            end
            if musicTime >= 19148 and musicTime < 19173 then 
                bong()
            end
            if musicTime >= 20425.5319148936 and musicTime < 20450.5319148936 then 
                bong()
            end
            if musicTime >= 30638.2978723404 and musicTime < 30663.2978723404 then 
                bong()
            end
            if musicTime >= 34468.085106383 and musicTime < 34493.085106383 then 
                bong()
            end
            if musicTime >= 34468.085106383 and musicTime < 34493.085106383 then 
                bong()
            end
            if musicTime >= 34468.085106383 and musicTime < 34493.085106383 then 
                bong()
            end
            if musicTime >= 40851.0638297872 and musicTime < 40876.0638297872 then 
                bong()
            end
            if musicTime >= 44680.8510638298 and musicTime < 44705.8510638298 then 
                bong()
            end
            if musicTime >= 45957.4468085106 and musicTime < 45982.4468085106 then 
                bong()
            end
            if musicTime >= 51063.8297872341 and musicTime < 51088.8297872341 then 
                bong()
            end
            if musicTime >= 54893.6170212766 and musicTime < 54918.6170212766 then 
                bong()
            end
            if musicTime >= 54893.6170212766 and musicTime < 54918.6170212766 then 
                bong()
            end
            if musicTime >= 54893.6170212766 and musicTime < 54918.6170212766 then 
                bong()
            end
            if musicTime >= 60478.7234042554 and musicTime < 60503.7234042554 then 
                bong()
            end
            if musicTime >= 60478.7234042554 and musicTime < 60503.7234042554 then 
                bong()
            end
            if musicTime >= 66542.5531914894 and musicTime < 66567.5531914894 then 
                bong()
            end
            if musicTime >= 71489.3617021277 and musicTime < 71514.3617021277 then 
                bong()
            end
            if musicTime >= 76595.7446808511 and musicTime < 76620.7446808511 then 
                bong()
            end
            if musicTime >= 81702.1276595745 and musicTime < 81727.1276595745 then 
                bong()
            end
            if musicTime >= 86808.5106382979 and musicTime < 86833.5106382979 then 
                bong()
            end
            if musicTime >= 91914.8936170212 and musicTime < 91939.8936170212 then 
                bong()
            end
            if musicTime >= 97021.2765957446 and musicTime < 97046.2765957446 then 
                bong()
            end
            if musicTime >= 103404.255319149 and musicTime < 103429.255319149 then 
                bong()
            end
            if musicTime >= 113617.021276596 and musicTime < 113642.021276596 then 
                bong()
            end
            if musicTime >= 125106 and musicTime < 125131 then 
                bong()
            end
            if musicTime >= 126382 and musicTime < 126407 then 
                bong()
            end
            if musicTime >= 127659.574468085 and musicTime < 127684.574468085 then 
                bong()
            end
            if musicTime >= 128936.170212766 and musicTime < 128961.170212766 then 
                bong()
            end
            if musicTime >= 135159.574468085 and musicTime < 135184.574468085 then 
                bong()
            end
            if musicTime >= 139468.085106383 and musicTime < 139493.085106383 then 
                bong()
            end
            if musicTime >= 144255.319148936 and musicTime < 144280.319148936 then 
                bong()
            end
            if musicTime >= 149361.702127659 and musicTime < 149386.702127659 then 
                bong()
            end
            if musicTime >= 154468.085106383 and musicTime < 154493.085106383 then 
                bong()
            end
            if musicTime >= 157978.723404255 and musicTime < 158003.723404255 then 
                bong()
            end
            if musicTime >= 159574.468085106 and musicTime < 159599.468085106 then 
                bong()
            end
            if musicTime >= 162127.659574468 and musicTime < 162152.659574468 then 
                bong()
            end
            if musicTime >= 164680.851063829 and musicTime < 164705.851063829 then 
                bong()
            end
            if musicTime >= 167234.042553191 and musicTime < 167259.042553191 then 
                bong()
            end
            if musicTime >= 169787.234042553 and musicTime < 169812.234042553 then 
                bong()
            end
            if musicTime >= 172340.425531915 and musicTime < 172365.425531915 then 
                bong()
            end
            if musicTime >= 174893.617021276 and musicTime < 174918.617021276 then 
                bong()
            end
            if musicTime >= 176170.212765957 and musicTime < 176195.212765957 then 
                bong()
            end
            if musicTime >= 177446.808510638 and musicTime < 177471.808510638 then 
                bong()
            end
            if musicTime >= 178723.404255319 and musicTime < 178748.404255319 then 
                bong()
            end
            if musicTime >= 180000 and musicTime < 180025 then 
                bong()
            end
            if musicTime >= 181276.59574468 and musicTime < 181301.59574468 then 
                bong()
            end
            if musicTime >= 182553.191489361 and musicTime < 182578.191489361 then 
                bong()
            end
            if musicTime >= 183829.787234042 and musicTime < 183854.787234042 then 
                bong()
            end
            if musicTime >= 185106.382978723 and musicTime < 185131.382978723 then 
                bong()
        end		

        if musicTime >= 99574 and musicTime < 99610 then 
			print("Holy shit real!!!!")
			enemy:animate("walk", false, function()
				--if you're reading this, function() in the animate function is called when the animation is done
				-- dont try doing this in base fnfr, it wont do anything
				print("enemy laughing now :sob:")
			end)
		end
		if musicTime >= 100053.191489362 and musicTime < 100078.191489362 then 
			enemy:animate("laugh", false, function()
				print("ok he done :)")
				otherEnemy = true
                enemy = enemy2
			end)
		end
		-- contracts stuffies
		if musicTime >= 105957.446808511 and musicTime < 105982.446808511 then 
				ContractAdvance("B")
			end
			if musicTime >= 109787.234042553 and musicTime < 109812.234042553 then 
				ContractAdvance("BO")
			end
			if musicTime >= 113617.021276596 and musicTime < 113642.021276596 then 
				ContractAdvance("BOY")
			end
			if musicTime >= 117446.808510638 and musicTime < 117471.808510638 then 
				ContractAdvance("BOYF")
			end
			if musicTime >= 121276.595744681 and musicTime < 121301.595744681 then    --these are very specific lol         and? i simply just copied it
				ContractAdvance("BOYFR")
			end
			if musicTime >= 124148 and musicTime < 124173 then 
				ContractAdvance("BOYFRI")
			end
			if musicTime >= 128936.170212766 and musicTime < 128961.170212766 then 
				ContractAdvance("BOYFRIE")
			end
			if musicTime >= 135159.574468085 and musicTime < 135184.574468085 then 
				ContractAdvance("BOYFRIEN")
			end
			if musicTime >= 139468.085106383 and musicTime < 139493.085106383 then 
				ContractAdvance("BOYFRIEND")
			end
			if musicTime >= 142978 and musicTime < 143003 then 
				ContractAdvance("BOYFRIEND", true)
		end

		dtWeek:checkSongOver()

		dtWeek:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

            stages["dt"]:draw()
		love.graphics.pop()

		dtWeek:drawUI()
	end,

	leave = function(self)
		stages["dt"]:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		dtWeek:leave()
	end
}
