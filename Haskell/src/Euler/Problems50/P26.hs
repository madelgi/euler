-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P1
-- Problem: Find the value of d < 1000 for which 1/d contains the longest 
--          recurring cycle in its decimal fraction part.
--          
-------------------------------------------------------------------------------

module Euler.Problems50.P26  where

-- | Finds the length of the repetend of 1/n -- uses some number theory stuff (in
--   particular, the infinite series representation of repeating decimals)
repetendLength :: Int -> Int
