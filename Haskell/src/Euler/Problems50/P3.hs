-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P3
-- Problem: What is the largest prime factor of the number 600851475143?
--          
-------------------------------------------------------------------------------

module Euler.Problems50.P3 where

import Utils.Arithmetic.Primes ( primeFacs )

-- | Basically totally reliant on our prime factorization algo
main = fst $ head . reverse $ primeFacs num

num = 600851475143
