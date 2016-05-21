-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P1
-- Problem: Find the sum of all the multiples of 3 or 5 below 1000.
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P50 where

import Utils.Arithmetic.Primes ( primes, isPrime )
import Data.List               ( find )

main = find ( isPrime ) $ scanl (-) bigSum primes

bigSum = last . takeWhile (<1000000) $ scanl (+) 0 primes
