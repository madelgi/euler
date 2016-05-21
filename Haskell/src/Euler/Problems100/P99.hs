--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems100.P99
-- Problem  Using Data/base_exp.txt, a 22K text file containing one thousand
--          lines of <base>, <exponent> pairs, determine which line number
--          has the greatest numerical value.
--
--
--------------------------------------------------------------------------------
module Euler.Problems100.P99 where

import Data.List.Split ( splitOn )
import Data.List       ( maximumBy )
import Data.Ord        ( comparing )

--------------------------------------------------------------------------------
-- | Solution 1
--
--   This one is simple once you realize that, rather than computing a^b, you
--   can compute b * log(a). Outside of processing the given file, there's not
--   much more to it.
main :: IO ()
main = do
   f <- readFile "Data/base_exp.txt"
   let processed = processPairs f
   print $ maximumBy (comparing snd) $ zip [1..] $ map logSize processed

-- | Given a pair (x,y) representing x^y, compute y*log(x)
logSize (x,y) = y * (log x)

-- | Process the file
processPairs :: (Floating x, Read x) => String -> [(x,x)]
processPairs s = map list2pair $ map (map read) $ map (splitOn ",") $ lines s
   where list2pair [x,y] = (x,y)
