-- Take a look at the two following definitions below

intMap :: (Int -> a) -> [Int] -> [a]
intMap _ [] = []
intMap f (x:xs) = f x : intMap f xs

paraMap' :: (x -> y) -> [x] -> [y]
paraMap' _ [] = []
paraMap' f (x:xs) = f x : paraMap' f xs

{-
  By inspecting the type signatures, we see that intMap is a map over type Int, while
  paraMap is a map over type x. This is an example of parametric polymorphism in action. 

  A function call like: intMap (\x -> length x) ["Alice", "Bob", "John"] will fail
-}

intQSort :: [Int] -> [Int]
intQSort [] = []
intQSort (x:xs) = intQSort (filter (<x) xs)
                  ++ [x] ++
                  intQSort (filter (>x) xs)

polyQSort :: (Ord a) => [a] -> [a]
polyQSort [] = []
polyQSort (x:xs) = polyQSort (filter (<x) xs)
                   ++ [x] ++
                   polyQSort (filter (>x) xs)