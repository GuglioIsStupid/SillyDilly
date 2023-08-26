local creditText
-- i literally said we should use a big string and you said no - CH             damn you still havent responded
creditText = [[
CREDITS


Vanilla Engine:

GuglioIsStupid - Programming
Getsaa - Menu Designer


Funkin' Rewritten:

HTV04


Friday Night Funkin':

ninjamuffin99
PhantomArcade
Evilsk8r
Kawaisprite
And all the contributors


Miscellaneous:

PhantomClo - Pixel note splashes
Keoki - Note splashes
P-sam - Developing LOVE-NX
The developers of the LÖVE framework
RiverOaken - Psych Engine credits button






































Claus - requested furry BF to be added to VE (press UP 10 times)     we still havent done this and I really want- i mean uhh claus really wants this added (pls add this)
]]

return {
    enter = function(self)
        credY = {
            250
        }
        graphics:fadeInWipe(0.6)
        bg = graphics.newImage(graphics.imagePath("menu/menuBG"))
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
    end,
    update = function(self, dt)
        if input:pressed("down") or input:pressed("up") then 
            audio.playSound(selectSound)
        end
        if credTween then 
            Timer.cancel(credTween)
        end
        if input:pressed("gameBack") then
            graphics:fadeOutWipe(0.5,
            function()
                Gamestate.switch(menuSelect)
            end)
        end
        if input:down("down") then
            if credY[1] > -2000 then  
                credTween = Timer.tween(0.1, credY, {[1] = credY[1] - 25}, "out-quad")
                
            end
        elseif input:down("up") then
            if credY[1] < 250 then
                credTween = Timer.tween(0.1, credY, {[1] = credY[1] + 25}, "out-quad")
            end
        end
    end,
    draw = function(self)
        love.graphics.setFont(credFont)
        love.graphics.push()
        love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
        graphics.setColor(0, 0, 0.4, 1)
        bg:draw()
        graphics.setColor(1, 1, 1, 1)
        love.graphics.translate(-350,math.abs(graphics.getHeight() / 2)+credY[1]-700)
        love.graphics.printf(creditText, 0, 0, 750, "center")
        love.graphics.pop()
        love.graphics.setFont(font)
    end,
    leave = function(self)

    end
}
