-- Functional code
addWord :: String -> [String] -> [String]
addWord x xs = xs ++ [x]

wordsToString :: [String] -> String
wordsToString words = foldr (++) [] ([ i ++ "\n" | i <- (init words) ] ++ [last words])

wordsOfLength :: Int -> [String] -> [String]
wordsOfLength len words = [ i | i <- words, (length i) == len]

-- User Interface code
addWordToList :: [String] -> IO ()
addWordToList words = do
  putStr "Enter the word to add: "
  str <- getLine
  let newWords = addWord str words
  writeFile "words.txt" (show newWords)

displayAllWords :: [String] -> IO ()
displayAllWords words = do
  putStrLn (wordsToString words)
  writeFile "words.txt" (show words)

displayAllWordsLen :: [String] -> IO ()
displayAllWordsLen words = do
  putStr "Enter the length of words: "
  str <- getLine
  let len = read str :: Int
  putStrLn (wordsToString (wordsOfLength len words))
  writeFile "words.txt" (show words)

quit :: [String] -> IO ()
quit words = writeFile "words.txt" (show words)

runMenu :: String -> [String] -> IO ()
runMenu "a" words = addWordToList words
runMenu "b" words = displayAllWords words
runMenu "c" words = displayAllWordsLen words
runMenu "d" words = quit words
runMenu _ words   = writeFile "words.txt" (show words)

main :: IO ()
main = do
  wordFile <- readFile "words.txt"
  let words = read wordFile :: [String]
  putStrLn ("There are currently " ++ show (length words) ++ " words in the file.")
  putStr "Select an option:\n(a) Add a word to the list\n(b) Display all words\n(c) Display all words of a specific length\n(d) Exit\n> "
  selection <- getLine
  runMenu selection words