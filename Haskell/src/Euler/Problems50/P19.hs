-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P19
-- Problem: Find the value of d < 1000 for which 1/d contains the longest 
--          recurring cycle in its decimal fraction part.
--          
-------------------------------------------------------------------------------
module Euler.Problems50.P19 where

import Data.Time.Calendar
import Data.Time.Calendar.WeekDate

-- | Represent years and leap years
year = concat [ [1..31], [1..28], [1..31], [1..30]
              , [1..31], [1..30], [1..31], [1..31]
              , [1..30], [1..31], [1..30], [1..31]
              ]

leapYear = concat [ [1..31], [1..29], [1..31], [1..30]
                  , [1..31], [1..30], [1..31], [1..31]
                  , [1..30], [1..31], [1..30], [1..31]
                  ]

-- | This solution doesn't use the Calendar library
main = print $ sundaySum 1901 2000 startingPt

-- | Takes a starting date, an ending date, a state which represents what 
--   day January 1st of that year is, and then returns the sum of sundays
--   that fall on the first of all months within the given interval. Note
--   that our leap year determination is only partially correct, but it works
--   for the bounds 1901 to 2000, which are the ones relevant to the 
--   problem
sundaySum :: Int -> Int -> Int -> Int
sundaySum n m s | n > m = 0
sundaySum n m s = (fst sundayState) + (sundaySum (n+1) m (snd sundayState))
   where sundayState = sundays $ zip yearChoice (createCycle s)
         yearChoice  = if n`mod`4 == 0 then leapYear else year

-- | Gives our starting day 
startingPt :: Int
startingPt = snd . sundays $ zip year (cycle [0..6])

-- | gives the number of sundays in a given year list and the starting day of the
--   week of the next year
sundays :: [(Int,Int)] -> (Int,Int)
sundays xs = (length $ filter (\(n,m) -> (n==1) && (m==6)) xs, ((snd $ last xs) + 1) `mod` 7)

createCycle n = [n..6] ++ (cycle [0..6])

--------------------------------------------------------------------------------
-- | This solution uses the Data.Time.Calendar library
sol2 :: IO ()
sol2 = print . length . filter (\(a,b,c) -> (c==7)) $ dateList
   where dateList = [toWeekDate $ fromGregorian n m 1 | n <- [1901..2000], m <- [1..12]]
