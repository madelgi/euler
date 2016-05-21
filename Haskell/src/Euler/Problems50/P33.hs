-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P33
-- Problem: Find the sum of all the multiples of 3 or 5 below 1000.
--
-------------------------------------------------------------------------------
module Euler.Problems50.P33 where

import Data.List    ( intersect )
import Utils.Common ( toDigits, fromDigits )
import Data.Ratio
import Control.Monad


main = filter (\p -> equals (reduce p) (badReduce p)) list

list = [ (a,b) | b <- [1..99], a <- [1..b],
            not (a `mod` 10 == 0 && b `mod` 10 == 0), not (a == b) ]

equals :: Maybe (Int, Int) -> Maybe (Int, Int) -> Bool
equals p1 p2
    | p1 == Nothing = False
    | p2 == Nothing = False
    | otherwise = (fst p1)*(snd p2) == (snd p1)*(fst p2)

reduce :: (Int, Int) -> Maybe (Int, Int)
reduce (x,y) = Just (div x c, div y c)
    where c = gcd x y

badReduce :: (Int, Int) -> Maybe (Int, Int)
badReduce (x, y) = if (xStrip == "" || yStrip == "")
                       then Nothing
                       else Just (read xStrip :: Int, read yStrip :: Int)
    where xStrip = stripChars common (show x)
          yStrip = stripChars common (show y)
          common = intersect (show x) (show y)

stripChars :: String -> String -> String
stripChars = filter . flip notElem
