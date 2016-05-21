-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P1
-- Problem: Find the 1000000 lexicographical permutation of the digits [0..9]
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P24 where

import Data.List ( delete )

main = print $ (perms "0123456789") !! 999999

-- | Generates lexicographical permutations
perms [] = [[]]
perms xs = concatMap (\x -> map (x:) (perms $ delete x xs)) xs
