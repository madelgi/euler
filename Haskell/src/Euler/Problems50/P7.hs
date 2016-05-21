-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P7
-- Problem: Find the 100001st prime number
-- 
-------------------------------------------------------------------------------
module Euler.Problems50.P7 where

import Utils.Arithmetic.Primes ( primes )

-- | Entirely dependent on our primes function (we use 10000 cuz the list index
--   starts at 0)
main = primes !! 10000
