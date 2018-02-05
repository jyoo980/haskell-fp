-- Quicksort
-- Some may say that this is not a "true" implementation, since do not sort in-place
quickSort :: (Ord x) => [x] -> [x]
quickSort [] = []
quickSort (x:xs) = quickSort (filter (<x) xs)
                   ++ [x] ++
                   quickSort (filter (>x) xs)

-- Mergesort
fstHalf :: (Ord a) => [a] -> [a]
fstHalf [] = []
fstHalf xs = take (length xs `div` 2) xs

sndHalf :: (Ord a) => [a] -> [a]
sndHalf [] = []
sndHalf xs = drop (length xs `div` 2) xs