--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems100.P53
-- Problem: How many (not necessarily distinct) values of n `choose` k, for
--          1 <= n <= 100, are greater than one-million.
--
-- Notes:   We use the fact that n `choose` k == n `choose (n-k)
--------------------------------------------------------------------------------
module Euler.Problems100.P53 where

import Data.List  ( find )
import Utils.Comb ( choose )


main = sum $ map (\n -> chooseOverMil n) [23..100]

-- | Given a specific n, how many values of n `choose` k are over 1
--   million?
chooseOverMil :: Integer -> Int
chooseOverMil n
   | odd n     = 2 * (length $ filter (>1000000) choices)
   | otherwise = 2 * (length $ filter (>1000000) choices) - 1
     where choices = map (\k -> choose n k) [0..lim]
           lim     = n `div` 2
