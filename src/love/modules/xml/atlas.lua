local Atlas = Object:extend()

function Atlas:new(parent,path)
    self.x = x
    self.y = y
    self.parent = parent

    self.coolParsed = json.decode(love.filesystem.read(path))
    self:_loadAtlas(self.coolParsed)

    return self
end

function self:_loadAtlas(a)
    if a.AN.STI ~= nil then
        local STI = a.AN.STI.SI

        self.curFrame = STI.FF
        self.parent.origin = {x= STI.TRP.x, y= STI.TRP.y}
    end
    self.framerate = a.MD.FRT
end