-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P1
-- Problem: Find the triangle number after T_285 = 40755 that is both 
--          pentagonal and hexagonal.
--
-- Notes:   The current solution does not do this, but this can be made faster
--          by the observation that all hexagonal numbers are triangle numbers
--
-------------------------------------------------------------------------------
module Euler.Problems50.P45 where

import Data.List  ( find )
import Data.Maybe ( fromJust )

-- | We take a list [286..], and break when we find the first integer x which
--   also makes (sol2 x) produce an integer. There is one more condition that
--   x must satisfy, and that's that it must be odd. This is to strip out 
--   incorrect indexes for Hexagonal numbers. Briefly, any value of x that
--   is even will result in a corresponding Hexagonal number index that is
--   non integral, which makes no sense. Odd values of x will produce integral
--   indices.
main = (n, n*(n+1)/2)
   where n = fromJust $ find ( \x -> (isInt $ sol2 x) && (odd $ round x) ) [286..]

-- | Some mathematical analysis to determine the next integer solution to the
--   problem. I started with the equation x(x+1)/2 = y(3y-1)/2 = z(2z-1). Some
--   analysis gives us that, given some x, the y that satisfies the above identity
--   is either y = sol1 x or y = sol2 x. Sol1 is commented out because it will
--   always be negative, and a negative index is nonsensical
root x = sqrt $ 12*x^2 + 12*x+1
-- sol1 x = 1/6*( 1 - (root x) )
sol2 x = 1/6*( (root x) + 1)

-- | Checks if a number is an integer
isInt x = x == fromInteger (round x)
