-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P2
-- Problem: By consider the terms in the Fibonacci sequence whose values do
--          not exceed four million, find the sum of the even-valued terms.
--          
-------------------------------------------------------------------------------

module Euler.Problems50.P2  where

-- | Pretty basic solution, except for the semi-clever implementation of fibs.
main = sum [ x | x <- takeWhile (<= 4000000) fibs, even x]
   where
      fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
