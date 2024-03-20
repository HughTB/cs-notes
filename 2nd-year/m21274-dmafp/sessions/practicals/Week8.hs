helloWorld :: IO ()
helloWorld = putStrLn "Hello, World!"

displayFile :: IO ()
displayFile = do 
    putStr "Enter the filename: "
    name <- getLine
    contents <- readFile name
    putStr contents

getInt :: IO Int
getInt = do 
    str <- getLine
    return (read str :: Int)

isPalindrome :: String -> String
isPalindrome str
   | str == reverse str  = str ++ " is a palindrome"
   | otherwise           = str ++ " is not a palindrome"

pal :: IO ()
pal = do 
    line <- getLine
    let response = isPalindrome line
    putStrLn response

palLines :: IO ()
palLines = do 
    putStr "Enter a line: "
    str <- getLine
    if str == "" then 
        return ()
    else do 
        putStrLn (isPalindrome str)
        palLines


-- ==== My Code ====

-- Ex 1
greeting :: IO ()
greeting = do
  putStr "Enter your name: "
  name <- getLine
  putStrLn ("Hello, " ++ name)

-- Ex 2
addTwoNumbers :: IO ()
addTwoNumbers = do
  putStr "Enter the first number: "
  line1 <- getLine
  let x = read line1 :: Int
  putStr "Enter the second number: "
  line2 <- getLine
  let y = read line2 :: Int
  putStrLn ("The sum of " ++ show x ++ " and " ++ show y ++ " is " ++ show (x + y))

-- Ex 3
copyFile :: IO ()
copyFile = do
  putStr "Original file: "
  orig <- getLine
  putStr "Coppied file: "
  new <- getLine
  contents <- readFile orig
  writeFile new contents

-- Ex 4
buildList :: [String] -> IO ()
buildList list = do
  putStr "Enter a string or nothing to exit: "
  newString <- getLine
  if newString == ""
    then print list
    else buildList (list ++ [newString])

listBuilder :: IO ()
listBuilder = do
  buildList []

-- Ex 5
sumMultiple :: Int -> Int -> IO ()
sumMultiple n x = do
  putStr "Enter an int: "
  str <- getLine
  let int = read str :: Int
  if n > 1
    then sumMultiple (n - 1) (x + int)
    else print (x + int)

multiSum :: IO ()
multiSum = do
  putStr "How many integers do you wish to sum: "
  line <- getLine
  let n = read line :: Int
  sumMultiple n 0