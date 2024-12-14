In Objective-C, a rare but impactful bug can arise from the misuse of `performSelector:withObject:afterDelay:` when dealing with objects that might be deallocated before the selector is invoked.  If the object to which the selector is sent is deallocated before the delay expires, attempting to invoke the selector on it will lead to a crash.

```objectivec
// Problematic code
MyObject *myObject = [[MyObject alloc] init];
[myObject performSelector:@selector(delayedMethod) withObject:nil afterDelay:5.0];
// ... some time passes and myObject is deallocated ...
```

This is subtle because the crash doesn't happen immediately. The problem becomes evident only when the delayed selector is finally invoked, leading to unpredictable crashes at seemingly random moments.