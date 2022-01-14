module Test.Main where

import Prelude

import Effect.Aff (Aff)
import Test.Spec.Runner (run, runSpec)
import Test.Spec.Reporter.Console (consoleReporter)

import Test.Data.PQueueSpec (pqueueSpec)
import Test.Data.PQueue.PartialSpec (partialSpec)

main :: Aff Unit
main = runSpec [consoleReporter] do
  pqueueSpec
  partialSpec
