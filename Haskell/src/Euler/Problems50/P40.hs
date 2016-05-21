-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P1
-- Problem: An irrational decimal fraction is created by concatenating the 
--          positive integers:
--
--             0.1234567891011121314151617 ...
--
--          If d_n represents the nth digit of the fractional part, find the 
--          value of the following expression:
--
--             d_1 * d_10 * d_100 * d_1000 * d_10000 * d_100000 * d_1000000
--          
-------------------------------------------------------------------------------

module Euler.Problems50.P40  where

import Utils.Common ( toDigits )

main :: Int
main =   (digs !! 9) * (digs !! 99) * (digs !! 999) 
       * (digs !! 9999) * (digs !! 99999) * (digs !! 999999)

-- | Champernowne's constant in list form (i.e. each digit is a list element)
digs = takeWhile (<=1000000) (concatMap toDigits [1..])
