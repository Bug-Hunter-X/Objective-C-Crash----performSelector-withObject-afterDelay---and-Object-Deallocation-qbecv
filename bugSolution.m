A safer approach is to use Grand Central Dispatch (GCD) and blocks, ensuring the object's lifetime is managed properly:

```objectivec
// Solution using GCD
MyObject *myObject = [[MyObject alloc] init];
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
    if (myObject) {
        [myObject delayedMethod];
    }
});

// Or using weak reference:
__weak MyObject *weakMyObject = myObject;

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
    if (weakMyObject) {
        [weakMyObject delayedMethod];
    }
});
```

This solution checks if `myObject` still exists before calling `delayedMethod`.  The use of weak references (weakMyObject) helps prevent retain cycles. The GCD ensures the block is executed on the main thread after the specified delay.