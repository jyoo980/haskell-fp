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

{- Design a function which adds n to each element of a list  -}
addToAll :: [Int] -> Int -> [Int]
addToAll [] _ = []
addToAll (x:xs) n = (x + n) : addToAll xs n

{- Design a function which produce true if all numbers are greater than n -}
allGreaterThan :: [Int] -> Int -> Bool
allGreaterThan [] _ = True
allGreaterThan (x:xs) n = 
    (x > n) && allGreaterThan xs n 
    
{- Design a function which flattens a list of integers -}
flatten' :: (Num x) => [[x]] -> [x]
flatten' [] = []
flatten' (x:xs) = x ++ flatten' xs

{- Design a function which produces the last element of a list of integers -}
lastElem :: (Num x) => [x] -> x
lastElem [] = error "List is empty"
lastElem (x:xs) 
  | null xs = x
  | otherwise = lastElem xs

{- Design a function which adds 2 to each number, then maps even to True, and odd to False -}
numToBool :: Int -> Bool
numToBool num 
  | num `mod` 2 == 0 = True
  | otherwise = False

addTwo :: (Num x) => x -> x
addTwo num = num + 2
   
{- Design a function which produces the maximum of a list -}
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "Empty list, no maximum"
maximum' [x] = x
maximum' (x:xs)
  | x > maxTail = x
  | otherwise = maxTail
  where maxTail = maximum' xs
  
{- Design a function which zips two lists together, each element should be a pair -}
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

foo :: Int -> [Int]
foo 0 = []
foo n =
  n : foo (n - 1)

main :: IO()
main =  putStrLn "_"