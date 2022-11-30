module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int
  deriving (Eq)

toNormal :: Clock -> Clock
toNormal (Clock h m) =
  let (mh, mm) = m /% 60
   in Clock (snd ((mh + h) /% 24)) mm
  where
    a /% b =
      let (q, r) = a `divMod` b
       in if r < 0 then (q - 1, r + b) else (q, r)

fromHourMin :: Int -> Int -> Clock
fromHourMin h = toNormal . Clock h

toString :: Clock -> String
toString (Clock h m) = concat [toStr h, ":", toStr m]
  where
    toStr v = if v < 10 then '0' : show v else show v

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour m1 (Clock h2 m2) = toNormal (Clock (hour + h2) (m1 + m2))
