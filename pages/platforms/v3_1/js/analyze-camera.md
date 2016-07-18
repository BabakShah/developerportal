---
title: Analyze a camera feed
permalink: /v3_1/javascript/analyze-camera/
tags: [js, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

Using a webcam is a common way to obtain video for facial expression detection. The ```CameraDetector``` can access a webcam connected to the device to capture frames and feed them directly to the facial expression engine.

You can try it out in [JSFiddle](https://jsfiddle.net/affectiva/opyh5e8d/show/)

### Creating the detector

The ```CameraDetector``` constructor expects four parameters { `divRoot`, `width`, `height`, `faceMode` }

```js
/*
   SDK Needs to create video and canvas nodes in the DOM in order to function
   Here we are adding those nodes a predefined div.
*/
var divRoot = $("#affdex_elements")[0]; 

// The captured frame's width in pixels
var width = 640;

// The captured frame's height in pixels
var height = 480;

/*
   Face detector configuration - If not specified, defaults to 
   affdex.FaceDetectorMode.LARGE_FACES
   affdex.FaceDetectorMode.LARGE_FACES=Faces occupying large portions of the frame
   affdex.FaceDetectorMode.SMALL_FACES=Faces occupying small portions of the frame
*/
var faceMode = affdex.FaceDetectorMode.LARGE_FACES;

//Construct a CameraDetector and specify the image width / height and face detector mode.
var detector = new affdex.CameraDetector(divRoot, width, height, faceMode);
```

{% include js/v3_1/detector/set-interface-classes.md %}

##### onWebCamConnect

It occurs when the camera detector tries to connect to a webcam one of two possible callbacks can occur:

```javascript
detector.addEventListener("onWebcamConnectSuccess", function() {
	console.log("I was able to connect to the camera successfully.");
});

detector.addEventListener("onWebcamConnectFailure", function() {
	console.log("I've failed to connect to the camera :(");
});
```

{% include js/v3_1/detector/choose-classifiers.md %}

{% include js/v3_1/detector/start.md %}

In addition, it attempts to connect to the web camera to capture video frames.

{% include js/v3_1/detector/stop.md %}
