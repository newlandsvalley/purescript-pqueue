module Data.PQueue.Partial
  ( head
  , tail
  , init
  , last ) where

import Data.PQueue (PQueue(..))
import Data.Tuple (Tuple)
import Data.List.Unsafe as LU

-- | Get the minimal element of a queue.
head :: forall p a. PQueue p a -> Tuple p a
head (PQueue list) = LU.head list

-- | Delete the minimal element of a queue.
tail :: forall p a. PQueue p a -> PQueue p a
tail (PQueue list) = PQueue (LU.tail list)

-- | Delete the maximal element of a queue.
init :: forall p a. PQueue p a -> PQueue p a
init (PQueue list) = PQueue (LU.init list)

-- | Get the maximal element of a queue.
last :: forall p a. PQueue p a -> Tuple p a
last (PQueue list) = LU.last list
