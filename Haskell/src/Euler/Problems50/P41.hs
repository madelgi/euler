-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P41
-- Problem: What is the largest n-digit pandigital prime that exists?
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P41 where

import Data.List               ( permutations )
import Utils.Common            ( fromDigits )
import Utils.Arithmetic.Primes ( isPrime )

main = max . filter ( isPrime ) $ map fromDigits (permutations [1..9])
