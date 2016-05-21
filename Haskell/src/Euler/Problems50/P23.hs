-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P23
-- Problem: A number n is called deficiient if the sum of its proper divisors
--          is less than n and it is called abundant if this sum exceeds n. 
--          By mathematical analysis, it can be shown that all integers greater
--          than 28123 can be written as the sum of two abundant numbers.
--
-------------------------------------------------------------------------------
module Euler.Problems50.P23 where

import Utils.Common ( divisors )

isAbundant :: Int -> Bool
isAbundant n = sum (divisors n) > n

isAbundantSum n ys@(x:xs)
   | x > n           = False
   | (n-x) `elem` ys = True
isAbundantSum _ _ = False

split n = helpList n 1
   where helpList n k
            | k >= n`div`2 = [(k,n-k)]
            | otherwise   = (k,n-k) : helpList n (k+1)

abundantList :: [Int]
abundantList =  [ x | x <- [1..28123], isAbundant x]
