# haskell-fp

This repository documents my experiments with pure functional programming in Haskell. I am not a functional programmer
by any means, so this repository will likely be riddled with mistakes, faux pas, etc... apologizes in advance. I will 
draw upon my experience with Racket, and some of the code written here will be translations from UBC's CPSC 110. 

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