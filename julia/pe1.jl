function valid(n)
    return n % 3 == 0 || n % 5 == 0
end

sum = 0

for i = 1:999
    if valid(i)
        sum += i
    end
end

sum
