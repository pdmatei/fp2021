import Data.Char

-- addOne [1,2,3] = [2,3,4] 
addOne l = map (+1) l
{-
    (+1) is a functional closure in prefix (functional) form
-}

-- remHead ["This","is","a","text"] = ["his","s","","ext"]
remHead :: [String] -> [String]
remHead = map tail

{-  map :: (a -> b) -> [a] -> [b]
    tail :: String -> String     (not really true)


    (map tail) :: [String]

    (map tail) a functional closure

    (map tail) :: (a -> b) -> [a] -> [b]


-}
-- toString ['a','b','c'] = ["a","b","c"]
toString = map (:[])

-- sum [1,2,3] = 6
sum :: [Integer] -> Integer
sum = foldr (+) 0 

-- makeLower "AbCD" = "abcd"
makeLower :: String -> String 
makeLower = foldr ((:).toLower) []

{-
   type Function is [Char] -> [Char]

   (:) :: Char -> Function
   toLower :: Char -> Char

   (.) :: (b   -> c)       -> (a    ->    b) -> a -> c
          Char -> Function     Char -> Char

   ((:).toLower) :: Char -> Function
   ((:).toLower) :: Char -> [Char] -> [Char]

   \x acc-> (toLower x):acc

   Functional composition works with function that take ONE PARAMETER

-}

-- reverse "abcd" = "dcba"
reverse :: [a] -> [a]
reverse = foldl (flipp (:)) [] 
              -- where op acc x = x:acc
              -- op :: [a] -> a -> [a]
              -- (:) :: a -> [a] -> [a]


-- (flipp (-)) 0 2  is (-) 0 2
--
flipp :: (a -> b -> c) -> b -> a -> c
flipp op x y = op y x


add :: Integer -> Integer -> Integer
add x y = x + y

plusOne = add 1  -- a functional closure
{-
                 closes (fixes) "a computational context" in our example: x = 1
-}

{-
   "1 2 3 \n4 5 6 \n7 8 9 \n"

   ["1 2 3 ","4 5 6 ","7 8 9 "]

   [[1,2,3], [4,5,6], [7,8,9]]

     'e'
    ["xt"]
   spaceSep "This is a text" = ["This", "is", "a", "text"]
-}
spaceSep :: String -> [String]
spaceSep s = foldr op [] s
                where op ' ' acc = "":acc
                      op x [] = [[x]]
                      op x (y:ys) = (x:y):ys

charSep :: Char -> String -> [String]
charSep sep = foldr op [] 
                where op x []
                        | x == sep = []
                        | otherwise = [[x]]
                      op x (y:ys)
                        | x == sep = []:y:ys
                        | otherwise = (x:y):ys


{-
   "1 2 3 \n4 5 6 \n7 8 9 \n"

   ["1 2 3 ","4 5 6 ","7 8 9 "]

   [["1","2","3"], [...],...]

   [[1,2,3], [4,5,6], [7,8,9]]

-}

parse :: String -> [[Integer]]
parse = (map trans) . 
        (charSep '\n')  -- this is a function that takes matrix string and separates it into lines
            where trans = (map read) .
                          (charSep ' ')










