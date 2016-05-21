-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P22
-- Problem: Using Data/names.txt, a text file containing over 5,000 names, begin 
--          by sorting it into alphabetical order. Then working out the 
--          alphabetical value for each name, multiply this value by its
--          position in the list to obtain a name score. What is the sum of all
--          the name scores?
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P22  where

import Data.List        ( sort )
import Data.Map         ( (!), fromList )
import Data.List.Split  ( splitOn )

--------------------------------------------------------------------------------
-- | Initial Attempt
main :: IO ()
main = do
   names <- readFile "Data/names.txt"
   print $ sum . map (\(i,n) -> (nameScore n)*i) . zip [1..] $ processNames names

-- | Given a name, calculate the associated score
nameScore :: String -> Int
nameScore x = sum $ map (\s -> points ! s) x
   where points = fromList $ zip ['A'..'Z'] [1..]

-- | Process the file into a list of names sorted alphabetically
processNames :: String -> [String]
processNames s = sort . splitOn "," $ filter (\x -> x /= '\"') s
