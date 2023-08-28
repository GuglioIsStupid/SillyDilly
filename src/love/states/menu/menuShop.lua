local time = 0
return {
    enter = function(self)
        selectionText = {"BUY", "SELL", "EXIT"}
        shopSelection = 0
        freeplaySelected = false
        inShop = true
        confirmingPurchase = false
        inCutscene = false
        playIntro = false

        shopGroup = {
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
                    self.members[i]:update(dt)
                end
            end,
            draw = function(self)
                for i = 1, #self.members do
                    self.members[i]:draw()
                end
            end
        }
        freeplayGroup = {
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
                    self.members[i]:update(dt)
                end
            end,
            draw = function(self)
                for i = 1, #self.members do
                    self.members[i]:draw()
                end
            end
        }

        shopText = json.decode(love.filesystem.read("data/shop/shopText.json"))
        currentShopDialogue = ""
        lastShopDialogue = {}

        time = 0

        if not settings.didshopcutscene then
            playIntro = true
        end

        FreeplayMenuTheme:play()
        FreeplayMenuTheme:setLooping(true)

        -- Look ch, im sorry, but i am using XML's for this       😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭
        cartridgeGuy = Sprite()
        cartridgeGuy:setFrames(getSparrow("shop/CGShop_assets"))
        for i = 0, 3 do
            cartridgeGuy:addAnimByPrefix("idle-" .. i, "idle0"..(i+1).."0", 24, false)
            cartridgeGuy:addAnimByPrefix("idle-" .. i .. "-alt", "idle0"..(i+1).."0-alt", 24, false)
        end
        cartridgeGuy:addAnimByPrefix("scared", "CG_Scared01", 24, false)
        cartridgeGuy:addAnimByPrefix("scared-alt", "CG_Scared02_Loop", 24, false)

        -- choose a random idle animation
        local idleAnim = love.math.random(0, 3)
        cartridgeGuy:play("idle-" .. idleAnim, true)

        cartridgeGuy:setGraphicSize(math.floor(1.375* cartridgeGuy.width))
        cartridgeGuy:updateHitbox()
        cartridgeGuy.x = 0
        cartridgeGuy.y = 1280 - cartridgeGuy.height

        shopGroup:add(cartridgeGuy)

        if playIntro then
            cartridgeIntro = Sprite()
            cartridgeIntro:setFrames(getSparrow("shop/CGIntro_assets"))
            cartridgeIntro:addAnimByPrefix("intro", "CG_Intro", 24, false)
            cartridgeIntro:play("intro", false)
            cartridgeIntro:setGraphicSize(math.floor(1.375* cartridgeIntro.width))
            cartridgeIntro:updateHitbox()
            cartridgeIntro.x = 0
            cartridgeIntro.alpha = 0;
        end

        cartridgeLight = Sprite()
        cartridgeLight:load(getImage("shop/CandleLight"))
        cartridgeLight.x = cartridgeGuy.x + 67 - cartridgeLight.width/2
        cartridgeLight.y = cartridgeGuy.y + 508 - cartridgeLight.height/2
        shopGroup:add(cartridgeLight)

        shopSign = Sprite()
        shopSign:setFrames(getSparrow("shop/CGShopSign_assets"))
        shopSign:addAnimByPrefix("signThing", "ShopSign", 24, false)
        shopSign.y = 200
        shopGroup:add(shopSign)


    end,

    update = function(self, dt)
        if inShop then shopGroup:update(dt) end
        if not inShop then freeplayGroup:update(dt) end
        if playIntro then
            cartridgeIntro:update(dt)
        end
    end,

    draw = function(self)
        if inShop then shopGroup:draw() end
        if not inShop then freeplayGroup:draw() end

        if playIntro then
            cartridgeIntro:draw()
        end
    end,

    leave = function()

    end,
}