-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P6
-- Problem: Find the difference between the sum of the squares of the first 
--          one hundred natural numbers and the square of the sum.
-- 
-------------------------------------------------------------------------------
module Euler.Problems50.P6  where

-- | The most obvious solution -- two list comprehensions, subtract them
main :: Int
main =  (sum [ i | i<-[1..100] ])^2 - sum [ i^2 | i<-[1..100] ] 
