-- We don't import '||' from the prelude, so that we can
-- define our own version

import Prelude hiding ((||), (&&), gcd)

-- The following line declares the || operator (which we are about to
-- re-define) to be right associative and to have precedence 2. This
-- is necessary in order for expressions such as False || x > 2 to be
-- valid (e.g. it sets the precedence of || to be lower than >).

infixr 2 ||

-- A naive re-implementation of the Prelude operator ||
(||) :: Bool -> Bool -> Bool
True || True = True
False || True = True
True || False = True
False || False = False

-- An alternative re-implementation
--(||) :: Bool -> Bool -> Bool
--False || False   = False
--_ || _           = True

-- Another alternative re-implementation
--(||) :: Bool -> Bool -> Bool
--True || _     =  True
--False || a    = a

fact :: Int -> Int
fact n
  | n == 0 = 1
  | n > 0 = n * fact (n - 1)
  | otherwise = error "factorials not defined for negative ints"

mult :: Int -> Int -> Int
mult n m
  | n == 0 = 0
  | n > 0 = m + mult (n - 1) m
  | otherwise = - mult (- n) m

divide :: Int -> Int -> Int
divide n m
  | n < m = 0
  | otherwise = 1 + divide (n - m) m

-- === My Code ===

infixr 3 &&

-- Implementation 1
-- (&&) :: Bool -> Bool -> Bool
-- True && True   = True
-- True && False  = False
-- False && True  = False
-- False && False = False

-- Implementation 2
-- (&&) :: Bool -> Bool -> Bool
-- True && True = True
-- _ && _       = False

-- Implementation 3
(&&) :: Bool -> Bool -> Bool
False && _ = False
True && p  = p

-- Ex 2
exOr :: Bool -> Bool -> Bool
exOr True False = True
exOr False True = True
exOr _ _        = False

-- Ex 3
ifThenElse :: Bool -> Int -> Int -> Int
ifThenElse True x _  = x
ifThenElse _ _ y = y

-- Ex 4
daysInMonth :: Int -> Int
daysInMonth 2  = 28
daysInMonth 4  = 30
daysInMonth 6  = 30
daysInMonth 9  = 30
daysInMonth 11 = 30
daysInMonth _  = 31
-- Not sure about this, the month 13 apparently exists now

validDate :: Int -> Int -> Bool
validDate day month = day <= (daysInMonth month)
-- This doesn't entirely work - you could input an invalid day or month

-- Ex 5 (Redefined in 11)
-- sumNumbers :: Int -> Int
-- sumNumbers x
--   | x > 0  = x + sumNumbers (x - 1)
--   | x == 0 = 0
--   | x < 0  = error "Invalid input"

-- Ex 6 (Redefined in 11)
-- sumSquares :: Int -> Int
-- sumSquares x
--   | x > 0  = x^2 + sumSquares (x - 1)
--   | x == 0 = 0
--   | x < 0  = x^2 + sumSquares (x + 1)

-- Ex 7 (Redefined in 11)
-- power :: Int -> Int -> Int
-- power x y
--   | y > 0  = x * power x (y - 1)
--   | y == 0 = 1
--   | y < 0  = error "Invalid input"

-- Ex 8
sumFromTo :: Int -> Int -> Int
sumFromTo x y
  | x < 0 || y < 0 = error "Invalid input"
  | x <= y         = x + sumFromTo (x + 1) y
  | otherwise      = 0

-- Ex 9
gcd :: Int -> Int -> Int
gcd x y
  | x < 0 || y < 0 = error "Invalid input"
  | x == y = x
  | otherwise = gcd (abs (x - y)) (min x y)

-- Ex 10
intSquareRoot :: Int -> Int
intSquareRoot n = findRoot n n

findRoot :: Int -> Int -> Int
findRoot n s
  | s <= 0     = 1
  | s * s <= n = s
  | otherwise  = findRoot n (s - 1)

-- Ex 11
sumNumbers :: Int -> Int
sumNumbers 0 = 0
sumNumbers n = n + sumNumbers (n - 1)
-- Not sure how to check for a negative with a pattern, maybe use guard?

sumSquares :: Int -> Int
sumSquares 0 = 0
sumSquares n = n ^ 2 + sumSquares (n - 1)

power :: Int -> Int -> Int
power _ 0 = 1
power x y = x * power x (y - 1)