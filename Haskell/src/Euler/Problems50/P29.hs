-------------------------------------------------------------------------------
-- |
-- Problem 29: How many distinct terms are in the sequence generate by a^b for
--             2 <= a <= 100 and 2 <= b <= 100?
--
-------------------------------------------------------------------------------

module Euler.Problems50.P29 where

import Data.List (nub)

-- | One-liner: calculate full list, remove duplicates w/ nub, and calculate
--   the length
main = length . nub $ [ x^y | x <- [2..100], y <- [2..100]] 
