-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P1
-- Problem: Find the sum of the digits in the number 100!
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P20  where

import Utils.Common ( toDigits )

-- | Simple solution using a list comprehension
main = sum . toDigits $ product [2..100]
