fib2 :: Int -> Integer
fib2 = (map fib [0 ..] !!) 
    where 
        fib 0 = 0
        fib 1 = 1
        fib n = fib2 (n-2) + fib2 (n-1)

[(x,z) | x <- [0..50], let z = fib2 x, z <= 4000000, z `mod` 2 == 0]
x = 33
p2 = sum [z | x <- [0..33], let z = fib2 x, z <= 4000000, z `mod` 2 == 0]
