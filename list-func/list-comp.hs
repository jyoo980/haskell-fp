{- In this file, we'll go over examples including list comprehensions -}

-- Function which generates a list of even numbers
evens :: Int -> [Int]
evens 0 = []
evens n
    | n `mod` 2 == 0 = evens (n - 1) ++ [n]
    | otherwise = evens (n - 1)
-- The code above is really verbose for such a simple task, here's another way (maybe better)
evens' :: [Int] -> [Int]
evens' xs =
    [x | x <- xs, x `mod` 2 == 0]

{- We'll put a list-comprehension within a function definition, encouraging 
code re-use -}

printns xs = 
    [if x `mod` 2 == 0 then "Even" else "Odd" | x <- xs]