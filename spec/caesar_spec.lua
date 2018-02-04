describe("The caesar cipher", function()
    require("caesar")
    local encrypter
    local decrypter

    setup(function() 
        encrypter = CaesarCipher:new(7)
        decrypter = CaesarCipher:new(-7)
    end)


  it("encrypts a string by offsetting characters by the specified amount", function()
 	local text = "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz"
    local encrypted = encrypter:encrypt(text)
    assert.is_equal("HIJKLMNOPQRSTUVWXYZABCDEFG hijklmnopqrstuvwxyzabcdefg", encrypted)
    end)

  it("decrypts a string by offsetting characters by the opposite of the specified amount", function()
 	local text = "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz"
    local encrypted = encrypter:encrypt(text)
    local decrypted = decrypter:encrypt(encrypted)
    assert.is_equal(text, decrypted)
    end)
end)
 