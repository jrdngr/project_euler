testVal = 600851475143

function factors(n::Int64)
    factors = []
    reducedN = n
    current = 1
    while current < sqrt(n)
        if reducedN % current == 0
            push!(factors, current)
            reducedN /= current
        end
        current += 1
    end
    return push!(factors, n)
end

function isPrime(n::Int64)
    return factors(n) == [1,n]
end

function getPrimes(max::Int64)
    primes = []
    @progress for i in 2:max
        if isPrime(i)
            push!(primes, i)
        end
    end
    return primes;

end

function primeFactors(n::Int64)
    fac = factors(n)
    primes = getPrimes(convert(Int64, floor(sqrt(n))))
    primeFactors = []
    for factor in fac
        if in(factor, primes)
            push!(primeFactors, factor)
        end
    end
    return primeFactors
end

@time primeFactors(testVal)
