module Data.PQueue.Partial
  ( head
  , tail
  , init
  , last
  ) where

import Data.PQueue (PQueue(..))
import Data.Tuple (Tuple)
import Data.List.Partial as PL

-- | Get the minimal element of a queue.
head :: forall p a. Partial => PQueue p a -> Tuple p a
head (PQueue list) = PL.head list

-- | Delete the minimal element of a queue.
tail :: forall p a. Partial => PQueue p a -> PQueue p a
tail (PQueue list) = PQueue (PL.tail list)

-- | Delete the maximal element of a queue.
init :: forall p a. Partial => PQueue p a -> PQueue p a
init (PQueue list) = PQueue (PL.init list)

-- | Get the maximal element of a queue.
last :: forall p a. Partial => PQueue p a -> Tuple p a
last (PQueue list) = PL.last list
