function concatenate(a1, a2)
    local dest = (a1 or {})
    for i = 1, (#(a2 or {})) do
        dest[#dest + 1] = a2[i]
    end

    return dest
end
