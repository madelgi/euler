--------------------------------------------------------------------------------
-- | 
-- File: Main.hs
-- Description: This is purely used for timing solutions
--
--------------------------------------------------------------------------------
import           Text.Printf
import           Control.Exception
import           System.CPUTime
import qualified Euler.Problems50.P45 as P45


time :: IO t -> IO t
time a = do
   start <- getCPUTime
   v <- a
   end   <- getCPUTime
   let diff = (fromIntegral (end - start)) / (10^12)
   printf "Computation time: %0.20f sec\n" (diff :: Double)
   return v

main = do
   time $ P45.main `seq` return ()
