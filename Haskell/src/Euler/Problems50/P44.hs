-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P44
-- Problem: Find the pair of pentagonal numbers, p_j and p_k, for which their
--          sum and difference are pentagonal and D = |p_k-p_j| is minimised,
--          whats is the value of D?
--          
-------------------------------------------------------------------------------

module Euler.Problems50.P44 where

import Utils.Common     ( isInt )

-- | This function operates on the assumption that the first result is going
--   to be the correct one -- i'm not sure why this is the case, but other
--   approaches in the project euler thread make this seem like a common 
--   assumption.
--
--   TODO: Return and figure out why the eff that's the case
main = head [ x-y | x <- pentNums, y <- takeWhile (<x) pentNums, condition x y]
   where pentNums      = map pentagonalGen [1..] 
         condition x y = (isPentagonal $ abs (x-y)) && (isPentagonal (x+y) )

-- | Generates the nth pentagonal number
pentagonalGen :: (Fractional a) => a -> a
pentagonalGen n = (n * (3*n-1)) / 2

-- | From an earlier, slower attempt -- checks if a number is pentagonal
-- isPentagonal n = isInt $ ((sqrt $ 24*n + 1) + 1)/6
