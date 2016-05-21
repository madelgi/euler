--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems100.P58
-- Problem: Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, 
--          and 6x, contain the same digits.
--
--------------------------------------------------------------------------------
module Euler.Problems100.P58 where

import Utils.Arithmetic.Primes ( isPrime )

main = primeDiagRatio (3,4)

primeDiagRatio (n,k)
   | atTen           = sqSize
   | otherwise       = primeDiagRatio (n + (primeDiags $ sqSize+2), k+4)
     where atTen  = (fromInteger n) / (fromInteger k) < 1/10
           sqSize = (k`div`4)*2+1

primeDiags :: Integer -> Integer
primeDiags n = sum $ map isPrimeInt [n^2-(n-1),n^2-2*(n-1),n^2-3*(n-1)]
   where isPrimeInt x = if isPrime x then 1 else 0
