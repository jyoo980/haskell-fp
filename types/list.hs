-- This file contains an example of a recursive type class

-- data List a = Empty | Cons a (List a) deriving (Show, Eq, Ord, Read)

infixr 5 :-:        
-- We've defined a new operator which acts as Cons
data List a = Empty | a :-: (List a) deriving (Show, Eq, Ord, Read)

test = 1 :-: 2 :-: 3 :-: Empty

-- Let's create our own append function (.++)
infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys               
(x :-: xs) .++ ys = x :-: (xs .++ ys) 