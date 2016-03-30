module Test.Data.PQueue.Partial where

import Prelude (Unit, bind)

import Data.Tuple (Tuple(..))
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Data.PQueue (fromFoldable)
import Data.PQueue.Partial

partialSpec :: forall r. (Spec r) Unit
partialSpec = describe "Partial" do
  let queue = fromFoldable [(Tuple 2 "b"), (Tuple 3 "c")]

  describe "head" do
    it "gets the minimal element of the queue" do
      head queue `shouldEqual` Tuple 2 "b"

  describe "tail" do
    it "deletes the minimal element of the queue" do
      tail queue `shouldEqual` fromFoldable [(Tuple 3 "c")]

  describe "init" do
    it "deletes the maximal element of the queue" do
      init queue `shouldEqual` fromFoldable [(Tuple 2 "b")]

  describe "last" do
    it "gets the maximal element of the queue" do
      last queue `shouldEqual` Tuple 3 "c"
