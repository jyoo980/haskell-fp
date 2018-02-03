-- This file contains an example implementation of a Binary Search Tree

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Eq, Ord)

-- We need some function that we can use to initially create a simple tree
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

-- Inserting into correct place (BST)
insertInto :: (Ord a) => a -> Tree a -> Tree a
insertInto x EmptyTree = singleton x
insertInto x (Node a left right)
    | x == a = Node x left right
    | x < a = Node a (insertInto x left) right
    | x > a = Node a left (insertInto x right)

-- Searching for a value in a BST
isPresent :: (Ord a) => a -> Tree a -> Bool
isPresent x EmptyTree = False
isPresent x (Node a left right)
    | x == a = True
    | x < a = isPresent x left
    | x > a = isPresent x right