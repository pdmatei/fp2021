{-
   non-tail list reversal
-}
--reverse [] = []
reverse (x:xs) = (reverse xs) ++ [x]   -- ++ is the append operator 

{-
  complexity? -> NOT EXPONENTIAL
 reverse [1,2,3] = (reverse [2,3]) ++ [1]
                 = ((reverse [3]) ++ [2]) ++ [1]
                 = (((reverse []) ++ [3]) ++ [2]) ++ [1]
                 = [3,2,1]

-}

tail_reverse l = tr l []
                    where tr [] acc = acc
                          tr (x:xs) acc = tr xs (x:acc) 
                    
{-
complexity? - linear 

tail_reverse [1,2,3] =
tr [1,2,3] [] =
tr [2,3] (1:[]) = 
tr [3] (2:1:[]) =
tr [] (3:2:1:[]) =
= 3:2:1:[] = [3,2,1]

-}

-- finding duplicates in a list
-- find_dups [1,2,3,4,1,4,7,8,1] = [1,4,1]
-- dups is the list of currently found DUPLICATES
-- unique is the list of currently seen elements

find_dups :: [Integer] -> [Integer]
find_dups l = fn l [] []
        where fn :: [Integer] -> [Integer] -> [Integer] -> [Integer]
              fn [] dups unique = dups
              fn (x:xs) dups unique 
                    | member x unique = fn xs (x:dups) unique
                    | otherwise = fn xs dups (x:unique)
              member :: Integer -> [Integer] -> Bool
              member _ [] = False
              member x (y:ys) 
                    | x == y = True
                    | otherwise = member x ys


size :: [Integer] -> Integer
size l = sz 0 l
        where sz :: Integer -> [Integer] -> Integer
              sz n [] = n
              sz n (_:xs) = sz (n+1) xs

-- write a function which returns true if a list has AT LEAST 3 elements
f (_:_:_:_) = True
f _ = False

-- un-named variables




{-
   Amazon Lambda -> (Alex and his team - programmed in Rust)

   Runtime Verification (start-up) which verifies smart-contracts?
   (Blockchain & Ethereum) developed a tool to verify smart-contracts:
       * v0 - Python
       * current version - Haskell

   Cornet - project for verifying network correctness
       * Cornet API - in Scala (a combination of Java and Haskell)  

   Java 8 has some functional features

   #F - functional "Microsoft" language

   "TypeScript" - functional, type-oriented Javascript language/framework


-}






















