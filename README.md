# Objective-C Crash: `performSelector:withObject:afterDelay:` and Object Deallocation

This repository demonstrates a subtle bug in Objective-C related to the use of `performSelector:withObject:afterDelay:` and the potential for object deallocation before the delayed selector is invoked.  The bug and its solution are detailed below.

## The Problem

The `performSelector:withObject:afterDelay:` method is convenient for scheduling tasks, but it introduces a risk when the object receiving the selector might be deallocated before the delay period expires. If the object is deallocated, attempting to execute the selector results in a crash.

## The Solution

To avoid this, use techniques that ensure the object remains in memory until after the selector is invoked or use a more robust approach such as using blocks and GCD (Grand Central Dispatch).  The solution demonstrates the use of blocks with GCD to achieve safe delayed execution.

## How to reproduce
1. Clone the repo
2. Compile and run the project. You may observe a crash.