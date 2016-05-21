-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P43
-- Problem: Find the sum of all 0 to 9 pandigital numbers with the necessary
--          divisibility property.
--
---------------------------------------------------------------------------------
module Euler.Problems50.P43 where

import Data.List

main :: IO ()
main = print . sum $ filter (divProp) purms

divProp :: Int -> Bool
divProp n =    ((n `div` 10^6) `mod` 10^3) `mod` 2  == 0
            && ((n `div` 10^5) `mod` 10^3) `mod` 3  == 0
            && ((n `div` 10^4) `mod` 10^3) `mod` 5  == 0
            && ((n `div` 10^3) `mod` 10^3) `mod` 7  == 0
            && ((n `div` 10^2) `mod` 10^3) `mod` 11 == 0
            && ((n `div` 10^1) `mod` 10^3) `mod` 13 == 0
            && ((n `div` 10^0) `mod` 10^3) `mod` 17 == 0


purms :: [Int]
purms = (map read $ filter (\x -> head x /= '0') $ permutation "0123456789") :: [Int]

permutation :: Eq a => [a] -> [[a]]
permutation [] = [[]]
permutation xs = [x:ys | x <- xs, ys <- permutation (delete x xs)]
