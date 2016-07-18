---
title: Analyze a video frame stream
permalink: /v3_1/javascript/analyze-frames/
tags: [js, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

Using a frame stream is a common way to obtain video for facial expression detection. The ```FrameDetector``` can track expressions in a sequence of real-time frames. It expects each frame to have a timestamp that indicates the time the frame was captured. The timestamps arrive in an increasing order. The ```FrameDetector``` will detect a face in an frame and deliver information on it to you, including the facial expressions.


### Creating the detector

The ```FrameDetector``` constructor expects a parameter { `faceMode` }

```js
/*
   Face detector configuration - If not specified, defaults to F
   affdex.FaceDetectorMode.LARGE_FACES
   affdex.FaceDetectorMode.LARGE_FACES=Faces occupying large portions of the frame
   affdex.FaceDetectorMode.SMALL_FACES=Faces occupying small portions of the frame
*/
var faceMode = affdex.FaceDetectorMode.LARGE_FACES;

//Construct a FrameDetector and specify the image width / height and face detector mode.
var detector = new affdex.FrameDetector(faceMode);
```

{% include js/v3_1/detector/set-interface-classes.md %}

{% include js/v3_1/detector/choose-classifiers.md %}

{% include js/v3_1/detector/start.md %}

{% include js/v3_1/detector/process-frame.md %}

{% include js/v3_1/detector/stop.md %}