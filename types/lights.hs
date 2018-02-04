{- We can define our own data type here, let's call it TrafficLight
   In this case, we're NOT going to derive any class instances, e.g. Eq, Show, etc...
   We're going to make our own.
-}

data TrafficLight = Red | Yellow | Green

-- Let's define Equality (Eq) for the TrafficLight 
-- Done by pattern matching. The last case is a catch-all, where every other case (combination) is False
instance Eq TrafficLight where
    Red == Red = True
    Yellow == Yellow = True
    Green == Green = True
    _ == _ = False    
    
-- Let's define Show for the TrafficLight    
instance Show TrafficLight where
    show Red = "Red Light"
    show Yellow = "Yellow Light"
    show Green = "Green Light"
-- We can now print to the CLI