-- Day algebraic type
data Day = Mon | Tue | Wed | Thur | Fri | Sat | Sun
  deriving (Eq, Ord, Show, Read)

-- Alternative definitions of isWeekend function
isWeekend :: Day -> Bool
isWeekend Sat = True
isWeekend Sun = True
isWeekend _ = False

isWeekend2 day = day == Sat || day == Sun

isWeekend3 day = day >= Sat

-- Copy of StudentMark type synonym from worksheet 4
data StudentMark = Student String Int
  deriving (Eq, Show)

betterStudent :: StudentMark -> StudentMark -> String
betterStudent (Student s1 m1) (Student s2 m2)
  | m1 >= m2 = s1
  | otherwise = s2

-- Shapes algebraic type
data Shape = Circle Float | Rectangle Float Float
  deriving (Eq, Show)

area :: Shape -> Float
area (Circle r) = pi * r * r
area (Rectangle h w) = h * w

-- Address algebraic type (note that a constructor can have
-- the same name as the type).
data Address = Address Building String
  deriving (Show)

data Building = Name String | Number Int
  deriving (Show)

-- Binary tree algebraic type
data Tree = Null | Node Int Tree Tree
  deriving (Eq, Show)

-- Binary tree test data
testTree = Node 20 (Node 3 (Node 12 Null Null) (Node 7 Null Null)) (Node 8 (Node 4 (Node 6 Null Null) Null) Null)

-- Binary search tree test data
testSearchTree = Node 5 (Node 1 Null Null) (Node 8 (Node 7 Null Null) Null)

height :: Tree -> Int
height Null = 0
height (Node _ st1 st2) = 1 + max (height st1) (height st2)

sumValues :: Tree -> Int
sumValues Null = 0
sumValues (Node n st1 st2) = n + sumValues st1 + sumValues st2

-- ==== My Code ====

-- Ex 1
data Month = January | February | March | April | May | June | July | August | September | October | November | December
  deriving (Eq, Ord, Show, Read)

data Season = Spring | Summer | Autumn | Winter
  deriving (Eq, Ord, Show, Read)

-- Ex 2
season :: Month -> Season
season mon
  | mon > February && mon <= May =      Spring
  | mon > May && mon <= August =        Summer
  | mon > August && mon <= November =   Autumn
  | mon >= January || mon == December = Winter

-- Ex 3
numberOfDays :: Month -> Int -> Int
numberOfDays mon year
  | mon == February && (year `mod` 4) == 0      = 29
  | mon == February                             = 28
  | elem mon [April, June, September, November] = 30
  | otherwise                                   = 31

-- Ex 4
data Point = Point Float Float
  deriving (Eq, Show)

-- Ex 5
data PositionedShape = PositionedShape Shape Point
  deriving (Eq, Show)

-- Ex 6
move :: PositionedShape -> Float -> Float -> PositionedShape
move (PositionedShape shape (Point x1 y1)) x2 y2 = PositionedShape shape (Point (x1+x2) (y1+y2))

-- Ex 7
numberOfNodes :: Tree -> Int
numberOfNodes Null                = 0
numberOfNodes (Node _ left right) = 1 + numberOfNodes left + numberOfNodes right

-- Ex 8
isMember :: Int -> Tree -> Bool
isMember _ Null                = False
isMember x (Node y left right) = (x == y) || isMember x left || isMember x right

-- Ex 9
leaves :: Tree -> [Int]
leaves Null                = []
leaves (Node x Null Null)  = [x]
leaves (Node _ left right) = leaves left ++ leaves right

-- Ex 10
testBinaryTree = Node 5 (Node 1 Null Null) (Node 8 (Node 7 Null Null) Null)

inOrder :: Tree -> [Int]
inOrder (Null)                = []
inOrder (Node val left right) = inOrder left ++ [val] ++ inOrder right

-- Ex 11
insert :: Int -> Tree -> Tree
insert x (Null) = Node x Null Null
insert x (Node val left right)
  | x == val                 = (Node val left right)
  | x < val && left == Null  = (Node val (Node x Null Null) right)
  | x < val                  = (Node val (insert x left) right)
  | x > val && right == Null = (Node val left (Node x Null Null))
  | x > val                  = (Node val left (insert x right))

-- Ex 12
listToSearchTree :: [Int] -> Tree
listToSearchTree [] = Null
listToSearchTree xs = insert (last xs) (listToSearchTree (init xs))

binaryTreeSort :: [Int] -> [Int]
binaryTreeSort xs = inOrder (listToSearchTree xs)