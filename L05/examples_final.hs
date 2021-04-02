import Data.Char
-- map examples

-- addOne [1,2,3] = [2,3,4] 
addOne l = map plusOne l
             where plusOne x = x + 1

-- remHead ["This","is","a","text"] = ["his","s","","ext"]
remHead l = map tail l

-- toString ['a','b','c'] = ["a","b","c"]
toString l = map toString l
             where toString c = [c]

-- foldr examples
--ppfoldr :: (a -> b -> b) -> b -> [a] -> b
ppfoldr op acc [] = acc
ppfoldr op acc (x:xs) = op x (ppfoldr op acc xs)

-- sum [1,2,3] = 6
sum l = ppfoldr (+) 0 l

-- makeLower "AbCD" = "abcd"
makeLower l = foldr op [] l
                where op x acc = (toLower x):acc

-- reverse "abcd" = "dcba"
reverse :: [a] -> [a]
reverse l = foldl op [] l
              where op acc x = x:acc

-- functional composition
{-
 ==========================
    Functional composition
  ==========================

    . (dot) is the operator for functional composition
    Prelude> :t (.)
    (b -> c) -> (a -> b) -> a -> c


    (.) f g  equiv f.g
    g has type (a->b)
    f has type (b->c)

    (f.g) has type a -> c


    f x = x + 1
    g x = 2*x

    (f.g) x
    (g.f) x

    
-}





