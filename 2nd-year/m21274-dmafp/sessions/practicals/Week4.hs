import Data.Char

type StudentMark = (String, Int)

betterStudent :: StudentMark -> StudentMark -> String
betterStudent (s1, m1) (s2, m2)
  | m1 >= m2 = s1
  | otherwise = s2

marks :: [StudentMark] -> [Int]
marks stmks = [mk | (st, mk) <- stmks]

pass :: [StudentMark] -> [String]
pass stmks = [st | (st, mk) <- stmks, mk >= 40]

-- An example list of student marks
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

addPairs :: [(Int, Int)] -> [Int]
addPairs pairList = [i + j | (i, j) <- pairList]

minAndMax :: Int -> Int -> (Int, Int)
minAndMax x y
  | x <= y = (x, y)
  | otherwise = (y, x)

-- === My code ===

-- Ex 1
sumDifference :: Int -> Int -> (Int, Int)
sumDifference x y = (x + y, x - y)

-- Ex 2
grade :: StudentMark -> Char
grade (_, mark)
  | mark > 100 = error "Mark must be 0-100"
  | mark >= 70 = 'A'
  | mark >= 60 = 'B'
  | mark >= 50 = 'C'
  | mark >= 40 = 'D'
  | mark >= 0  = 'F'
  | otherwise  = error "Mark must be 0-100"

-- Ex 3
capMark :: StudentMark -> StudentMark
capMark (name, mark)
  | mark > 100 = error "Mark must be 0-100"
  | mark > 40  = (name, 40)
  | mark >= 0  = (name, mark)
  | otherwise  = error "Mark must be 0-100"

-- Ex 4
firstNumbers :: Int -> [Int]
firstNumbers x = [1 .. x]

-- Ex 5
firstSquares :: Int -> [Int]
firstSquares x = [ n^2 | n <- firstNumbers x ]

-- Ex 6
capitalise :: String -> String
capitalise str = [ toUpper char | char <- str ]

-- Ex 7
onlyDigits :: String -> String
onlyDigits str = [ char | char <- str, isDigit char ]

-- Ex 8
capMarks :: [StudentMark] -> [StudentMark]
capMarks marks = [ capMark mark | mark <- marks ]

-- Ex 9
gradeStudents :: [StudentMark] -> [(String, Char)]
gradeStudents marks = [ (name, grade (name, mark)) | (name, mark) <- marks ]

-- Ex 10
duplicate :: String -> Int -> String
duplicate str count
  | count == 1 = str
  | count > 1  = str ++ duplicate str (count - 1)
  | otherwise  = error "Count must be greater than 0"

-- Ex 11
divisors :: Int -> [Int]
divisors x = [ n | n <- [1 .. x], x `mod` n == 0 ]

-- Ex 12
isPrime :: Int -> Bool
isPrime x
  | x == 1    = True
  | x <= 0    = error "Input must be greater than 0"
  | otherwise = divisors x == [1, x]

-- Ex 13
-- split :: [(a, b)] -> ([a], [b])
-- split pairs = ([ fst pair | pair <- pairs ], [ snd pair | pair <- pairs ])

split :: [(a, b)] -> ([a], [b])
split pairs = ([ item | (item, _) <- pairs ], [ item | (_, item) <- pairs ])