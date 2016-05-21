--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P30
-- Problem: Find the sum of all the numbers that can be written as the sum of
--          fifth powers of their digits
--
--------------------------------------------------------------------------------
module Euler.Problems50.P30 where

import Data.Char     (digitToInt)
import Utils.Common  ( toDigits )

-- | Brute force solution: checks whether each digit in the list [10,11,..,999999]
--   satisfies the given condition. Takes about 8 seconds. I'm pretty sure you could
--   do some sort of analysis to reduce the limit value without explicitly
--   calculating anything, but I'm lazy.
main = sum $ filter (\n -> n == (sum $ map (\n->n^5) (toDigits n))) [10..999999]
