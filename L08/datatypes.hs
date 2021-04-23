
{- Type definition -}
{- Type implementation (how data is stored, and retrieved) -}

data Shape = Rectangle Integer Integer | Circle Integer 





{- How do we retrieve data (from stored objects)? USING PATTERN MATCHING-}

area :: Shape -> Integer
area (Circle r) = 3*r*r
area (Rectangle x y) = x*y

-- how data is being constructed?
l = [Rectangle 1 2, Circle 5, Rectangle 4 5]

-- Answer 1:
data Student = FirstName String | LastName | Age Integer

l = [FirstName "Matei", LastName, Age 10]

{-
   FirstName :: String -> Student
   LastName :: Student 
   Age :: Integer -> Student
-}

-- Answer 2:
data Student = Name String String | Age Integer

{-
	ghci> :t Name
	Name :: String -> String -> Student
	Age :: Integer -> Student
-}

-- Answer 3: (WRONG - type error)
--data Student = String String Integer

-- Answer 4: RIGHT
data Person = Student String String Integer

-- type definition: Person
-- a single implementation of this type: 
-- Student :: String -> String -> Integer -> Person

avrgAge :: [Person] -> Integer
avrgAge l = (foldr (\(Student _ _ age) acc -> acc + age) 0 l) `div` (length l)

avg :: [Person] -> Integer
avg l = (foldr (+) 0 $ map (\(Student _ _ x)->x) l) `div` (length l)
			



