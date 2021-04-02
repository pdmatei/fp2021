import Data.Char
-- map examples

-- addOne [1,2,3] = [2,3,4] 
addOne l = map (\x->x+1) l

-- remHead ["This","is","a","text"] = ["his","s","","ext"]
remHead l = map tail l

-- toString ['a','b','c'] = ["a","b","c"]
toString l = map (\c->c:[]) l
          
-- foldr examples
--ppfoldr :: (a -> b -> b) -> b -> [a] -> b
ppfoldr op acc [] = acc
ppfoldr op acc (x:xs) = x `op` (ppfoldr op acc xs)

-- sum [1,2,3] = 6
sum l = ppfoldr (+) 0 l

-- makeLower "AbCD" = "abcd"
makeLower l = foldr (\x acc->(toLower x):acc) [] l

-- reverse "abcd" = "dcba"
reverse :: [a] -> [a]
reverse l = foldl (\acc x->x:acc) [] l
              -- where op acc x = x:acc
              -- op :: [a] -> a -> [a]
              -- (:) :: a -> [a] -> [a]

{-
 ==================================

      Functional composition

 ==================================


-}              
f = \x -> x + 1
g = \x -> 2*x

{-
            f           g
    (.) :: (b -> c) -> (a -> b) ->     a -> c 
            second     first function  result function
            

     a,b,c,d (t) are used to designate types
     x,y,z, etc.       are used to designate parameters, values, etc.

-}

comp f g = \x -> f (g x)

{-Write a function which takes a list of integers, 
  adds 1 to them and converts them to strings. Use functional composition. 
  Hint: function show performs conversion.-}

-- curry vs uncurry function and functional closures <- Topic for the next lecture
plusOne = \l -> map (\x->x+1) l
showInt = \l -> map show l

convert l = (showInt.plusOne) l
{-
                where plusOne l = map (\x->x+1) l
                      showInt l = map show l
-}

{-
  convert [1,2,3] -> [2,3,4] -> ["2","3","4"]
-}

convert' l = map (show.(\x->x+1)) l

 {-
convert' [1,2,3] -> ["2", "3", "4"]
 -}


{-
   parse :: String -> [[Integer]]

   parse "1 2 \n3 4\n" = [[1,2],[3,4]]


-}
-- spaceSep "This is a text" = ["This", "is", "a", "text"]
spaceSep :: String -> [String]
spaceSep s = foldr op [] s
                where op ' ' acc = "":acc
                      op x [] = [[x]]
                      op x (y:ys) = (x:y):ys

{-
   s = ['T', 'h', 'i', 's' ,...]

   'T' op ('h' op ('i' op ('s' op (' ' op ('a' op ( ' ' op....)
   
   op x acc

   x = 'i'
   acc = ["s", "a", "text"]
   op x acc = ["is", "a", "text"]

   x = ' '
   acc = ["is", "a", "text"]
   op x acc = ["", "is", "a", "text"]

-}





















