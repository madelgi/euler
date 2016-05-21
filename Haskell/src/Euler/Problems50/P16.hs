-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P16
-- Problem: Find the sum of the digits of the number 2^1000
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P16  where

import Utils.Common ( toDigits )

-- | Simple solution using a list comprehension
main = sum $ toDigits (2^1000)
