{- This file will contain implementations for sorting algorithms -}

quickSort :: (Ord x) => [x] -> [x]
quickSort [] = []
quickSort (x:xs) = quickSort (filter (<x) xs)
                   ++ [x] ++
                   quickSort (filter (>x) xs)