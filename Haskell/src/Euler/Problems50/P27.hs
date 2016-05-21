-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P27
-- Problem: Considering quadratics of the form:
--
--             n^2 + a*n + b, where |a| < 1000 and |b| < 1000
-- 
--          Find the product of the coefficients, a and b, for the quadratic
--          expression that produces the maximum number of primes for 
--          consecutive values of n, starting with n = 0.
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P27  where

import Utils.Arithmetic.Primes ( isPrime, primes )
import Data.List               ( maximumBy )
import Data.Ord                ( comparing )

-- | Simple solution using a list comprehension

-- n^2 + a*n + b
main = maximumBy (comparing snd) $ map (\x -> (x,numPrimes x 0)) [ (a,b) | b <- coeffs, a <- [-b..b] ]
   where coeffs = takeWhile (<1000) primes

numPrimes :: (Integer,Integer) -> Int -> Int
numPrimes (a,b) n
   | isPrime $ n^2 + a1*n + b1  = 1 + numPrimes (a,b) (n+1)
   | otherwise                  = 0
     where a1 = (fromInteger a) :: Int
           b1 = (fromInteger b) :: Int
