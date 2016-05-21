
module Euler.Problems50.P28 where

-- | Simple one-liner. The lambda in the middle sums the corners of an nxn
--   square
main = 1 + (sum $ map (\n -> 4*n^2-6*(n-1)) [3,5..1001])
