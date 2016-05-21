-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P12
-- Problem: What is the first triangle number to have over five hundred 
--          divisors?
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P12  where

import Utils.Arithmetic.Primes ( primeFacs )
import Utils.Comb ( choose )
import Data.List ( find )

main = find (\n -> (countDivs n) > 500) triList

countDivs :: Integer -> Int
countDivs n = sum $ map (\k -> choose (facs n) k) [0..(facs n)]
   where facs n = length $ primeFacs n

triList = map (triangle) [1..]
   where triangle n = floor $ n*(n+1)/2
