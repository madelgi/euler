-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P1
-- Problem: Consider the first four consecutive integers to have four distinct 
--          prime factors -- what is the first of these numbers?
--          
-------------------------------------------------------------------------------

module Euler.Problems50.P47  where

import Utils.Arithmetic.Primes ( primeFacs )

--------------------------------------------------------------------------------
-- | Initial solution
--
--   Uses a prety straightforward guard, not very efficient (takes a couple of
--   mins)
main = checkFacs [646..]

checkFacs [] = 0
checkFacs (x:y:z:w:zs)
   | allFour      = x 
   | otherwise    = checkFacs (y:z:w:zs)
     where allFour = all (==4) $ map primez [x, y, z, w]

primez n = length $ primeFacs n

prob47 = snd $ head $ dropWhile (\(x,_) -> x<4) $ scanl scanFac (0,0) [1..]
  where scanFac (a, _) n = if primez n == 4 then (a+1, n-3) else (0, n-3) 
