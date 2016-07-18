### Configuring the callback functions

The Detectors use callbacks to communicate events and results. For each action there are two callbacks. A success callback is called when an action successfully completes, and a failure callback is called in case of an action failure. 

The functions `addEventListener` and `removeEventListener` are used to register or deregister a callback.

##### onInitialize

This action occurs at the end of a detector initialization process.  

```javascript
detector.addEventListener("onInitializeSuccess", function() {});
detector.addEventListener("onInitializeFailure", function() {});
```

##### onImageResults

This action occurs at the end of the processing of a video frame. 

```javascript
/* 
  onImageResults success is called when a frame is processed successfully and receives 3 parameters:
  - Faces: Dictionary of faces in the frame keyed by the face id.
           For each face id, the values of detected emotions, expressions, appearane metrics 
           and coordinates of the feature points
  - image: An imageData object containing the pixel values for the processed frame.
  - timestamp: The timestamp of the captured image in seconds.
*/
detector.addEventListener("onImageResultsSuccess", function (faces, image, timestamp) {});

/* 
  onImageResults success receives 3 parameters:
  - image: An imageData object containing the pixel values for the processed frame.
  - timestamp: An imageData object contain the pixel values for the processed frame.
  - err_detail: A string contains the encountered exception.
*/
detector.addEventListener("onImageResultsFailure", function (image, timestamp, err_detail) {});
```

##### onReset

This action occurs at the conclusion of `detector.reset()` 

```javascript
detector.addEventListener("onResetSuccess", function() {});
detector.addEventListener("onResetFailure", function() {});
```

##### onStop

This action occurs at the end of a `detector.stop()` after terminating the web worker and stopping the frame processing.  

```javascript
detector.addEventListener("onStopSuccess", function() {});
detector.addEventListener("onStopFailure", function() {});
```