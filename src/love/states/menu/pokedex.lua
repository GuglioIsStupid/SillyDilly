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

return {
	enter = function(self, previous)

		unlockedCharacters = {   -- remember to remove this
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true
		}

		amongTranslate = 0  --what the fuck is amongTranslate why did we name it this

		dexSelection = 1
		descY = {245}
		descOpen = false
		descClosing = false
		descOpening = false

		love.graphics.setDefaultFilter("nearest")

		bg = graphics.newImage(graphics.imagePath("pokedex/BG"))
		boxes = graphics.newImage(graphics.imagePath("pokedex/boxes"))
		descBox = graphics.newImage(graphics.imagePath("pokedex/altBG"))

		pokedexTheme = love.audio.newSource("music/PokedexTheme.ogg", "stream")

		graphics.setFade(0)
		graphics.fadeIn(0.5)

		if music:isPlaying() then
			music:stop()
		end
 
		pokedexTheme:play()

		pokedexTheme:setLooping(true)


		boxes.sizeX, boxes.sizeY = 1.1,1.1
		boxes.y = 13
		descBox.sizeX, descBox.sizeY = 1.1,1.1



		theGoofyCreatures = {
			graphics.newImage(graphics.imagePath("pokedex/characters/Hypno (Safety Lullaby)/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Hypno (Left Unchecked)/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Hypno (Lost Cause)/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Gold (Monochrome)/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Gold (Frostbite)/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Red (Dead Red)/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Pikachu (Freakachu)/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Silver/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Feraligatr/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Missingno/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Burried Alive (+ Co)/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/S!3V3N/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Glitchy Red/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/DISABLED/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Ponyta/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Hell Bell (+ Old Man)/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Purin/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Nurse Joy (+ Co)/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Shinto/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Grey/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Shitno/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Hypno (Pasta Night)/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/Lord X/char")),
			graphics.newImage(graphics.imagePath("pokedex/characters/MX/char"))
		}


		--they have to be individually resized


		theGoofyCreatures[1].sizeX, theGoofyCreatures[1].sizeY = 1.2, 1.2
		theGoofyCreatures[2].sizeX, theGoofyCreatures[2].sizeY = 1.2, 1.2
		theGoofyCreatures[3].sizeX, theGoofyCreatures[3].sizeY = 1, 1
		theGoofyCreatures[4].sizeX, theGoofyCreatures[4].sizeY = 2.2, 2.2
		theGoofyCreatures[5].sizeX, theGoofyCreatures[5].sizeY = 2.2, 2.2
		theGoofyCreatures[6].sizeX, theGoofyCreatures[6].sizeY = 2.2, 2.2
		theGoofyCreatures[7].sizeX, theGoofyCreatures[7].sizeY = 2.2, 2.2
		theGoofyCreatures[8].sizeX, theGoofyCreatures[8].sizeY = 2.2, 2.2
		theGoofyCreatures[9].sizeX, theGoofyCreatures[9].sizeY = 1, 1
		theGoofyCreatures[10].sizeX, theGoofyCreatures[10].sizeY = 1.5, 1.5
		theGoofyCreatures[11].sizeX, theGoofyCreatures[11].sizeY = 1.4, 1.4
		theGoofyCreatures[12].sizeX, theGoofyCreatures[12].sizeY = 1.9, 1.9
		theGoofyCreatures[13].sizeX, theGoofyCreatures[13].sizeY = 1.9, 1.9
		theGoofyCreatures[14].sizeX, theGoofyCreatures[14].sizeY = 1.7, 1.7
		theGoofyCreatures[15].sizeX, theGoofyCreatures[15].sizeY = 1.7, 1.7
		theGoofyCreatures[16].sizeX, theGoofyCreatures[16].sizeY = 1.4, 1.4
		theGoofyCreatures[17].sizeX, theGoofyCreatures[17].sizeY = 1.7, 1.7
		theGoofyCreatures[18].sizeX, theGoofyCreatures[18].sizeY = 1.5, 1.5
		theGoofyCreatures[19].sizeX, theGoofyCreatures[19].sizeY = 1.7, 1.7
		theGoofyCreatures[20].sizeX, theGoofyCreatures[20].sizeY = 2.2, 2.2
		theGoofyCreatures[21].sizeX, theGoofyCreatures[21].sizeY = 1.4, 1.4
		theGoofyCreatures[22].sizeX, theGoofyCreatures[22].sizeY = 1.2, 1.2
		theGoofyCreatures[23].sizeX, theGoofyCreatures[23].sizeY = 1.7, 1.7
		theGoofyCreatures[24].sizeX, theGoofyCreatures[24].sizeY = 1.2, 1.2


		names = {
			"Hypno (Safety Lullaby)",  --smash
			"Hypno (Left Unchecked)",  --smash
			"Hypno (Lost Cause)",  --smash
			"Gold (Monochrome)",  --smash
			"Gold (Frostbite)",  --smash
			"Red (Dead Red)",   --smash
			"Pikachu (Freakachu)",   --smash
			"Silver",  --smash
			"Feraligatr",  --smash
			"Missingo",  --smash
			"Burried Alive (+ Co)",  --smash
			"S!3V3N",  --smash
			"Glitchy Red",  --smash
			"DISABLED",  --smash
			"Ponyta",  --smash
			"Hell Bell (+ Old Man)",  --smash
			"Purin",  --smash
			"Nurse Joy (+ Co)",  --smash
			"Shinto",  --smash
			"Grey",  --smash
			"Shitno",  --smash
			"Hypno (Pasta Night)",  --smash
			"Lord X",  --pass because im not weird
			"MX"  --smash
		}
		subtitles = {
			"The Hypnosis Pokemon",
			"The Hypnosis Pokemon",
			"The Hypnosis Pokemon",
			"The Tortured Trainer",
			"The Tortured Trainer",
			"The Frozen Trainer",
			"The Mouse Pokemon",
			"The Silenced Trainer",
			"The Fat Fucking Ass Pokemon :hot_face: :drooling_face:",
			"???",
			"The Improsoned Half-Man",
			"...",
			"The Sentient Glitch",
			"The Balloon Pokemon",
			"The Fire Horse Pokemon", -- nintendo what are you on
			"The Bronze Bell Pokemon", -- literally a fuckin bell 
			"The Balloon Pokemon",
			"",
			"The Bootleg Pokemon", -- wish.com looking ass
			"The Bootleg Trainer", -- aliexpress
			"...",
			"The Hypnosis Pokemon",
			"",
			""
		}
		stats = {
			"HT 6'05\"   WT 26.5 lbs",
			"HT 6'05\"   WT 26.5 lbs",
			"HT 6'05\"   WT 26.5 lbs",
			"HT 5'06\"   WT 114 lbs,",
			"HT 5'06\"   WT 114 lbs,",
			"HT ???   WT ???",
			"HT 1'04\"   WT 13.2 lbs",
			"HT 5'07\"   WT 116 lbs",
			"HT 7'07\"   WT 195.8 lbs",
			"HT 10'0\"   WT 3507.2 lbs", -- fat fucker
			"HT ???   WT ???",
			"HT ???   WT ???",
			"HT ???   WT ???",
			"HT 3'03\"   WT 26.5 lbs",
			"HT 3'03\"   WT 66.1 lbs",
			"HT 666'   WT 666 lbs",
			"HT 1'08\"   WT 12.1 lbs",
			"HT 5'05\"   WT 120 lbs",
			"HT TALL   WT NOT FAT",
			"HT 5'07\" WT 116 lbs",
			"HT ???   WT ???",
			"HT 6'05\"   WT 26.5 lbs",
			"3'03\" WT 77 lbs",
			"HT ???   WT ???"
		} 
		descriptions = {
			"Hypno holds a pendulum in its hand. The arcing movement and glitter of the pendulum lull the foe into a deep state of hypnosis. While this Pokemon searches for prey, it polishes the pendulum.",
			"When it is very hungry, it puts humans it meets to sleep, then it feasts on their dreams.",
			"Avoid eye contact if you come across one. It will try to put you to sleep by using its pendulum.",
			"With Unowns as his puppeteer, his groans are pitiful sparks of hope that Gold is possibly still alive.",
			"Determined and filled with hope, this trainer's ignorance gets to him and the Pokemon he loved. His Typhlosion's last breath will be God's burden of thinking before acting, even in death.",
			"The Kanto Region's Greatest Champion, residing in isolation with his Pokemon at the freezing top of Mt. Silver. What a fool he was.",
			"It keeps its tail raised to monitor its surroundings. If you yank its tail, it will try to bite you.", -- who tf would just grab a pikachus tail and pull it like wtf
			"Certain Pokemon have been able to hear the muffled screams and wails this trainer does. When they hear it, their faces are filled with fear.",
			"When it bites with its massive and powerful jaws, it shakes its head and savagely tears its victims up.",
			"MissingNo. is a glitch type Pokemon in Pokemon Red, Blue, and Yellow. The glitch occurs due to a bug in the game's programming from the Old Man battle, and others.",
			"Buried at the top of Pokemon Tower, his attempts to break free from his grave causes subtle but noticable rumbles throughout the whole tower with anyone inside.",
			"After the tragic events of his beloved Miki, he wonders from town to town is sorrow and anger. Any Wild Pokemon he comes in contact with completely ignore him.",
			"A misfortunate trainer designed to be wronged by his creator, forever trapped in a box, to be forgotten and replaced by the next generation.",
			"A Wigglytuff received through trade, with it's name in all captial letters. It only knew four moves, but all of them were disabled. And so it struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, and struggles, theres no damn way you can read this far wtf you doing looking in here get tf out",
			"It is a weak runner immediately after birth. It gradually becomes faster by chasing after its parents.",
			"A Bronzong with all its stats saying 666. Upon receiving it through trade, a piece of mail was attactched from it, the owner's name being \"Beelze.\"",
			"This unknown form of Jigglypuff appears to have a far deadlier Sing ability than usual, be cautious.",
			"This kind-hearted Nurse Joy is a Pokemon caretaker found in an abandoned Pokecenter. She'd do anything for her precious little Pokemon... Anything at all.",
			"SHINTO SO COOL!!!! SHINJTO NOT FROM BOOT LEG GAME BUT FROM REAL ONE!!!! PLAY WITH ME???",
			"Rumors say the developers that created this character couldn't be bothered to code him, so they trapped the soul of a dead kid in it and called it a day.", -- yes because human souls can run on the gameboy
			"Her name is actually Shinto, but due to the fact that it's not possible to beat her in the game she's from, players nicknamed her 'Shitno.' The only way to capture her would be to use a hacked copy and go beyond the glitched difficulty cap. But you don't want to do that...",
			"Hypno holds a pendulum in its hand. It refuses to let go or put anything else in its hands, so it uses its psychic abilities to lift other objects.",
			"A sinister entitity comprised of VOID energy, doing whatever it likes so long as it satisfies them. Seems like an innocent game of cards, but things are sure to turn deadly.",
			"This maniac version of Mario resides within an NES Mario cartridge with the sole purpose of torturing the soul of an innocent child. Although today he's just here to play some cards."
	}

		for i = 1, #theGoofyCreatures do
			theGoofyCreatures[i].x, theGoofyCreatures[i].y = -100, 0
		end
	end,


	update = function(self, dt)
		if input:pressed("gameUp") and not descClosing and not descOpening and not descOpen then
			if dexSelection == 1 then
				dexSelection = 24
			else 
				dexSelection = dexSelection - 1
			end
			if dexSelection <= 22 and dexSelection >= 4 then
				amongTranslate = amongTranslate+35
			elseif dexSelection == 24 then
				amongTranslate = -35*19
			end
		elseif input:pressed("gameDown") and not descClosing and not descOpening and not descOpen then
			if dexSelection == 24 then
				dexSelection = 1
			else
				dexSelection = dexSelection + 1
			end
			if dexSelection <= 22 and dexSelection >= 4 then
				amongTranslate = amongTranslate-35
			elseif dexSelection == 1 then
				amongTranslate = 0
			end
		elseif input:pressed("confirm") and not descClosing and not descOpening and unlockedCharacters[dexSelection] then
			if descOpen then
				descClosing = true
				descOpen = false
				Timer.tween(0.5, descY, {[1] = 250}, "linear", function()
					descClosing = false
				end)
			else
				descOpening = true
				descOpen = true
				Timer.tween(0.5, descY, {[1] = 10}, "linear", function()
					descOpening = false
				end)
			end
		end

		descBox.y = descY[1]
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
			love.graphics.scale(2.52,2.52)
				love.graphics.rectangle("fill",-100,-150,273,1000)
				love.graphics.setFont(pokeFont)

				graphics.setColor(0, 0, 0, 1)

				
				love.graphics.printf(names[dexSelection], -350, -200, 500)

				graphics.setColor(1, 1, 1, 1)

				bg:draw()

				love.graphics.push()
					love.graphics.translate(0,amongTranslate)
					for i = 1, #names do
						if i == dexSelection then
							graphics.setColor(0, 0, 0, 1)
						else
							graphics.setColor(0.5, 0.5, 0.5, 1)
						end
						if unlockedCharacters[i] then
							love.graphics.printf(names[i], 15, -155 + (i * 35), 500, "center", 0, 0.35, 0.35)
						else
							love.graphics.printf("???", 20, -300 + (i * 35), 500, "center", 0, 0.35, 0.35)
						end
						graphics.setColor(1, 1, 1, 1)
					end
				love.graphics.pop()
				graphics.setColor(1, 1, 1, 1)

				boxes:draw()
				love.graphics.scale(0.8,0.8)

				if unlockedCharacters[dexSelection] then
					theGoofyCreatures[dexSelection]:draw()
				end

				love.graphics.scale(1.25,1.25)

				graphics.setColor(0, 0, 0, 1)


				if unlockedCharacters[dexSelection] then
					love.graphics.printf(names[dexSelection], -167, -135, 452, "center", 0, 0.43, 0.43)
					love.graphics.printf(subtitles[dexSelection], -167, -121, 510, "center", 0, 0.37, 0.37)

				else
					love.graphics.printf("???", -155, -135, 500, "left", 0, 0.43, 0.43)
					love.graphics.printf("???", -155, -135, 500, "left", 0, 0.43, 0.43)
				end

				graphics.setColor(1, 1, 1, 1)
				descBox:draw()

				graphics.setColor(0, 0, 0, 1)

				love.graphics.printf(stats[dexSelection], -150, descY[1] - 30, 700,  "left", nil, 0.55, 0.55)

				love.graphics.printf(names[dexSelection], -150, descY[1] - 80, 700,  "left", nil, 0.7, 0.7)

				love.graphics.printf(subtitles[dexSelection], -150, descY[1] - 54, 700,  "left", nil, 0.6, 0.6)
				love.graphics.printf(descriptions[dexSelection], -155, descY[1] + 15, 700,  "left", nil, 0.45, 0.45)

				love.graphics.printf("DESCRIPTION", -76, descY[1] - 132, 800, "left", nil, 0.6, 0.6)

				graphics.setColor(1, 1, 1, 1)

			love.graphics.pop()
		love.graphics.pop()
	end,


	leave = function(self)
		love.graphics.setDefaultFilter("linear")
		love.graphics.setFont(font)
		pokedexTheme:stop()
	end
}
