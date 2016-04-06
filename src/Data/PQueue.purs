module Data.PQueue
  ( PQueue(..)
  , fromFoldable
  , empty
  , singleton
  , isEmpty
  , insert
  , head
  , tail
  , init
  , last
  ) where

import Prelude (class Eq, class Ord, class Show, Ordering, compare, show, ($), (==))

import Data.Foldable (class Foldable)
import Data.List (List(..))
import Data.List (fromFoldable, head, insertBy, last, null, singleton, sortBy) as L
import Data.List.Unsafe (init, tail) as LU
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..), fst)

-- | `PQueue p a` represents a queue of elements of type `a` with priorities of type `p`.
newtype PQueue p a = Empty | Node a p (Node a) (Node a)

instance eqPQueue :: (Eq a) => Eq (PQueue p a) where
  eq (Node a _ a1 a2) (Node b _ b1 b2) = (a == b) && (a1 == b1) && (a2 == b2)

instance showPQueue :: (Show a) => Show (PQueue p a) where
  show (Node a p a1 a2) = show a

-- | Compare two elements in the queue.
cmp :: forall p a. (Ord p) => Tuple p a -> Tuple p a -> Ordering
cmp a b = compare (fst a) (fst b)

-- | Create a queue from a foldable structure.
fromFoldable :: forall p a f. (Foldable f, Ord p) => f (Tuple p a) -> PQueue p a
fromFoldable f = PQueue (L.sortBy cmp (L.fromFoldable f))

-- | Create an empty queue.
empty :: forall p a. PQueue p a
empty = Empty

-- | Create a queue with a single element.
singleton :: forall p a. p -> a -> PQueue p a
singleton key value = Node a p Empty Empty

-- | Test whether a queue is empty.
isEmpty :: forall p a. PQueue p a -> Boolean
isEmpty Empty = true
isEmpty _     = false

-- | Insert an element into the queue.
insert :: forall p a. (Ord p) => p -> a -> PQueue p a -> PQueue p a
insert key value (PQueue list) = PQueue (L.insertBy cmp (Tuple key value) list)

-- | Get the minimal element of a queue.
head :: forall p a. PQueue p a -> Maybe (Tuple p a)
head (PQueue list) = L.head list

-- | Delete the minimal element of a queue.
tail :: forall p a. PQueue p a -> Maybe (PQueue p a)
tail (PQueue Nil) = Nothing
tail (PQueue list) = Just $ PQueue (LU.tail list)

-- | Delete the maximal element of a queue.
init :: forall p a. PQueue p a -> Maybe (PQueue p a)
init (PQueue Nil) = Nothing
init (PQueue list) = Just $ PQueue (LU.init list)

-- | Get the maximal element of a queue.
last :: forall p a. PQueue p a -> Maybe (Tuple p a)
last (PQueue list) = L.last list
