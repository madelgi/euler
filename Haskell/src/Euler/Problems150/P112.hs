--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems150.P145
-- Problem: A reversible number has the property that n + rev(n) = x such that
--          all digits of x are odd. How many reversible numbers are there below
--          one billion?
--
--------------------------------------------------------------------------------
module Euler.Problems150.P112 where

import          Utils.Common  ( toDigits )

isBouncy :: String -> Bool -> Bool -> Bool
isBouncy n         True True = True
isBouncy (n:m:ms)  a    b
   | n < m                   = isBouncy (m:ms) True b
   | n > m                   = isBouncy (m:ms) a True
   | otherwise               = isBouncy (m:ms) a b
isBouncy _ _ _ = False
