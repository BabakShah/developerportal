---
title: Analyze a camera feed
permalink: /v3_1_1/ios/analyze-camera/
tags: [ios, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

**classdoc:** Detector [[ObjectiveC]({{ site.baseurl }}/pages/platforms/v3_1_1/ios/classdocs/interface_a_f_d_x_detector.html)]

Using the built-in camera is a common way to obtain video for facial expression detection. Either the front or back camera of your iPhone, iPad or iPod Touch can be used to feed video directly:


### Creating the detector

```objc
- (id)initWithDelegate:(id <AFDXDetectorDelegate>)delegate usingCamera:(AFDXCameraType)camera maximumFaces:(NSUInteger)maximumFaces faceMode:(FaceDetectorMode)faceMode;

```

This method takes a reference to an object which adheres to the `AFDXDetectorDelegate` protocol, a parameter of type `AFDXCameraType` (`AFDX_CAMERA_FRONT` or `AFDX_CAMERA_BACK`) which specifies the camera to use, the maximum number of faces to detect, and the face mode (`LARGE_FACES` or `SMALL_FACES`).


{% include ios/v3_1/detector/configure.md %}

**Processing**

If you plan to use the camera to process facial frames using the Affdex SDK, you can specify the maximum number of frames per second. This is helpful to balance battery life with your processing requirements. The default (and recommended) rate is 5 frames per second, but you may also set it lower if you are using an older device such as an iPad 2, and need additional performance.  

```objc
detector.maxProcessRate = 8.0;
```

{% include ios/v3/detector/choose-classifiers.md %}

{% include ios/v3/detector/start.md %}

Note that

The `start()` connects to the specified camera to capture video frames then processes them and use the `AFDXDetectorDelegate` protocol to notify of the captured frames, and results. If you specify the use of the device camera and the camera is already in use, an error results.

{% include ios/v3/detector/getting_results.md %}

{% include ios/v3/detector/stop.md %}
