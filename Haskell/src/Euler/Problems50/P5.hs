-------------------------------------------------------------------------------
-- |
-- Module:  P5
-- Problem: What is the smallest number that is evenly divisible by all of the 
--          numbers from 1-20?
-- 
-------------------------------------------------------------------------------
module Euler.Problems50.P5  where

-- | This can actually be done with pencil and paper. All of 1-20 are going to
--   be divisible by primes less than or equal to 20, so we need only think of all
--   the primes less than 20. For each prime p, we must also determine the 
--   largest k such that p^k < 20. For 2, k=4, and for 3, k=2. For each other
--   p, k=1. We multiply appropriately.
main :: Int
main = 16*9*5*7*11*13*17*19
