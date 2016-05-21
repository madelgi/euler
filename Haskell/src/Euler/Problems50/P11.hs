--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P11
-- Problem: What is the greatest product of four adjacent number in the same 
--          direction (up, down, left, right, diagonally) in Data/numgrid.txt
--
--------------------------------------------------------------------------------
module Euler.Problems50.P11 where

import System.IO        ( IOMode(..), hGetContents, openFile
                        , hClose )
import Control.Monad
import Data.List        ( transpose, tails )


--------------------------------------------------------------------------------
-- | First attempt, process the file and calculate the solution. Very ugly brute 
--   force.
main = do
   contents <- readFile "Data/numgrid.txt"
   print . allMaxs $ processGrid contents

allMaxs xs = (nonDiagMax xs, maxLists $ diagMax xs)

-- | For processing the diagonal products
diagMax :: [[Int]] -> [[Int]]
diagMax ws | length ws < 4 = []
diagMax ws = (rightDiagMax $ take 4 ws) : (leftDiagMax $ take 4 ws) : (diagMax $ tail ws)

maxLists xs = maximum $ concat xs

rightDiagMax :: [[Int]] -> [Int]
rightDiagMax (x:xs) | length x < 4 = []
rightDiagMax qs@(xs:ys:zs:ws:[]) = diagProduct : rightDiagMax (map tail qs)
   where diagProduct = (head $ drop 3 xs) * (head $ drop 2 ys) * (head $ drop 1 zs) * (head ws)

leftDiagMax :: [[Int]] -> [Int]
leftDiagMax (x:xs) | length x < 4 = []
leftDiagMax qs@(xs:ys:zs:ws:[]) = diagProduct : leftDiagMax (map tail qs)
   where diagProduct = (head xs) * (head $ drop 1 ys) * (head $ drop 2 zs) * (head $ drop 3 ws)

-- | For processing the horizontal and vertical products
nonDiagMax :: [[Int]] -> Int
nonDiagMax ys = max rowMax colMax
   where rowMax = maximum $ map (\x -> maximum (multFour x)) ys
         colMax = maximum $ map (\x -> maximum (multFour x)) (transpose ys)

multFour :: [Int] -> [Int]
multFour xs | (length xs) < 4 = []
multFour xs = product (take 4 xs) : (multFour $ tail xs)

-- | For processing the text file into a list of lists
processGrid :: String -> [[Int]]
processGrid tri = let strs = map (words) (lines tri)
                  in  map (map read) strs

--------------------------------------------------------------------------------
-- | Found on the project euler problem 11 forum (still uses processGrid above)
sol2 :: IO ()
sol2 = do 
   contents <- readFile "Data/numgrid.txt"
   let grid = processGrid contents
   print $ maximum $ map (flip ($ 4) grid) [maxInRows, maxInCols, maxInLR, maxInRL]

myMaximum [] = 0
myMaximum xs = maximum xs

takeBy n = filter ((n==) . length) . map (take n) . tails

maxBy n = myMaximum . map product . takeBy n

maxInRows n = maximum . map (maxBy n)
maxInCols n = maxInRows n . transpose
maxInLR n = maxInRows n . transpose . zipWith drop [0..]
maxInRL n = maxInLR n . map reverse
