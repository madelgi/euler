--------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems100.P79
-- Problem: (See website)
--
--------------------------------------------------------------------------------
module Euler.Problems100.P79 where

import System.IO        ( IOMode(..), hGetContents, hClose
                        , openFile )
import Control.Monad
import Data.List        ( nub )

main :: IO ()
main = do
   handle   <- openFile "Data/keylog.txt" ReadMode
   contents <- hGetContents handle
   let passList = processPass contents
   print passList
   hClose handle

processPass :: String -> [Int]
processPass passes = let strs = lines passes
                     in  nub $ map read strs
