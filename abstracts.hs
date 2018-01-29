{- This file will contain my own implementations of the canonical higher-order functions -}

myFoldr :: (x -> y -> y) -> y -> [x] -> y
myFoldr _ b [] = b
myFoldr f b (x:xs) = f x (myFoldr f b xs)

myMap :: (x -> y) -> [x] -> [y]
myMap _ [] = []
myMap f (x:xs) = f x : myMap f xs

myFilter :: (x -> Bool) -> [x] -> [x]
myFilter _ [] = []
myFilter pred (x:xs) = 
    if pred x
        then x : myFilter pred xs
        else
            myFilter pred xs

andMap :: (x -> Bool) -> [x] -> Bool
myFilter _ [] = True
myFilter pred (x:xs) =
    pred x && myFilter pred xs

orMap :: (x -> Bool) -> [x] -> Bool
orMap _ [] = False
orMap pred (x:xs) =
    pred x || orMap pred xs