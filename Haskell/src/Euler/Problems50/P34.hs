-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P34
-- Problem: Find the sum of all number which are equal to the sum of the 
--          factorial of their digits.
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P34 where

import Utils.Common ( toDigits )

-- | Brute force solution. Took a rough guess at an efficient limit, could 
--   probably be whittled down a bit.
main = sum $ filter (\n -> n == sum (map factorial (toDigits n)))  [10..99999]

factorial :: Int -> Int
factorial n = product [2..n]
