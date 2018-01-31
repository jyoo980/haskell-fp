foldr' :: (x -> y -> y) -> y ->[x] -> y
foldr' _ b [] = b
foldr' f b (x:xs)  = f x (foldr' f b xs)

foldl' _ b [] = b
foldl' f b (x:xs) = foldl' f (f x b) xs

map' :: (x -> y) -> [x] -> [y]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (x -> Bool) -> [x] -> [x]
filter' _ [] = []
filter' pred (x:xs)
  | pred x = x : filter' pred xs
  | otherwise = filter' pred xs

andMap :: (x -> Bool) -> [x] -> Bool
andMap _ [] = True
andMap pred (x:xs)
  | pred x = andMap pred xs
  | otherwise = False

orMap :: (x -> Bool) -> [x] -> Bool
orMap _ [] = False
orMap pred (x:xs) = 
    pred x || orMap pred xs
    
buildMap :: (Int -> x) -> Int -> [x]
buildMap _ 0 = []
buildMap f n = buildMap f (n - 1) ++ [f (n - 1)]