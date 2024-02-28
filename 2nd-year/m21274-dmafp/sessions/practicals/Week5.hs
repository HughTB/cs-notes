{- Week5.hs
 This file illustrates list patterns and recursion over lists.
-}

import Prelude hiding (fst, snd, head, tail, sum, concat, reverse, zip)

-- Definitions of the prelude functions fst and snd

fst (x,_)       = x
snd (_,y)       = y

-- Definitions of the prelude functions head and tail

head (x:_)      = x
tail (_:xs)     = xs

absFirst :: [Int] -> Int
absFirst []     = -1
absFirst (x:xs) = abs x

sum :: [Int] -> Int 
sum []     = 0
sum (x:xs) =   x + sum xs

doubleAll :: [Int] -> [Int]
doubleAll []      = []
doubleAll (x:xs)  = 2*x : doubleAll xs

concat :: [[a]] -> [a]
concat []         = []
concat (x:xs)     = x ++ concat xs

reverse :: [a] -> [a]
reverse []      = []
reverse (x:xs)  = reverse xs ++ [x]

zip :: [a] -> [b] -> [(a,b)]
zip (x:xs) (y:ys)  = (x,y) : zip xs ys
zip _ _            = []

type StudentMark = (String, Int)
testData :: [StudentMark]
testData =
  [ ("John", 53),
    ("Sam", 16),
    ("Kate", 85),
    ("Jill", 65),
    ("Bill", 37),
    ("Amy", 22),
    ("Jack", 41),
    ("Sue", 71)
  ]

-- ==== My Code ====

-- Ex 1
headPlusOne :: [Int] -> Int
headPlusOne []    = (-1)
headPlusOne (x:_) = x + 1

-- Ex 2
duplicateHead :: [a] -> [a]
duplicateHead []     = []
duplicateHead (x:xs) = x:x:xs

-- Ex 3
rotate :: [a] -> [a]
rotate []       = []
rotate [x]   = [x]
rotate (x:y:xs) = y:x:xs

-- Ex 4
listLength :: [a] -> Int
listLength []     = 0
listLength (x:xs) = 1 + listLength xs

-- Ex 5
multAll :: [Int] -> Int
multAll []     = 1
multAll (x:xs) = x * multAll xs

-- Ex 6
andAll :: [Bool] -> Bool
andAll []     = True
andAll (x:xs) = x && andAll xs

-- Ex 7
orAll :: [Bool] -> Bool
orAll []     = False
orAll (x:xs) = x || orAll xs

-- Ex 8
countIntegers :: Int -> [Int] -> Int
countIntegers _ [] = 0
countIntegers x (y:ys)
  | x == y    = 1 + countIntegers x ys
  | otherwise = countIntegers x ys

-- Ex 9
removeAll :: Int -> [Int] -> [Int]
removeAll _ [] = []
removeAll x (y:ys)
  | x == y    = removeAll x ys
  | otherwise = y:(removeAll x ys)

-- Ex 10
removeAllButFirst :: Int -> [Int] -> [Int]
removeAllButFirst _ [] = []
removeAllButFirst x (y:ys)
  | x == y = y:(removeAll x ys)
  | otherwise = y:(removeAllButFirst x ys)

-- Ex 11
listMarks :: String -> [StudentMark] -> [Int]
listMarks _ [] = []
listMarks matchName ((name, mark):studentMarks)
  | matchName == name = mark:(listMarks matchName studentMarks)
  | otherwise         = listMarks matchName studentMarks

-- Ex 12
sorted :: [Int] -> Bool
sorted [] = True
sorted [x] = True
sorted (x:y:xs)
  | x <= y    = sorted (y:xs)
  | otherwise = False

-- Ex 13
prefix :: [Int] -> [Int] -> Bool
prefix [] _          = True
prefix _ []          = False
prefix (x:xs) (y:ys)
  | x == y    = prefix xs ys
  | otherwise = False

-- Ex 14
subSequence :: [Int] -> [Int] -> Bool
subSequence _ [] = False
subSequence x y
  | prefix x y = True
  | otherwise  = subSequence x (tail y)
