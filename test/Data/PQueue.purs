module Test.Data.PQueue where

import Prelude (Unit, bind)

import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Data.PQueue

pqueueSpec :: forall r. (Spec r) Unit
pqueueSpec = describe "PQueue" do
  let q = fromFoldable [(Tuple 2 "b"), (Tuple 3 "c")]

  describe "insert" do
    it "inserts the element into the queue" do
      insert 1 "a" q `shouldEqual` fromFoldable [(Tuple 1 "a"), (Tuple 2 "b"), (Tuple 3 "c")]
      insert 4 "d" q `shouldEqual` fromFoldable [(Tuple 2 "b"), (Tuple 3 "c"), (Tuple 4 "d")]

  describe "head" do
    it "gets the minimal element of the queue" do
      head q `shouldEqual` Just (Tuple 2 "b")

  describe "tail" do
    it "deletes the minimal element of the queue" do
      tail q `shouldEqual` fromFoldable [(Tuple 3 "c")]
