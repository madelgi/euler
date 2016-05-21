-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P4
-- Problem: A palindromic number reads the same both ways (e.g. 9009). Find the
--          largest palindrome made from the product of two 3-digit numbers.
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P4 where

-- | Simple list comprehension solution
main :: Int
main = maximum [ x | y <- [100..999], z <- [y..999], 
                      let x = y*z, (reverse $ show x) == show x ]
