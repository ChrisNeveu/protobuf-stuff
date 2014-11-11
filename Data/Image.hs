{-# LANGUAGE TypeFamilies #-}
module Data.Image
    ( Image(..)
    ) where

import Import
import ProtoFormat
import Data.ProtocolBuffers
import Data.Maybe
import qualified Protos as Proto

data Image = Image
  { uid :: Text
  , width :: Int
  , height :: Int
  , format :: Text
  , recommended :: Bool
  } deriving (Show)

instance ProtoFormat Image where
    type P Image = Proto.Image
    toProto i = Proto.Image
        { Proto.uid = putField $ uid i
        , Proto.width = putField $ Just $ fromIntegral $ width i
        , Proto.height = putField $ Just $ fromIntegral $ height i
        , Proto.format = putField $ Just $ format i
        , Proto.recommended = putField $ Just $ recommended i
        }
    fromProto p = Image
        { uid = getField $ Proto.uid p
        , width = fromIntegral $ fromJust $ getField $ Proto.width p
        , height = fromIntegral $ fromJust $ getField $ Proto.height p
        , format = fromJust $ getField $ Proto.format p
        , recommended = fromJust $ getField $  Proto.recommended p
        }
