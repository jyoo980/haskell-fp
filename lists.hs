{- Design a function which determines the length of a list -}
getLength :: [x] -> Int
getLength [] = 0
getLength (_:xs) = 1 + getLength xs

{- Design a function which reverses a list -}
reverseList :: [x] -> [x]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

main :: IO()
main =  putStrLn "_"