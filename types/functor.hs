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
        a huge difference that we are not introduced to. 
-}

class Functor' f where
    fmap' :: (a -> b) -> f a -> f b 

-- fmap' takes a function going from a to b, a functor f applied to type b, and produces a functor f on b

instance Functor' [] where
    fmap' = map

-- Are functions functors?
-- Let's take a look at the function below
squareNum :: (Num a) => a -> a
squareNum x = x * x

-- We previously said that a functor is for things which may be "mapped" over. We can interpret the squareNum 
-- function as the "infinite set of all numbers that squareNum can produce"

-- Here we'll see how a Tree type is also a functor

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Eq)

-- fmap for type Tree will be 
-- fmap :: (a -> b) -> Tree a -> Tree b
instance Functor' Tree where
    fmap' f EmptyTree = EmptyTree
    fmap' f (Node x leftChild rightChild) = 
        Node (f x) (fmap' f leftChild) (fmap' f rightChild)