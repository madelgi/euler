--------------------------------------------------------------------------------
-- |
-- Module:   Euler.Problems100.P69
-- Problem:  Find the number n <= 1,000,000 such that n/totient(n) is maximized
-- Analysis: We want to maximize the following function:
--
--             n/phi(n) = n / n*(prod_{p|n} (1 - 1/p)
--                      = 1 / prod_{p|n} ((p-1)/p)
--
--           In other words, we want the n <= 1,000,000 such that p|n is true
--           for the maximum number of p\in primes. But this is simple: given
--           a list of primes in ascending order [2,3,5,7,11..], take the product
--           of this list until it exceeds 1,000,000, and return that value. This
--           will yield the number under 1,000,000 that is divisible by the 
--           maximum number of primes
--
--------------------------------------------------------------------------------
module Euler.Problems100.P69 where

import Utils.Arithmetic.Primes ( primes )

-- | All of the work is in the analysis
main = last . takeWhile (<1000000) $ scanl1 (*) primes
