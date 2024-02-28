{- Week6.hs
 This module illustrates the use of functions as values
-}

import Data.Char

twice :: (Int -> Int) -> Int -> Int
twice f x = f (f x)

multiply :: Int -> Int -> Int
multiply x y = x * y

double :: Int -> Int
double = multiply 2

doubleAll :: [Int] -> [Int]
doubleAll = map (*2)

areDigits :: String -> [Bool]
areDigits = map isDigit

keepPositive :: [Int] -> [Int]
keepPositive = filter (>0)

keepDigits :: String -> String
keepDigits = filter isDigit

addUp :: [Int] -> Int
addUp = foldr (+) 0 

myConcat :: [[a]] -> [a]
myConcat = foldr (++) []

-- ==== My Code ====

-- Ex 1
mult10 :: [Int] -> [Int]
mult10 = map (*10)

-- Ex 2
onlyLowerCase :: String -> String
onlyLowerCase = filter (isLower)

-- Ex 3
orAll :: [Bool] -> Bool
orAll = foldr (||) False

-- Ex 4
sumSquares :: [Int] -> Int
sumSquares xs = foldr (+) 0 (map (^2) xs)

-- Ex 5 (Redefined in 12)
-- zeroToTen :: [Int] -> [Int]
-- zeroToTen xs = filter (>=0) (filter (<=10) xs)

-- Ex 6
squareRoots :: [Float] -> [Float]
squareRoots xs = map (sqrt) (filter (>=0) xs)

-- Ex 7
countBetween :: Float -> Float -> [Float] -> Int
countBetween lower upper xs = length (filter (>=lower) (filter (<=upper) xs))

-- Ex 8 (Redefined in 13)
-- alwaysPositive :: (Float -> Float) -> [Float] -> Bool
-- alwaysPositive fun xs = foldr (&&) True (map (>0) (map fun xs))

-- Ex 9 (Redefined in 13)
-- productSquareRoots :: [Float] -> Float
-- productSquareRoots xs = foldr (*) 1 (squareRoots xs)

-- Ex 10
removeFirst :: (a -> Bool) -> [a] -> [a]
removeFirst _ [] = []
removeFirst fun (x:xs)
  | fun x     = xs
  | otherwise = x:(removeFirst fun xs)

-- Ex 11
removeLast :: (a -> Bool) -> [a] -> [a]
removeLast fun xs = reverse (removeFirst fun (reverse xs))

-- Ex 12
zeroToTen :: [Int] -> [Int]
zeroToTen = filter (\x -> x >= 0 && x <= 10)

-- Ex 13
-- alwaysPositive :: (Float -> Float) -> [Float] -> Bool
-- alwaysPositive = foldr ()

-- reverse' :: [a] -> [a]
-- reverse' = foldr (\x xs -> xs:[x]) []