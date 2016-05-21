-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Utils.Primes
-- Summary: Contains a bunch of functions for processing prime numbers.
--
-------------------------------------------------------------------------------
module Utils.Arithmetic.Primes 
   ( isPrime
   , primes
   , primeFacs
   , totient
   , coprimes
   ) where

import Data.List ( group )

--------------------------------------------------------------------------------
-- | isPrime :: Int -> Bool
--
--   Checks whether a given number is prime or not
isPrime :: Integer -> Bool
isPrime n
   | n <= 3                       = n >= 2
   | (n`mod`2==0) || (n`mod`3==0) = False
   | otherwise                    = not (or boolList)
     where boolList = [(n`mod`i==0) || (n`mod`(i+2)==0) | 
                         i <- [5,11..ceiling(fromIntegral(n)*0.5)]]

--------------------------------------------------------------------------------
-- | primes :: [Integer] 
--
--   An implementation of the Sieve of Eratosthenes. Return a list of primes,
--   must be used in conjunction with take or takeWhile, or something like that
primes :: [Integer]
primes  = [2,3,5] ++ (diff [7,9..] nonprimes)

nonprimes :: [Integer]
nonprimes  = foldr1 f $ map g $ tail primes
   where f (x:xt) ys = x : (merge xt ys)
         g p         = [ n*p | n <- [p,p+2..] ]


-- | Removes all of the elements of the second list passed to it from the first,
--   e.g.
--
--   > take 10 (diff [1..] [2,4..])
--   [1,3,5,7,9,11,13,15,17,19]
diff :: (Ord a) => [a] -> [a] -> [a]
diff xs@(x:xt) ys@(y:yt) =
   case compare x y of
      LT -> x : (diff xt ys)
      EQ -> diff xt yt
      GT -> diff xs yt

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs@(x:xt) ys@(y:yt) = 
   case compare x y of
      LT -> x : (merge xt ys)
      EQ -> x : (merge xt yt)
      GT -> y : (merge xs yt)

--------------------------------------------------------------------------------
-- | primeFacs :: Integer -> [(Integer,Int)]
--
--   Returns the prime factorization of a number, e.g.:
--
--   > primeFacs 600
--   [(2,3),(3,1),(5,2)]
primeFacs :: Integer -> [(Integer,Int)]
primeFacs n = map (\n -> (head n, length n)) $ group $ primeFactors n primes

primeFactors :: Integer -> [Integer] -> [Integer]
primeFactors n (p:ps)
   | n `div` 2 < p                      = [n]
   | rem n p /= 0                       = primeFactors n ps
   | (rem n p == 0) && (rem n p^2 == 0) = p : (primeFactors (n `div` p) (p:ps))
   | otherwise                          = p : (primeFactors (n `div` p) ps)

--------------------------------------------------------------------------------
-- |
-- totient :: Integer -> Int
-- totient :: Integer -> Int
totient n = (n `div` (product uniques)) * (product $ map (\p -> p - 1) uniques)
   where uniques = map (\x -> fst x) $ primeFacs n

coprimes n = filter (\a -> gcd a n == 1) [1..n]
