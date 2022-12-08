function r
    cd (git root)
end

function rd -a pattern
    fd "$pattern" (git root)
end
