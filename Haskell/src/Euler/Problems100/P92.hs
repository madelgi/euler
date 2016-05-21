--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems100.P92
-- Problem: A number chain is created by continuously addin the square of the
--          digits in a number to form a new number until it has been seen
--          before. How many starting numbers below ten million will arrive at
--          89?
--
--------------------------------------------------------------------------------
module Euler.Problems100.P92 where

import Utils.Common ( toDigits )
import Data.List ( (\\) )
import Data.Char ( digitToInt )
import Data.Array ( array, (!) )

--------------------------------------------------------------------------------
-- | takes about ~15 mins. terribly inefficient
--
--   IDEA: somehow sift out elements of the chain as you test numbers? e.g., for 
--   4, we have
--
--   > 4 -> 16 -> 37 -> 58 -> 89
--
--   Currently, this makes condition register `1`, but we still end up testing the 
--   number 16, 37, and 58 in the future, even though we know that starting at one
--   of them will lead to 89. It'd be nice to not do this. There's also the fact 
--   that given a digit that satisfies the condition, any digit that is a 
--   permutation of that digit will also satisfy the condition.
main = sum $ map condition [1..10000000]

condition :: Int -> Int
condition n
   | n == 1       = 0
   | n == 89      = 1
   | otherwise    = condition $ digitSquareSum n

digitSquareSum :: Int -> Int
digitSquareSum n = sum $ map (^2) ( toDigits n )

--------------------------------------------------------------------------------
-- | Alternate solution 1
--
-- Uses an array, cuts time down significantly. takes about 45 seconds.
p92 = length $ filter chain [1..9999999]

chainResults = array (1,9999999) [(i,chain i) | i <- [1..9999999]]

chain 1  = False
chain 89 = True
chain n  = chainResults ! (foldr (\x r -> r + (digitToInt x)^2) 0 $ show n)

