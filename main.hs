fizz :: Int -> String
fizz n | n `mod` 15 == 0  = "FizzBuzz"
       | n `mod` 3  == 0  = "Fizz"
       | n `mod` 5  == 0  = "Buzz"
       | otherwise = show n

factorial :: Int -> Int
factorial n | n == 0 = 1
            | otherwise = factorial(n-1) * n


main :: IO()
main = putStrLn "_"