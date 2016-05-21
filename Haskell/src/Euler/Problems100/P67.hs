--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems100.P67
-- Problem: Find the max path sum of the triangle in Data/triangle.txt
--
--------------------------------------------------------------------------------
module Euler.Problems100.P67 where

import System.IO
import Control.Monad

-- | Processes the text file into a num array, and then folds collapseRows
--   through the processed file to produce a result.
main :: IO ()
main = do
   contents <- readFile "Data/triangle.txt"
   print . head . foldr1 collapseRows $ processTri contents

-- | Easiest to explain via example. Consider the practice triangle
--
--   >      3
--   >     1 5
--   >    7 8 2
--
--   with array representation [[3],[1,5],[7,8,2]]. Let's walk through the evaluation
--   of `collapseRows [1,5] [7,8,2]`
--
--   Ignoring the fact that we can easily find the max path by hand, we use a
--   bottom up approach to calculate the max path. Starting at the bottom row,
--   the `zipWith max [7,8,2] (tail [7,8,2])` part of the function will evaluate
--   to [8,8] -- this array corresponds to the highest choices we can add 1 and
--   5 to -- i.e., ignoring what comes previously in our path sum, if we are at
--   the 1 node, we should go to 8. Likewise for the 5 node. Next, we have
--
--   > zipWith (+) [1,5] ([8,8])
--   [9,13]
--
--   This computes the sums to [1,5] to their respective maximum possibilities
--   (in this case both 8). Our triangle with bottom two rows collapsed now
--   looks like this:
--
--   >   3
--   >  9 13
--
--   In order to compute the maxPath of our starting triangle, we run `collapseRows [3] [9,13]`
--   to get an output of [16]. We are basically keeping track of all the possible max sums as
--   we go up the triangle, but we don't deal with the trivial possibilites we would
--   encounter were we to just try every path from the top to the bottom of the
--   triangle. We can see how the process of applying collapseRows iteratively to
--   an n row triangle will produce a similarly correct result.
collapseRows x y = zipWith (+) x (zipWith max y (tail y))

-- | Simple helper function, takes the raw text file and converts it to a list
--   of integer lists.
processTri :: String -> [[Int]]
processTri tri = let strs = map (words) (lines tri)
                 in  map (map read) strs

-- | Old solution -- does the same work as collapse rows in 10x the amount of
--   code
-- maxPath :: [[Int]] -> Int
-- maxPath [[]]     = 0
-- maxPath [[x]]    = x
-- maxPath (x:y:zs) = maxPath $ (collapsePath x y) : zs
--
-- | Takes two lists as input
-- collapsePath :: [Int] -> [Int] -> [Int]
-- collapsePath _ []  = []
-- collapsePath (a:b:cs) (y:ys)
--    | a+y > b+y    = (a+y) : collapsePath (b:cs) ys
--    | otherwise    = (b+y) : collapsePath (b:cs) ys
