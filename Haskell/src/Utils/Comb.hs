--------------------------------------------------------------------------------
-- |
-- Module:      Utils.Comb
-- Description: A collection of combinatorial functions.
--
--------------------------------------------------------------------------------
module Utils.Comb 
   ( isPerm
   , choose
   ) where

import Data.List 

-- | Function that determines whether the digits of two integers are permutations
--   of each other, e.g.
--
--   > isPerm 72392 39227
--   True
isPerm :: Integral a => a -> a -> Bool
isPerm x y = sameElts (digs x) (digs y)
 
digs :: Integral x => x -> [x]
digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

sameElts :: (Eq a) => [a] -> [a] -> Bool
sameElts x y = null (x \\ y)

-- | Computes n choose k, e.g.
--   
--   > choose 8 3
--   56 
choose n 0 = 1
choose 0 k = 0
choose n k = choose (n-1) (k-1) * n `div` k 
