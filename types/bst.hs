-- This file contains an example implementation of a Binary Search Tree

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Eq, Ord)

-- We need some function that we can use to initially create a simple tree
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree