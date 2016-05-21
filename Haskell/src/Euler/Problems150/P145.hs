--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems150.P145
-- Problem: A reversible number has the property that n + rev(n) = x such that
--          all digits of x are odd. How many reversible numbers are there below
--          one billion?
--
--------------------------------------------------------------------------------
module Euler.Problems150.P145 where

import          Utils.Common  ( toDigits )

main = length $ filter isReversible [10..10^9]

isReversible :: Int -> Bool
isReversible n
  | n `mod` 10 == 0    = False
  | otherwise          = checkProp
    where checkProp = and $ map odd (toDigits $ n + (reverseDig n))

-- | reverses a given digit n
reverseDig :: Int -> Int
reverseDig = read . reverse . show
