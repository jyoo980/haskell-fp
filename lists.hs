{- Design a function which determines the length of a list -}
getLength :: [x] -> Int
getLength [] = 0
getLength (_:xs) = 1 + getLength xs

main :: IO()
main =  putStrLn "_"