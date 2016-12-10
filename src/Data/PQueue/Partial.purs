module Data.PQueue.Partial
  ( head
  , tail
  , init
  , last
  ) where

import Prelude

import Data.List.Partial as PL
import Data.Newtype (over, unwrap)
import Data.Tuple (Tuple)

import Data.PQueue (PQueue(..))

-- | Get the minimal element of a queue.
head :: forall p a. Partial => PQueue p a -> Tuple p a
head = PL.head <<< unwrap

-- | Delete the minimal element of a queue.
tail :: forall p a. Partial => PQueue p a -> PQueue p a
tail = over PQueue PL.tail

-- | Delete the maximal element of a queue.
init :: forall p a. Partial => PQueue p a -> PQueue p a
init = over PQueue PL.init

-- | Get the maximal element of a queue.
last :: forall p a. Partial => PQueue p a -> Tuple p a
last = PL.last <<< unwrap
