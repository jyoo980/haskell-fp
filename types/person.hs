data Person = Person { 
    firstName :: String,
     lastName :: String,
     age :: Int
} deriving (Show, Eq)

john = Person {firstName = "John", lastName = "Appleseed", age = 24}
alice = Person {firstName = "Alice", lastName = "Atlanta", age = 33}
johnCopy = Person {firstName = "John", lastName = "Appleseed", age = 24} 