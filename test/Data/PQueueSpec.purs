module Test.Data.PQueueSpec where

import Prelude (Unit, discard)

import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Data.PQueue

pqueueSpec :: Spec Unit
pqueueSpec = describe "PQueue" do
  let queue = fromFoldable [(Tuple 2 "b"), (Tuple 3 "c")]
  let emptyQueue = fromFoldable []::(PQueue Int String)

  describe "insert" do
    it "inserts the element into the queue" do
      insert 1 "a" queue `shouldEqual` fromFoldable [(Tuple 1 "a"), (Tuple 2 "b"), (Tuple 3 "c")]
      insert 4 "d" queue `shouldEqual` fromFoldable [(Tuple 2 "b"), (Tuple 3 "c"), (Tuple 4 "d")]

  describe "head" do
    it "gets the minimal element of the queue" do
      head queue `shouldEqual` Just (Tuple 2 "b")

    it "returns nothing given an empty queue" do
      head emptyQueue `shouldEqual` Nothing

  describe "tail" do
    it "deletes the minimal element of the queue" do
      tail queue `shouldEqual` Just (fromFoldable [(Tuple 3 "c")])

    it "returns nothing given an empty queue" do
      tail emptyQueue `shouldEqual` Nothing

  describe "init" do
    it "deletes the maximal element of the queue" do
      init queue `shouldEqual` Just (fromFoldable [(Tuple 2 "b")])

    it "returns nothing given an empty queue" do
      init emptyQueue `shouldEqual` Nothing

  describe "last" do
    it "gets the maximal element of the queue" do
      last queue `shouldEqual` Just (Tuple 3 "c")

    it "returns nothing given an empty queue" do
      last emptyQueue `shouldEqual` Nothing
