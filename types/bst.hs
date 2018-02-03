-- This file contains an example implementation of a Binary Search Tree

data Tree a = emptyTree | Node a (Tree a) (Tree a) deriving (Show, Eq, Ord)
