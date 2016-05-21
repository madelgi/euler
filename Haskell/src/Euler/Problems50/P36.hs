-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P36
-- Problem: Find the sum of all numbers, less than one million, that are
--          palindromic in base 10 and base 2
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P36  where

import Numeric
import Data.Char

main = print . sum $ filter (\n -> (isPal n) && (isBinaryPal n)) [1..1000000]

-- | Check if a decimal number is a palindrome
isPal :: Int -> Bool
isPal n = show n == (reverse $ show n)

-- | Checks if the binary representation of a decimal number is a palindrome
isBinaryPal :: Int -> Bool
isBinaryPal n = bin == (reverse bin)
   where bin = showIntAtBase 2 intToDigit n ""
