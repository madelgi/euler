--------------------------------------------------------------------------------
-- | 
-- Module:      Utils.Common
-- Description: A number of common utility functions that don't necessarily
--              fit under the umbrella of the more specific Util modules
--
--------------------------------------------------------------------------------
module Utils.Common 
   ( divisors
   , toDigits
   , reverseInt
   , fromDigits
   , isInt
   ) where

import          Data.Char  ( digitToInt )

-- | Reverse a number
--
--   > reverseInt 908151
--   151809
reverseInt :: Integer -> Integer
reverseInt n = read . reverse $ show n

-- | Convert a number to a list of digits, e.g.
--
--   > toDigits 49082
--   [4,9,0,8,2]
toDigits :: (Integral x) => x -> [x]
toDigits 0 = []
toDigits n = toDigits (n `div` 10) ++ [n `mod` 10]

-- | Conver a list of ints to a digit, e.g.
--
--   > fromDigits [4,2,1,6]
--   4216
fromDigits = foldl addDigit 0
   where addDigit num d = 10*num + d

-- | Get a list of proper divisors for a given n
divisors :: Int -> [Int]
divisors n
   | bound^2 == n = init $ divisorList n
   | otherwise    = divisorList n
     where divisorList n = 1 : concat [ [x,y] | x <- [2..bound], n`mod`x == 0, let y = n`div`x]
           bound = ceiling . sqrt $ fromIntegral n

-- divisorsHelp n k | (k > ) = []
-- divisorsHelp n k
--    | n`mod`k == 0    = k : (n`div`k) : divisorsHelp n (k+1)
--    | otherwise       = divisorsHelp n (k+1)

-- | Check if a number is an integer
isInt x = (x == (fromInteger $ round x))
