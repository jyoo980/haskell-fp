{- Design a function which determines the length of a list -}
getLength :: [x] -> Int
getLength [] = 0
getLength (_:xs) = 1 + getLength xs

{- Design a function which reverses a list -}
reverseList :: [x] -> [x]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

{- Design a function which twice duplicates list elements -}
double :: [x] -> [x]
double [] = []
double (x:xs) = [x, x] ++ double xs    -- Naive, but easy to understand implementation  

{- Design a function which adds all numbers in a list -}
mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs

{- Design a function which produces the product of all numbers -}
prod :: [Int] -> Int
prod [] = 1
prod (x:xs) = x * prod xs

main :: IO()
main =  putStrLn "_"