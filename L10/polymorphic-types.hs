
-- polymorphic type (a type "container")
data List a = Void | Cons a (List a) deriving Show 

-- data [a] = [] | (:) a [a]

l1 :: List Integer
l1 = Cons 1 (Cons 2 (Cons 3 Void))

l2 :: [] Integer
l2 = [1,2,3]

-- conversion function
toHaskell :: List a -> [a]
toHaskell Void = []
toHaskell (Cons x xs) = x : (toHaskell xs)

fromHaskell :: [a] -> List a
fromHaskell [] = Void
fromHaskell (x:xs) = Cons x (fromHaskell xs)

fromHaskell' :: [a] -> List a
fromHaskell' = foldr Cons Void 

-- [e1, e2, e3]
-- e1 `op` (e2 `op` (e3 `op` initial_value))
-- Cons e1 (Cons e2 (Cons e3 initial_value))

-- acc :: (List a)


-- monomorphic types (they have a single shape)
data Color = Red | Green | Blue deriving Show


{-
   Useful types (type-definitions)

    - Trees: (*)  when showing an HTML page (when implementing a browser)
             (**) developing game bots (or AI gaming)

                 initial_state
  AI move     a1 /     \  a2    \ a3
             state1      s2    
 player move  / \ 
             s  


             (***) in compilers

             for (int i=0; i<n; i++){
				if (x > 0)
					{<p1>}
				else
					<p2>
             }

             Abstract Syntax Tree
             for ...
              |
             if ...
             / \
            p1  p2

-}

-- Trees are containers:
-- binary trees, where values are polymorphic (can be anything)

{-
             key :: a
       /                 \
   left                   right
   subtree :: (Tree a)    subtree :: (Tree a)
-}

data Tree a = Vid | Node (Tree a) a (Tree a) deriving Show

{-
    what is the difference between (e.g.)
    (Leaf 9) and (Node Vid 9 Vid) ?
    they are equivalent

    we need an algorithm to establish when two trees are identical
-}


t1 :: Tree Integer
t1 = Node (Node (Node Vid 5 Vid) 2 Vid) 4 (Node (Node Vid 9 Vid) 1 (Node Vid 0 Vid))


{-
     4
    / \ 
   2  1
  /  / \
 5   9  0 

  flatten
    |
    V
 [5,2,4,9,1,0] 

DF - Depth First
BF - Breadth First  possible tree explorations

Tree traversals (the order in which keys are processed)
  - inorder
  - preorder 
  - postorder


Node l key r

key = 4

l =  2      (Node (Node Vid 5 Vid) 2 Vid)
    /
   5 

flatten l = [5,2]


r =  1      (Node (Node Vid 9 Vid) 1 (Node Vid 0 Vid))
    / \
   9   0

flatten r = [9,1,0]

flatten (Node l 4 r) = [5,2]++[4]++[9,1,0]
-}


-- flattening a tree
flatten :: Tree a -> [a]
flatten Vid = []
flatten (Node l key r) = (flatten l)++[key]++(flatten r)






