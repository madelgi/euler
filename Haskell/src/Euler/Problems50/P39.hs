-------------------------------------------------------------------------------
-- |
-- Module:  Euler.Problems50.P39
-- Problem: If p is the perimeter of a right angle triangle with integral 
--          length sides, {a,b,c}, there are exactly three solutions for p=120:
--
--             {20,48,52}, {24,45,51}, {30,40,50}
--
--          For which value of p <= 1000, is the number of solutions maximised?
-- 
-- Notes:   Only kind of works
-------------------------------------------------------------------------------
module Euler.Problems50.P39 where

import Data.List ( sortBy, maximumBy )
import Data.Function ( on )

-- | Simple solution using a list comprehension
main = maximumBy (compare `on` fst) $ zip (map (\n -> checkTrips n sortedTrips) [1..1000]) [1..1000]

checkTrips :: Int -> [(Int,Int,Int)] -> Int
checkTrips y []   = 0 
checkTrips y (x:xs)
   | y == (sumTrip x)   = 1 + (checkTrips y xs)
   | otherwise          = checkTrips y xs

-- | 
-- primitiveTrips = filter isPrimitive trips

sortedTrips = sortBy (compare `on` (sumTrip)) trips

-- | A full list of pythagorean triples
trips :: [(Int,Int,Int)]
trips = [ (a,b,c) | m <- [1..100], n <- [1..(m-1)], k <- [1..100], let a = k*(m^2 - n^2), 
                     let b = k*2*m*n, let c = k*(m^2 + n^2), a+b+c <= 1000 ]

-- | Sum the elements of an int triple
sumTrip :: (Int,Int,Int) -> Int
sumTrip (x,y,z) = x+y+z


list = [p | a <- [1..1000], b <- [a..1000], let c2 = a*a + b*b,
            let c = truncate $ (sqrt ::Double->Double) $ fromIntegral c2,
            let p = a + b + c, c2 == c*c, p <= 1000]
