function factors(n)
    factors = []
    reducedN = n
    current = 1
    while current < n
        if reducedN % current == 0
            push!(factors, current)
            reducedN /= current
        end
        current += 1
    end
    return push!(factors, n)
end

function isPrime(n)
    return factors(n) == [1,n]
end

function primeFactors(n)
    fac = factors(n)
    primeFactors = []
    for factor in fac
        if isPrime(factor)
            push!(primeFactors, factor)
        end
    end
    return primeFactors
end

val = 600851475143

@time primeFactors(100000000)
