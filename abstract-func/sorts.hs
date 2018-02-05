-- Quicksort (start)
-- Some may say that this is not a "true" implementation, since do not sort in-place
quickSort :: (Ord x) => [x] -> [x]
quickSort [] = []
quickSort (x:xs) = quickSort (filter (<x) xs)
                   ++ [x] ++
                   quickSort (filter (>x) xs)
-- Quicksort (end)

-- Mergesort (start)
fstHalf :: (Ord a) => [a] -> [a]
fstHalf [] = []
fstHalf xs = take (length xs `div` 2) xs

sndHalf :: (Ord a) => [a] -> [a]
sndHalf [] = []
sndHalf xs = drop (length xs `div` 2) xs

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
    | x <= y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

mergeSort :: (Ord a) => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs =
    merge mergeSort(fstHalf xs) mergeSort(sndHalf xs)
-- Mergesort (end)