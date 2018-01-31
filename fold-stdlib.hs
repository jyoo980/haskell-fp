{- Implementation of some standard library functions with folds -}

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 (\x acc -> if x > acc then x else acc)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) [] 

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

tail' :: [a] -> a
tail' = foldr1 (\_ acc -> acc)