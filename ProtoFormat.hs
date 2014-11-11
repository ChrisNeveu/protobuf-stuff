{-# LANGUAGE TypeFamilies, FlexibleContexts #-}

module ProtoFormat
  ( ProtoFormat(..)
  ) where

import Import
import Data.ByteString
import Data.ProtocolBuffers
import Data.Serialize.Put
import Data.Serialize.Get

class (Encode (P m), Decode (P m)) => ProtoFormat m where
    type P m :: *
    toProto :: m -> P m
    fromProto :: P m -> m

    toByteString :: m -> ByteString
    toByteString m = runPut $ encodeMessage $ toProto m

    fromByteString :: ByteString -> Either String m
    fromByteString p = fmap fromProto $ runGet decodeMessage p
