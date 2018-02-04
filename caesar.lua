CaesarCipher = {}
CaesarCipher.__index = CaesarCipher

function CaesarCipher:new(offset)
    local cipher = {
        offset = offset
    }
    setmetatable(cipher, CaesarCipher)
    return cipher
end

function CaesarCipher:encrypt(text)
	return text:gsub("%a", function(t)
			local base = (t:lower() == t and string.byte('a') or string.byte('A'))
 
			local r = t:byte() - base
			r = r + self.offset
			r = r%26 -- works correctly even if r is negative
			r = r + base
			return string.char(r)
		end)
end
