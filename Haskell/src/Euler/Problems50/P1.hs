-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P1
-- Problem: Find the sum of all the multiples of 3 or 5 below 1000.
--          
-------------------------------------------------------------------------------

module Euler.Problems50.P1  where

-- | Simple solution using a list comprehension
main :: Int
main  = sum [x | x <- [1..1000], x `mod` 3 == 0, x `mod` 5 == 0]
