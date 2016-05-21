-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P1
-- Problem: Evaluate the sum of all the amicable numbers under 10000
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P21  where

import Utils.Common  ( divisors )

main = print $ amicableSum 9999

-- | Simple solution using a list comprehension
amicableSum n = sum [ x | x <- [1..n], let y = sum (divisors x), 
                          x /= y, x == sum (divisors y) ]
