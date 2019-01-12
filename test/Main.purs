module Test.Main where

import Prelude

import Effect (Effect)
import Test.Spec.Runner (run)
import Test.Spec.Reporter.Console (consoleReporter)

import Test.Data.PQueueSpec (pqueueSpec)
import Test.Data.PQueue.PartialSpec (partialSpec)

main :: Effect Unit
main = run [consoleReporter] do
  pqueueSpec
  partialSpec
