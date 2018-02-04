-- Let's first define a Tree type 

data Tree a = Leaf a | Branch (Tree a) (Tree a) deriving (Show, Eq)

-- Defining a function which produces an in-order traversal list
inOrder :: Tree a -> [a]
inOrder (Leaf a) = [a]
inOrder (Branch left right) = 
    inOrder left ++ inOrder right

{-  Let's define our Functor class
   
    The Functor typeclass is for things which may be "mapped-over", e.g. the List typeclass is an example
    NOTE:
        The type of fmap' does not contain any concrete types, i.e. Int, Bool, String, etc... this is  
        a huge difference that we are not introduce to. 
-}
class Functor' f where
    fmap' :: (a -> b) -> f a -> f b 
