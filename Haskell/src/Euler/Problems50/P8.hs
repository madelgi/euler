-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P8
-- Problem: Find the 13 adjacent digits in the 1000 digit number grid that 
--          have teh greatest product
--
-------------------------------------------------------------------------------
module Euler.Problems50.P8 where

import Data.Grid       ( processedGrid )
import Data.List       ( transpose )

-- | Uses multHelper on the grid and the transposition of the grid
main :: Int
main = max normVal transVal
   where normVal  = maximum $ map (maximum . multHelper) processedGrid
         transVal = maximum $ map (maximum . multHelper) (transpose processedGrid)

-- | Takes a list of integers
multHelper :: [Int] -> [Int]
multHelper [] = []
multHelper ys@(x:xs) 
   | length ys < 13 = []
   | otherwise      = (product $ take 13 ys) : (multHelper xs)
