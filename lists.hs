{- Design a function which determines the length of a list -}
getLength :: [x] -> Int
getLength [] = 0
getLength (_:xs) = 1 + getLength xs

{- Design a function which compute the sum of elements in a list -}
getSum :: [x] -> Int
getSum x = foldr sum 0 x

main :: IO()
main =  putStrLn "_"