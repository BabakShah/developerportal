---
title: Analyze a photo
permalink: /v3_1/javascript/analyze-photo/
tags: [js, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

The ```PhotoDetector``` is used for streamlining the processing of still images. Since photos lack any continuity over time, the expression and emotion detection is performed independently on each frame and the timestamp is ignored. Due to this fact, the underlying emotion detection may return different results than the video based detectors.

You can try it out in [JSFiddle](https://jsfiddle.net/affectiva/h6p64vwg/show/)

### Creating the detector

The ```PhotoDetector``` constructor expects a parameter { `faceMode` }

```js
/*
   Face detector configuration - If not specified, defaults to       
   affdex.FaceDetectorMode.LARGE_FACES
   affdex.FaceDetectorMode.LARGE_FACES=Faces occupying large portions of the frame
   affdex.FaceDetectorMode.SMALL_FACES=Faces occupying small portions of the frame
*/
var faceMode = affdex.FaceDetectorMode.LARGE_FACES;

//Construct a PhotoDetector and specify the image width / height and face detector mode.
var detector = new affdex.PhotoDetector(faceMode);
```

{% include js/v3_1/detector/set-interface-classes.md %}

{% include js/v3_1/detector/choose-classifiers.md %}

{% include js/v3_1/detector/start.md %}

{% include js/v3_1/detector/process-frame.md %}

{% include js/v3_1/detector/stop.md %}