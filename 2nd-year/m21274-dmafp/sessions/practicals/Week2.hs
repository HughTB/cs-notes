-- Ex 1
absolute :: Int -> Int
absolute x
  | x < 0     = -x
  | otherwise = x

-- Ex 2
sign :: Int -> Int
sign x
  | x < 0     = -1
  | x > 0     = 1
  | otherwise = 0

-- Ex 3
howManyEqual :: Int -> Int -> Int -> Int
howManyEqual x y z
  | x == y && y == z            = 3
  | x == y || y == z || x == z  = 2
  | otherwise                   = 0

-- Ex 4
sumDiagonalLengths :: Float -> Float -> Float -> Float
sumDiagonalLengths x y z = diagLen x + diagLen y + diagLen z
  where diagLen a = sqrt (2 * a^2)

-- Ex 5
taxiFare :: Int -> Float
taxiFare d
  | d <= 10   = 2.20 + (0.50 * fromIntegral d)
  | otherwise = 2.20 + 5.00 + (0.30 * fromIntegral (d - 10))

-- Ex 6
howManyAboveAverage :: Int -> Int -> Int -> Int
howManyAboveAverage a b c
  | (x > avg && y > avg) || (y > avg && z > avg) || (x > avg && z > avg) = 2
  | x > avg || y > avg || z > avg                                        = 1
  | otherwise                                                            = 0
  where 
    avg = (x + y + z) / 3
    x = fromIntegral a
    y = fromIntegral b
    z = fromIntegral c

-- Ex 7
validDate :: Int -> Int -> Bool
validDate day month
  | day <= 0 || month <= 0 || month > 12                                  = False
  | day > 28 && month == 2                                                = False
  | day > 30 && (month == 4 || month == 6 || month == 9 || month == 11)   = False
  | day > 31                                                              = False
  | otherwise                                                             = True

-- Ex 8
daysInMonth :: Int -> Int -> Int
daysInMonth month year
  | month == 2 && mod year 4 == 0                           = 29
  | month == 2                                              = 28
  | (month == 4 || month == 6 || month == 9 || month == 11) = 30
  | otherwise                                               = 31

-- Written Exercises

{-
Ex 1.
sumThree 3 5 7
~> 3 + 5 + 7          sumThree
~> 8 + 7              +
~> 15                 +

sumThree 8 (1 + 3) 2
~> sumThree 8 4 2     +
~> 8 + 4 + 2          sumThree
~> 12 + 2             +
~> 14                 +

Ex 2.
threeDifferent 1 4 2
~> 1 /= 4 && 4 /= 2 && 1 /= 2     threeDifferent
~> True && 4 /= 2 && 1 /= 2       /=
~> True && True && 1 /= 2         /=
~> True && True && True           /=
~> True && True                   &&
~> True                           &&

threeDifferent 1 7 7
~> 1 /= 7 && 7 /= 7 && 1 /= 7     threeDifferent
~> True && 7 /= 7 && 1 /= 7       /=
~> True && False && 1 /= 7        /=
~> True && False && True          /=
~> False && True                  &&
~> False                          &&

Ex 3.
howManyEqual 3 5 2
~> 3 == 5 && 5 == 2             Guard 1
~> False && 5 == 2              ==
~> False && False               ==
~> False                        &&
~> 3 == 5 || 5 == 2 || 3 == 2   Guard 2
~> False || 5 == 2 || 3 == 2    ==
~> False || False || 3 == 2     ==
~> False || False || False      ==
~> False || False               ||
~> False                        ||
~> 0                            Otherwise

howManyEqual 5 2 5
~> 5 == 2 && 2 == 5             Guard 1
~> False && 2 == 5              ==
~> False && False               ==
~> False                        &&
~> 5 == 2 || 2 == 5 || 5 == 5   Guard 2
~> False || 2 == 5 || 5 == 5    ==
~> False || False || 5 == 5     ==
~> False || False || True       ==
~> False || True                ||
~> True                         ||
~> 2
-}