module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Test.Spec.Runner (RunnerEffects, run)
import Test.Spec.Reporter.Console (consoleReporter)

import Test.Data.PQueueSpec (pqueueSpec)
import Test.Data.PQueue.PartialSpec (partialSpec)

main :: Eff (RunnerEffects ()) Unit
main = run [consoleReporter] do
  pqueueSpec
  partialSpec
