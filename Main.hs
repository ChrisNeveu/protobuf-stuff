{-# LANGUAGE OverloadedStrings #-}

import Import
import Data.Image
import ProtoFormat

main :: IO ()
main = do
    let bs = toByteString testImage
    putStrLn $ "\nEncoded: " ++ (show bs)
    let img :: Either String Image
        img = fromByteString bs
    putStrLn $ "\nImage: " ++ (show img)

testImage :: Image
testImage = Image
  { uid = "jji443ji3dspa"
  , width = 50
  , height = 50
  , format = "jpg"
  , recommended = False
  }
