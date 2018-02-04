Villain = {
   health = 100 
}

function Villain:new(name)
    local obj = {
        name   = name
    }

    setmetatable(obj, self)
    self.__index = self

    return obj
end

function Villain:take_hit()
    self.health = self.health - 10
end
