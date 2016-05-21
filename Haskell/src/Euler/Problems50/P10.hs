-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P10
-- Problem: Find the sum of all the primes below two million
--
-------------------------------------------------------------------------------
module Euler.Problems50.P10 where

import Utils.Arithmetic.Primes ( primes )

-- | Sums over a prime sieve defined in Utils.Primes. Takes about 10-15 seconds
--   to complete.
main :: Integer
main  = sum $ takeWhile (<2000000) primes
