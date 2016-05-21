--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems100.P55
-- Problem: How many Lychrel numbers are there below 10,000?
--
--------------------------------------------------------------------------------
module Euler.Problems100.P55 where

import Utils.Common ( reverseInt )

main = sum $ map (\n -> isLychrel n 0) [1..10000]

-- | Check whether a number is Lychrel by seeing whether the sum reverse process
--   produces a palindrome within 50 iterations
isLychrel :: Integer -> Int -> Int
isLychrel x n
   | n>50                  = 1
   | isPal lychrelNum      = 0
   | otherwise             = isLychrel lychrelNum (n+1)
     where lychrelNum = lychrelStep x

-- | Check if a number is a palindrome
isPal :: Integer -> Bool
isPal n = n == (reverseInt n) 

-- | Sum a number with its reverse
lychrelStep :: Integer -> Integer
lychrelStep n = n + (reverseInt n)
