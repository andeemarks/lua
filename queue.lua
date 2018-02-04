Queue = {}
Queue.__index = Queue

function Queue:show() 
    for i = 1, #self do
        print(self[i])
    end
end

function Queue:new()
    local queue = {}
    setmetatable(queue, Queue)
    return queue
end

function Queue:add(item)
    self[#self + 1] = item
end

function Queue:remove()
    local head = self[1]
    for i = 2, #self do
        self[i - 1] = self[i]
    end
    self[#self] = nil

    return head
end
