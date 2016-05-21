-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P17
-- Problem: How many letters would it take to write out all numbers from 1-1000
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P17  where

-------------------------------------------------------------------------------
-- | Initial Attempt
--
--   This problem is more tedious than difficult. We basically build the list
--   of written numbers up from component numbers, then calculate the final 
--   length.
main = length . concat $ firstHundred ++ rest ++ ["onethousand"]

firstTen = ["one","two","three","four","five","six","seven","eight","nine"]
teens    = ["ten","eleven","twelve","thirteen","fourteen","fifteen",
            "sixteen","seventeen","eighteen","nineteen"]
tens     = ["twenty","thirty","forty","fifty","sixty","seventy","eighty",
            "ninety"]

hundreds = map (\x -> (++) x "hundred") firstTen

firstHundred = firstTen ++ teens ++ others
   where others = concatMap (\x -> x:combineNums x firstTen) tens

rest = concatMap (\s -> s:(combineNumsAnd s)) hundreds

combineNums :: String -> [String] -> [String]
combineNums x xs = map (\n -> (++) x n) xs

combineNumsAnd :: String -> [String]
combineNumsAnd s = map (\x -> s ++ "and" ++ x) firstHundred
