{- This is the YesNo Typeclass
    we'll try to implement JavaScript-like functionality here. E.g. 
    if (0) alert("Yes") else alert("No")
    if ("") alert("Empty!") else alert("Non-empty!") 
-}

class YesNo a where
    yesno :: a -> Bool

-- The YesNo function here will be True when given any integer other than 0
instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _ = True