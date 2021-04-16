
{-

   [[1,2,3],[4,5,6],[7,8,9]]

   [["1","2","3"],["4","5","6"],["7","8","9"]]

   ["1 2 3 ","4 5 6 ","7 8 9 "]

   "1 2 3 \n4 5 6 \n7 8 9 \n"   


-}

displayMatrix :: [[Integer]] -> String
displayMatrix = (bind '\n') .
                (map ((bind ' ') . (map show)))
                  where bind :: Char -> [String] -> String
                        bind c l = foldr (\s acc -> s ++ [c] ++ acc) [] l


-- m = [[1,2,3],[4,5,6],[7,8,9]]
-- [[], [], []]

transpose ([]:_) = []
transpose m = (map head m):(transpose (map tail m))



product m1 m2 = map 
                  (\l -> map 
                          (\c -> foldr (+) 0 (zipWith (*) l c)) 
                          (transpose m2)
                  ) 
                  m1
                


img = [['@', ' ', '@'],['@', '@', '@'], [' ', ' ', ' ']]
{-
    ..@
    @@@ 
    ...
 
 tr:
   .@.
   .@.
   .@@ 

rotation right
   .@.
   .@.
   .@@

vertical flip
-}
vflip :: [[Char]] -> [[Char]]
vflip = reverse

--horizontal flip
hflip :: [[Char]] -> [[Char]]                      
hflip = map reverse

rotate90left :: [[Char]] -> [[Char]]
rotate90left = hflip . vflip . transpose

rotate90right :: [[Char]] -> [[Char]]
rotate90right = transpose

invert :: [[Char]] -> [[Char]]
invert = map (map op)
          where op ' ' = '@'
                op '@' = ' '


sequence = [vflip, invert, rotate90left]

seq :: [[[Char]] -> [[Char]]] -> [[Char]] -> [[Char]]
seq l = foldr (.) (\x->x) l


