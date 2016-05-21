-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P48
-- Problem: Find the last ten digits of the series 1^1+2^2+...+1000^1000
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P48  where

main = print $ seriesModSum 1000

seriesModSum :: (Integral a) => a -> a
seriesModSum x = (sum $ map (\n -> n^n) [1..x]) `mod` (10^10)
