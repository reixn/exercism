module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where

expectedMinutesInOven :: Int
expectedMinutesInOven = 40

preparationTimeInMinutes :: Int -> Int
preparationTimeInMinutes layer = 2 * layer

elapsedTimeInMinutes :: Int -> Int -> Int
elapsedTimeInMinutes layer ovenTime = preparationTimeInMinutes layer + ovenTime