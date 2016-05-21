-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P49
-- Problem: Find the sum of all the multiples of 3 or 5 below 1000.
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P49  where

import Utils.Arithmetic.Primes ( isPrime, primes )
import Utils.Comb              ( isPerm )

main = print $ findTrip pairCandidates candidates

candidates = dropWhile (<1488) (takeWhile (<10000) primes)
pairCandidates = [ (x,y) | x <- candidates, y <- candidates, y > x, isPerm x y]

findTrip :: [(Integer, Integer)] -> [Integer] -> String
findTrip (x:xs) ys 
   | (diff `elem` ys) && (isPrime diff) && (isPerm (fst x) diff) = displayString
   | otherwise                                                   = findTrip xs ys
     where diff = (snd x) + ((snd x)-(fst x))
           displayString = concat $ map show [fst x, snd x, diff]
