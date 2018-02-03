-- This file contains a custom implementation of a Vector (math)

-- Declares a vector of type a, with a constructor consuming 3 fields (Vector in 3D)
data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i + l) (j + m) (k + n)

vmult :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vmult` (Vector l m n) = Vector (i * l) (j * m) (k * n)

-- Scalar multplication of a vector
smult :: (Num t) => Vector t -> Vector t -> t
(Vector i j k) `smult` (Vector l m n) = (i * l) + (j * m) + (k * m)