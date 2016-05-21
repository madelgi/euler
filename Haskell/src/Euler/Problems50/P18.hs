--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P18
-- Problem: Find the maximum total from top to bottom of the triangle 
--          easy_triangle.txt
--
--------------------------------------------------------------------------------
module Euler.Problems50.P18 where

import System.IO
import Control.Monad

-------------------------------------------------------------------------------
-- | Initial Attempt
--   
--   Because I did it first, I use the same algorithm from the more difficult 
--   triangle problem (67?), building up the max sums from the bottom of the 
--   triangle
main :: IO ()
main = do
   tri      <- readFile "Data/easy_triangle.txt" 
   print $ maxPath . reverse . processTri $ tri

-- | Simple helper function, takes the raw text file and converts it to a list
--   of integer lists.
processTri :: String -> [[Int]]
processTri tri = let strs = map (words) (lines tri)
                 in  map (map read) strs

maxPath :: [[Int]] -> Int
maxPath [[]]     = 0
maxPath [[x]]    = x
maxPath (x:y:zs) = maxPath $ (collapsePath x y) : zs

collapsePath :: [Int] -> [Int] -> [Int]
collapsePath _ []  = []
collapsePath (a:b:cs) (y:ys)
   | a+y > b+y    = (a+y) : collapsePath (b:cs) ys 
   | otherwise    = (b+y) : collapsePath (b:cs) ys

--------------------------------------------------------------------------------
-- | Alternate Solutions

-- | Found on the Project Euler forums.
altSol2 = do
   triangle <- openFile "Euler/Data/easy_triangle.txt" ReadMode
   contents <- hGetContents triangle
   print . foldr1 reduce . map ((map read) . words) . lines $ contents
      where reduce a b = zipWith (+) a (zipWith max b (tail b))
