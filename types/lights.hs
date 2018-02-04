{- We can define our own data type here, let's call it TrafficLight
   In this case, we're NOT going to derive any class instances, e.g. Eq, Show, etc...
   We're going to make our own.
-}

data TrafficLight = Red | Yellow | Green

-- Let's define Equality (Eq) for the TrafficLight 

instance Eq TrafficLight where
    Red == Red = True
    Yellow == Yellow = True
    Green == Green = True
    _ == _ = False