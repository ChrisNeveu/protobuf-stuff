{-# LANGUAGE DeriveGeneric, DataKinds #-}

module Protos
  ( Image(..)
  ) where

import Import
import Data.Int
import Data.ProtocolBuffers

import GHC.Generics (Generic)

data Image = Image
  { uid         :: Required 1 (Value Text)
  , width       :: Optional 2 (Value Int32) 
  , height      :: Optional 3 (Value Int32)
  , format      :: Optional 4 (Value Text)
  , recommended :: Optional 5 (Value Bool)
  } deriving (Generic, Show)

instance Encode Image
instance Decode Image
