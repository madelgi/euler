--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P42
-- Problem: WORDZ
-- Data:    words.txt
--
--------------------------------------------------------------------------------
module Euler.Problems50.P42 where

import System.IO        ( IOMode(..), hGetContents, openFile
                        , hClose )
import Data.List.Split  ( splitOn )
import Data.Map         ( fromList, (!) )
import Data.Char        ( ord )

--------------------------------------------------------------------------------
-- | INITIAL ATTEMPT
main :: IO ()
main = do
   triNums <- readFile "Data/words.txt"
   print $ sol1 $ processWords triNums

-- | Calculate the wordscore of each word in words.txt, filter by whether it's
--   an element of the list of triangle numbers, and then calculate the length
--   of the list.
sol1 xs = length $ filter (\n -> n `elem` triangleList) (map wordscore xs)

-- | Compute the first 40 triangle numbers. There's no way we even need that many -- 
--   the 40th triangle number is 820. If we had a 20 letter word that was all 'Z's,
--   it would sum to 520.
triangleList = map (\n -> floor $ n*(n+1)/2) [1..40] 

-- | calculates the wordscore of a given word
wordscore :: String -> Int
wordscore xs = sum $ map (subtract 64 . ord) xs

-- | Create a list from that humongous single string of words
processWords :: String -> [String]
processWords words = splitOn "," (filter (/='\n') $ removeQuotes words)

-- | Used to remove the quotes from each of the words in words.txt
removeQuotes :: String -> String
removeQuotes x = filter (/='"') x


--------------------------------------------------------------------------------
-- |
-- ATTEMPT 2: Improved by looking at other solutions. The main improvement is in
-- how the file is processed.
sol2 :: IO ()
sol2 = do
   f <- readFile "Data/words.txt"
   let words = read $ "[" ++ f ++ "]"
   print $ problem_42 words

-- | calculates the number of words w/ wordscores that equal triangle nums
problem_42 xs = length [ wordscore a | a <- xs, (wordscore a) `elem` triList ]

-- | A much more clever (not necessarily more efficient?) way of generating 
--   triangle numbers
triList :: [Int]
triList = takeWhile (<300) (scanl1 (+) [1..])
