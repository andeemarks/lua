describe("queue", function()
    require("queue")
    local q

    setup(function() 
        q = Queue:new()
    end)
    
  it("is initially empty", function()
    assert.is_nil(q:remove())
  end)
    
  it("creates a first-in, first-out data structure", function()
    q:add("first")
    q:add("second")
    assert.is_equal("first", q:remove())
    assert.is_equal("second", q:remove())
    assert.is_nil(q:remove())
  end)
end)
