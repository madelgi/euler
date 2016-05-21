-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P9
-- Problem: There exists exactly one Pythagorean triplet for which 
--          a+b+c = 1000. Find the product abc.
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P9  where

-- | List comprehension solution. Some analysis could probably drive down the
--   ranges for a and b.
main :: Int
main  = product $ head [ [a,b,c] | a <- [1..500], b <- [1..500],
                                      let c = 1000-a-b, a^2+b^2==c^2]

