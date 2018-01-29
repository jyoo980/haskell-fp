# haskell-fp

This repository documents my experiments with pure functional programming in Haskell. I am not a functional programmer
by any means, so this repository will likely be riddled with mistakes, faux pas, etc... apologizes in advance. I will 
draw upon my experience with Racket, and some of the code written here will be translations from UBC's CPSC 110. 

## Type Signatures

1. <strong>Currying:</strong> Haskell requires that the type signatures for multi-parameter functions are curried. What this basically means in simple terms is that a partial application is iterated until the multi-paramter function effectively becomes a single paramter function. An example is below:

```Haskell
    addToAll [] n = 0
    addToAll (x:xs) n = (x + n) : addToAll xs n
```
The type signature for `addToAll` would be `addToAll :: [Int] -> Int -> [Int]`, equivalent to stating: first plug in the value for `[Int]`, then plug in what you want to add to each `[Int]`, then produce a new list, `[Int]`

## Lists
Lists in Haskell appear like so: `[1, 2, 3]`. This is exactly like `(cons 1 (cons 2 (cons 3 empty)))` or `(list 1 2 3)` in LISP and LISP-like languages. Below is some useful syntax:

* `: == cons`
* `[] == empty`
* `[1, 2, 3] == 1:(2:(3:[]))) == 1:2:3:[]`
* Commonly seen: `xs` for a function with signature e.g. `[x] -> Int`, can take it to read as the plural of `x`
* `++` is equivalent to LISP `append`

## Questions to address

1. I've noticed that the following code
    ```Haskell
        prod [] = 1
        prod (x:xs) = x * prod xs
    ```
    will not compile if I specify the type signature of `prod` to be `[x] -> x`, but will compile when I specify the type signature to be `[Int] -> Int`. Why is this the case? Is `x` not a more general term for a type? Does `ghci` prefer if one is as specific as possible with types?