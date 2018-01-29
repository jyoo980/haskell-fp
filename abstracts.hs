{- This file will contain my own implementations of the canonical higher-order functions -}

myFoldr :: (x -> y -> y) -> y -> [x] -> y
myFoldr _ b [] = b
myFoldr f b (x:xs) = f x (myFoldr f b xs)