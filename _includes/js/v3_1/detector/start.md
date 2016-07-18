### Initializing the detector
After a detector is configured using the methods above, the detector initialization can be triggered by calling the start method:  

```js
detector.start();
```

A web worker is created for the processing. The worker downloads the SDK runtime and the classifier data files required to process images. It initializes the SDK runtime.