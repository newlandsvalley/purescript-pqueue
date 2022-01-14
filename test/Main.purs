module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff)
import Test.Spec.Runner (run, runSpec)
import Test.Spec.Reporter.Console (consoleReporter)

import Test.Data.PQueueSpec (pqueueSpec)
import Test.Data.PQueue.PartialSpec (partialSpec)

main :: Effect Unit
main = do 
  _ <- launchAff $ runSpec [consoleReporter] do
         pqueueSpec
         partialSpec
  pure unit
