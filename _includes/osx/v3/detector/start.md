### Initializing the detector
After a detector is configured using the methods above, the detector initialization can be triggered by calling the start method:  

```objective-c
NSError *error = [detector start];
```

Check the return value for any error that may have occurred during the start process. If everything is fine, then `nil` will be returned and the detector comes to life.
