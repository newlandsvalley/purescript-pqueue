module Test.Data.PQueue.PartialSpec where

import Prelude

import Data.Tuple (Tuple(..))
import Partial.Unsafe (unsafePartial)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Data.PQueue (fromFoldable)
import Data.PQueue.Partial (head, init, last, tail)

partialSpec :: Spec Unit
partialSpec = describe "Partial" do
  let queue = fromFoldable [(Tuple 2 "b"), (Tuple 3 "c")]

  describe "head" do
    it "returns the first element of the queue" do
      unsafePartial (head queue) `shouldEqual` Tuple 2 "b"

  describe "tail" do
    it "returns all but the first element of the queue" do
      unsafePartial (tail queue) `shouldEqual` fromFoldable [(Tuple 3 "c")]

  describe "init" do
    it "returns all but the last element of the queue" do
      unsafePartial (init queue) `shouldEqual` fromFoldable [(Tuple 2 "b")]

  describe "last" do
    it "returns the last element of the queue" do
      unsafePartial (last queue) `shouldEqual` Tuple 3 "c"
