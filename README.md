# haskell-fp

This repository documents my experiments with pure functional programming in Haskell. I am not a functional programmer
by any means, so this repository will likely be riddled with mistakes, faux pas, etc... apologizes in advance. I will 
draw upon my experience with Racket, and some of the code written here will be translations from UBC's CPSC 110. 

## Table of Contents

1. [Type Signatures](#type-signatures)
2. [Function Application and Currying](#function-application-and-currying)
3. [Lists](#lists)
4. [Fixity](#fixity)
5. [Polymorphism](#polymorphism)
6. [Questions](#questions-to-address)
7. [Glossary](#glossary)

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

### Function Application
Expression evaluation follows the standard order of precendence seen in mathematics, BEDMAS, PEMDAS, etc... There are often times when one wants to specify the order of operations. Take the following for example:

```Haskell
    square :: (Num a) => a -> a
    square x = x * x

    square 3 + 4 + 5
    square (3 + 4 + 5)
```
The calls to `square` will produce different values. We can replace the use of rounded brackets with the `$` operator (func application). Thus, the following becomes the case:

```Haskell
    square (3 + 4 + 5) == square $ 3 + 4 + 5
```

Everything to the <i>right</i> of the `$` operator gains precendence. The benefits of this operator become more readily apparent with the composition of first-order functions, like so:

```Haskell
    sum (filter (\x -> x `mod` 2 == 0) (map id [1..10]))
    sum $ filter (\x -> x `mod` 2 == 0) $ map id [1..10]
```

The two functions above will produce the same value. 

### Currying and Partial Applications (in detail)

Technically, every function in Haskell is a single-parameter function. One may think that this is an absolutely incorrect statement, we've seen functions like the one defined below:

```Haskell
    foo :: (Num a) => a -> a -> a 
    foo x y = x + y
```
What is happening behind the scenes is the following:

```Haskell
    let bar = foo 1
    let baz = bar 2    
```

This functional call was equivalent to calling: `foo 1 2`. This partial application allows greater flexibility in leveraging first-class functions. 

## Lists
Lists in Haskell appear like so: `[1, 2, 3]`. This is exactly like `(cons 1 (cons 2 (cons 3 empty)))` or `(list 1 2 3)` in LISP and LISP-like languages. Below is some useful syntax:

* `: == cons`
* `[] == empty`
* `[1, 2, 3] == 1:(2:(3:[]))) == 1:2:3:[]`
* Commonly seen: `xs` for a function with signature e.g. `[x] -> Int`, can take it to read as the plural of `x`
* `++` is equivalent to LISP `append`

### List Comprehensions

List comprehensions are an extremely useful way to generate lists of useful values. For example, we could generate a list of even numbers with the following function:

```Haskell
    printEvens :: Int -> [Int]
    printEvens 0 = []
    printEvens n
        | n `mod` 2 == 0 = printEvens (n-1) ++ [n] 
        | otherwise = printEvens (n-1)
```

The code above is practically the most inelegant way one could generate a list of even numbers in Haskell. Here's a version using `filter`

```Haskell
    printEvens :: Int -> [Int]
    printEvens n =
        filter (\x -> x `mod` 2 == 0) [1..n]
```

Better, but we can do more:

```Haskell
    printEvens :: Int -> Int
    printEvens n = [x | x <- [1..n], x `mod` 2 == 0]
```

This last example utilized list comprehensions. Specifically, where it was written: 
`[x | x <- [1..n], x mod 2 == 0]`. This is highly analogous to set-builder notation in mathematics. It is easy to read: "the set of x such that x belongs to the set [1..10] and x mod 2 equal 0". The general structure of a list comprehension is as follows:

```Haskell
    [x | {bounds of x}, {prediate for x in this set}]
```
# Fixity

We sometimes want to declare our own operators, e.g. `:-:` for our custom `List` type in `types`. We will then have to specify the fixity of the operator. Note the following:

* `(*)` has fixity: `infixl 7`
* `(+)` has fixity: `infixl 6`

infix<strong>r</strong> and infix<strong>l</strong> differ in terms of right and left associativity. The ordinals `7` and `5` refer to how tightly the operator binds, so:

```Haskell
    4 * 5 + 2 ----> (4 * 5) + 2 
``` 

 The binding above of multiplication preceeding addition occurs due to `(*)` having `infixl 7` while `(+)` having `infixl 6`.

# Polymorphism

If I am being totally honest, I thought polymorphism was something that existed in the realm of object-oriented programming, but like many things, it turned out I was completely mistaken. Haskell supports parametric and ad-hoc polymorphism.

### Parametric Polymorphism

In this subsection, I will refer to functions defined in `parametric.hs`. Notice that `intMap` is a map over the type `Int`, while `paraMap` allows for a map over type `x`. Let's look at the signature of `paraMap` in more detail:

```Haskell
    paraMap :: (x -> y) -> [x] -> [y]
```

Notice that the type variables `x` and `y` are <strong>not</strong> constrained in any way, i.e. they do not appear to the left of `=>`. Hence, `paraMap` was written using parametric polymorphism. A function written using parametric polymorphism will accept parameters of any <strong>legal</strong> type, and operate the same way for each of those types. This is a characteristic called "parametricity".

### Ad-hoc Polymorphism

Ad-hoc polymorphism is a case of polymorphism where a value is produced with respect to the values used to produce it. This may sound confusing, but an example can be the `+` operator in languages such as Python or Java. For example, both usages are valid:

```Python
    > 5 + 3
    8
    > "John" + "Smith"
    "JohnSmith"
```

The result of the `+` operator is therefore dependent on the types it operates on. Consequently, it lacks parmetricity. 

## Questions to address

1. I've noticed that the following code

    ```Haskell
        prod [] = 1
        prod (x:xs) = x * prod xs
    ```
    will not compile if I specify the type signature of `prod` to be `[x] -> x`, but will compile when I specify the type signature to be `[Int] -> Int`. Why is this the case? Is `x` not a more general term for a type? Does `ghci` prefer if one is as specific as possible with types?
    
2. <strong>Duplicate type signatures</strong>: in `abstracts.hs`, I have noticed that `ghci` complains about duplicate type signatures, specifically for `myFoldr` and `myFoldl`, this is interesting, since it does not seem to complain for other ones...

3. <strong>Do overloaded operators lack parametricity?</strong>: e.g. `+` in Python/Java. 

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

* <strong>Algebraic Data Type (ADT)</strong>: an ADT is data that is a composite of other types. Examples include the singly-linked-list, and a binary tree. 