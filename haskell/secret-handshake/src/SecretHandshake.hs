module SecretHandshake (handshake) where

import Data.Bits

handshake :: Int -> [String]
handshake n =
  ( appIf 0x10 reverse
      . appIf 0x01 ("wink" :)
      . appIf 0x02 ("double blink" :)
      . appIf 0x04 ("close your eyes" :)
      . appIf 0x08 ("jump" :)
  )
    []
  where
    appIf b f xs = if n .&. b /= 0 then f xs else xs
