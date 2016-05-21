-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P15
-- Problem: How many paths are there through a 20 x 20 lattice?
--          
-------------------------------------------------------------------------------

module Euler.Problems50.P15  where

import Utils.Comb ( choose )

-- | The number of lattice paths through an n x n lattice is equal to the nth
--   binomial coefficient
main = centralBinomial 20

-- | Calculate the nth central binomial coefficient
centralBinomial :: Int -> Int
centralBinomial n = choose (2*n) n
