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

-- Counting nodes in a BST
countNodes :: Tree a -> Int 
countNodes EmptyTree = 0
countNodes (Node a left right) =
    1 + countNodes left + countNodes right

-- Produce inorder traversal list of BST
inOrder :: Tree a -> [a]
inOrder EmptyTree = []
inOrder (Node a left right) = 
    inOrder left ++ [a] ++ inOrder right

-- Produce postorder traversal list of BST
postOrder :: Tree a -> [a]
postOrder EmptyTree = []
postOrder (Node a left right) =
    postOrder left ++ postOrder right ++ [a]

-- Produce preorder traversal list of BST
preOrder :: Tree a -> [a]
preOrder EmptyTree = []
preOrder (Node a left right) =
    [a] ++ preOrder left ++ preOrder right