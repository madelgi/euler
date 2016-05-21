-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P31
-- Problem: Given the following coin values,
--          
--             [1,2,5,10,20,50,100,200]
--
--          how many ways can you sum any number of coins to the value 200?
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P31  where

-- | Uses the ways function with the coin values defined below
main = ways 200 coins

-- | Ways takes an integer and a lists of ints, and then returns how many ways
--   you can make the given int out of sums of integers contained in the list,
--   e.g. if you want to make 5 out of 1's and 2's, there are three ways:
--
--   > 5 = 1+1+1+1+1
--   >   = 1+1+1+2
--   >   = 1+2+2
--
--   so we would have
--
--   > ways 5 [1,2]
--   3
ways :: Int -> [Int] -> Integer
ways 0 _  = 1
ways _ [] = 0
ways n (x:xs) = sum [ ways (n - (k*x)) xs | k <- [0..(quot n x)]]

-- | Different coin values
coins = [1,2,5,10,20,50,100,200]
