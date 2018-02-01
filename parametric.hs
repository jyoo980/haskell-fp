{- Take a look at the two following definitions below -}

intMap :: (Int -> a) -> [Int] -> [a]
intMap _ [] = []
intMap f (x:xs) = f x : intMap f xs

paraMap' :: (x -> y) -> [x] -> [y]
paraMap' _ [] = []
paraMap' f (x:xs) = f x : paraMap' f xs