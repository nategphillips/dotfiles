if isinteractive()
    try
        using BenchmarkTools
        using Revise
    catch e
        @warn "Error initializing packages." exception = (e, catch_backtrace())
    end
end
