--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems100.P52
-- Problem: Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, 
--          and 6x, contain the same digits.
--
--------------------------------------------------------------------------------
module Euler.Problems100.P52 where

import Data.List  ( find )
import Utils.Comb ( isPerm )

main = find (\n -> condition n) [10000..]

condition :: Int -> Bool
condition n = (isPerm n $ 2*n) && (isPerm n $ 3*n) && (isPerm n $ 4*n)
                               && (isPerm n $ 5*n) && (isPerm n $ 6*n)
