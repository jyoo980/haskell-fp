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
double (x:xs) = [x,x] : double xs

main :: IO()
main =  putStrLn "_"