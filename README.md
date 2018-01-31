# haskell-fp

This repository documents my experiments with pure functional programming in Haskell. I am not a functional programmer
by any means, so this repository will likely be riddled with mistakes, faux pas, etc... apologizes in advance. I will 
draw upon my experience with Racket, and some of the code written here will be translations from UBC's CPSC 110. 

## Table of Contents

1. [Type Signatures](#type-signatures)
2. [Function Application and Currying](#function-application-and-currying)
3. [Lists](#lists)
4. [Questions](#questions-to-address)
5. [Glossary](#glossary)

## Type Signatures

1. <strong>Currying:</strong> Haskell requires that the type signatures for multi-parameter functions are curried. What this basically means in simple terms is that a partial application is applied until the multi-parameter function effectively becomes a single parameter function. An example is below:

```Haskell
    addToAll [] n = 0
    addToAll (x:xs) n = (x + n) : addToAll xs n
```
The type signature for `addToAll` would be `addToAll :: [Int] -> Int -> [Int]`, equivalent to stating: first plug in the value for `[Int]`, then plug in what you want to add to each: `Int`, then produce the new list: `[Int]`

2. <strong>Type constraints</strong>: Take the following type signature for a function: `Int -> Int -> Int`. A possible function which matches this type signature could be the following:

```Haskell
    add :: Int -> Int -> Int
    add x y = x + y
```

It makes sense in some languages for addition (add) to be defined for numerical values. We can then enforce what is called a <strong>type constraint</strong>, like so:

```Haskell
    add :: (Num a) => a -> a -> a
    add x y = x + y    
```

This ensures that each instance of `a` will be considered to be constrained to type `Integral`. This is useful for implementing generic algorithms such as `quickSort`. Take the following for example:

```Haskell
    quickSort :: [Int] -> [Int]
    quickSortGeneric :: (Ord x) => [x] -> [x]
```

As the names state, the second implementation of `quickSort` is a more generic implementation which may be applied to data other than `Int`. Whenever a function signature includes a type constraint, we consider it to be a <i>polymorphic function</i>.

## Function Application and Currying

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
    
2. <strong>Duplicate type signatures</strong>: in `abstracts.hs`, I have noticed that `ghci` complains about duplicate type signatures, specifically for `myFoldr` and `myFoldl`, this is interesting, since it does not seem to complain for other ones...

## Glossary

* <strong>λ-abstraction</strong>: this is another term for an anonymous function, i.e. a lambda function. For those new to functional programming/higher order functions, take a look below:

```Haskell
    addThree :: Int -> Int
    addThree n = n + 3

    map addThree [1..10]    
    map (\x -> x + 3) [1..10]
```

The two calls to `map` produce the same result, but the second call made use of a λ-abstraction. Notice that there is no need to define the function which is passed in as argument to map, in the case of this λ-abstraction. 

* <strong>β-reduction</strong>: stemming from the λ-calculus, a β-reduction is the process of calculating a result from the application of a function to an expression. Take for example the following λ-expression, where x is 4.

```Haskell
    (\x -> (x * 2) / 12 + x)
    (\x -> (4 * 2) / 12 + 4)
```

The second line of the code above is where the β-reduction occured, where all occurances of `x` were replaced with the value `4`, reducing the expression.

* <strong>η-conversion</strong>: η-conversion (eta-conversion) is where the addition or removal of an abstraction occurs in a function. This is often used to eliminate redundant λ-abstraction. Take the following for example:

```Haskell
    map (\x -> x) [1..10]
    map id [1..10]
```

The conversion of the λ-abstraction into an equivalent function is an example of η-reduction, while moving from `id` to `(\x -> x)` would be an example of η-abstraction.

* <strong>`foldl1/foldr1`</strong>: these are identical to `foldl` and `foldr`, but there is no need to pass them a starting value; they assume that the first element (`foldl1`) or the last element (`foldr1`) are the starting values and start the fold. 

* <strong>Type class</strong>: think of this as an interface which specifies behaviour specific to the type class. Some examples of commonly used type classes are below:
    * `Num`: consists of `Int`, `Integer`, `Float`, `Double`, `Fractional`, etc... One can think of `Num` as the type class containing          all numerical types.
    * `Eq`: provides an interface for testing for equality, includes `Num`. Interesting: `:t (==)` will produce                                `(==) :: (Eq a) => a -> a -> Bool`. This means the equality operator, `==` belongs to the type class `Eq`.
    * `Ord`: describes types which can be ordered, commonly seen as type constraints to polymorphic sorting algorithms.