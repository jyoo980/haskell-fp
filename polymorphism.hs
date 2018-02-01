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