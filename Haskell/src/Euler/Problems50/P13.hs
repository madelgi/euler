--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P13
-- Problem: Work out the first ten digits of the sum of the one-hundred 50-digit
--          numbers contained within Data/numlist.txt
--
--------------------------------------------------------------------------------
module Euler.Problems50.P13 where

import System.IO        ( IOMode(..), hGetContents, openFile
                        , hClose )
import Control.Monad

main :: IO ()
main = do
   handle   <- openFile "Data/numlist.txt" ReadMode
   contents <- hGetContents handle
   let gridList = processNums contents
       sol      = sum gridList
   print sol
   hClose handle

processNums :: String -> [Integer]
processNums tri = let strs = lines tri
                  in  map read strs
