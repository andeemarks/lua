function retry(count, body) 
    for i = 1, count do
        coro = coroutine.create(body)
        coroutine.resume(coro)
        if (coroutine.status(coro) == "dead") then
            print(i)
            return
        end
    end

    print("Gave up after " .. count .. " attempts")
end

retry(5, 
    function()
        if math.random() > 0.2 then
            coroutine.yield( "Something bad happened" )
        end

        print("Succeeded")
    end
)