module Euler.Problems50.P14 where

-- | Takes too long
main = print $ foldl1 max $ map (\x -> collatz x) [10..1000000]


-- | 4, 2, 1
--
--   > collatz 4 = 1 + (collatz 2)
--               = 1 + (1 + collatz 1)
--               = 1 + 1 + 1
collatz :: Int -> Int
collatz 1 = 1
collatz n
   | n `mod` 2 == 0  = 1 + (collatz $ n `div` 2)
   | otherwise       = 1 + (collatz $ 3*n + 1)
