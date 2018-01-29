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
-- double [] = []
-- double (x:xs) = [x, x] ++ double xs Naive, but easy to understand implementation  
double xs = foldr (\x-> (++) [x,x]) [] xs

{- Design a function which adds all numbers in a list -}
mySum :: [Int] -> Int
-- mySum [] = 0
-- mySum (x:xs) = x + mySum xs  Naive implementation
mySum xs = foldl (+) 0 xs

{- Design a function which produces the product of all numbers -}
prod :: [Int] -> Int
-- prod [] = 1
-- prod (x:xs) = x * prod xs    Naive implementation
prod xs = foldl (*) 1 xs

{- Design a function which produces the nth fibonacci number -}
fibNum :: Int -> Int
fibNum n
  | n == 0 = 0
  | n <= 1 = 1
  | otherwise = fibNum(n-1) + fibNum(n-2)

{- Design a function which produces a list of n fibonacci numbers -}
fib :: Int -> [Int]
fib n = map fibNum [1..n]

addToAll :: [Int] -> Int -> [Int]
addToAll [] n = []
addToAll (x:xs) n = (x + n) : addToAll xs n

main :: IO()
main =  putStrLn "_"