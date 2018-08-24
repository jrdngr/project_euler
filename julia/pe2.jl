fibs = [0, 1]

function nextFib(fibs)
    push!(fibs, fibs[end] + fibs[end - 1])
    return fibs[end]
end

current = 1
sum = 0

while fibs[end] < 4_000_000
    nextFib(fibs)
    if fibs[end] % 2 == 0
        sum += fibs[end]
    end
end

sum
