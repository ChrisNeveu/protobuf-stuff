module Import
  ( module Import
  ) where

import           Prelude              as Import hiding (head, init, last,
                                                 readFile, tail, writeFile)

import           Control.Applicative  as Import (pure, (<$>), (<*>))
import           Data.Text            as Import (Text)

import           Data.Monoid          as Import
                                                 (Monoid (mappend, mempty, mconcat))

infixr 5 <>
(<>) :: Monoid m => m -> m -> m
(<>) = mappend
