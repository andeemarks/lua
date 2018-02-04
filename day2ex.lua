function concatenate(a1, a2)
    print("Concatenating " .. a1 .. " and " .. a2)
    local dest = a1
    for i = 1, #a2 do
        dest[#dest + 1] = a2[i]
    end

    return dest
end

local mt = {
    __index = strict_read,
    __newindex = strict_write
}

treasure = {}
setmetatable(treasure, mt)

local _private = {}

function strict_read(table, key)
    if _private[key] then
        return _private[key]
    else
        error("Invalid key: " .. key)
    end
end

function strict_write(table, key, value)
    if value and _private[key] then
        error("Duplicate key: " .. key)
    else
        _private[key] = value
    end
end

local glob_mt = {
    __add = concatenate
}

setmetatable(_G, glob_mt)

a1 = {1, 2, 3}
print(_ENV.a1)
a2 = {4, 5, 6}
print(_ENV.a2)
print(a1 + a2)

treasure.gold = 30
-- treasure.gold = 35
treasure.gold = nil
print(treasure.bronze)
