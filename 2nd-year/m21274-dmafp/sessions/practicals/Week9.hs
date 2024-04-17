-- ====== Functional code ======
import Data.Time
import Data.List

-- Create a data type to store diary entries
data Entry = Entry String Day String Bool
  deriving (Eq, Show, Read)

testEntries = [
  Entry "Learnt about Github" (fromGregorian 2023 03 15) "I completed a tutorial on how to use Github" True,
  Entry "Met with the clients" (fromGregorian 2023 03 17) "I got to meet with the clients of the project" True,
  Entry "Completed health and safety training" (fromGregorian 2023 03 21) "I just completed the health and safety training" False,
  Entry "First staff meeting" (fromGregorian 2023 03 23) "I attended my first staff meeting" True,
  Entry "Learnt about C" (fromGregorian 2023 03 24) "Did some C stuff" False
  ]

formatDiary :: [Entry] -> String
formatDiary [] = ""
formatDiary ((Entry title date content reviewed):xs)
  = "Title: " ++ title ++ "\n" ++ content ++ "\n" ++ (if reviewed then "Reviewed" else "Not reviewed") ++ ", added on " ++ (show date) ++ "\n\n" ++ (formatDiary xs)

-- ====== Imperative Code ======
getEntry :: [Entry] -> IO ()
getEntry = do
  putStr "Enter the title: "
  title <- getLine
  putStr "Enter the date as ISO8601 string (e.g. 2020-02-29): "
  date <- getLine
  putStr (title ++ " " ++ date)

quit :: [Entry] -> IO ()
quit entries = writeFile "diary.txt" (show entries)

runMenu :: String -> [Entry] -> IO ()
runMenu "a" entries = getEntry entries
runMenu "b" entries = quit entries
runMenu "c" entries = quit entries
runMenu "d" entries = quit entries
runMenu "e" entries = quit entries

main :: IO ()
main = do
  diaryFile <- readFile "diary.txt"
  let entries = read diaryFile :: [Entry]
  putStr (formatDiary entries)
  putStr "Select an option:\n(a) Mark an entry as reviewed\n(b) Update the content of an entry\n(c) Add a new entry\n(d) Show all invalid entries\n(e) Exit\n> "
  selection <- getLine
  runMenu selection entries