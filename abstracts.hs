{- This file will contain my own implementations of the canonical higher-order functions -}

myFoldr :: (x -> y -> y) -> y -> [x] -> y
myFoldr _ b [] = b
myFoldr f b (x:xs) = f x (myFoldr f b xs)

{- Foldl, complains about duplicate type signatures -}
myFoldl _ b [] = b
myFoldl f b (x:xs) = myFoldl f (f x b) xs

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
andMap _ [] = True
andMap pred (x:xs) =
    pred x && andMap pred xs

orMap :: (x -> Bool) -> [x] -> Bool
orMap _ [] = False
orMap pred (x:xs) =
    pred x || orMap pred xs

buildList :: (Int -> y) -> Int -> [y]
buildList f n =
    if n <= 0
        then []
        else
            buildList f (n-1) ++ [f (n-1)] 
            