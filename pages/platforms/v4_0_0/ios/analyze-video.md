---
title: Analyze a video file
permalink: /v4_0_0/ios/analyze-video/
tags: [ios, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
**classdoc:** Detector [[ObjectiveC]({{ site.baseurl }}/pages/platforms/v4_0_0/ios/classdocs/interface_a_f_d_x_detector.html)]

A common use of the SDK is to process previously captured video files. Another way to feed video into the detector is via a video file that is stored on the file system of your device.

### Creating the detector

```objc
- (id)initWithDelegate:(id <AFDXDetectorDelegate>)delegate usingFile:(NSString *)path maximumFaces:(NSUInteger)maximumFaces faceMode:(FaceDetectorMode)faceMode;
```

This initialization method also takes a reference to an object which adheres to the `AFDXDetectorDelegate` protocol, a path to a video file (with an extension of .mp4 or .m4v) on the device, the maximum number of faces to detect, and the face mode (`LARGE_FACES` or `SMALL_FACES`).

{% include ios/v3_1/detector/configure.md %}


```objc
- (void)detectorDidFinishProcessing:(AFDXDetector *)detector;
```

This method is called in your code when the detector has finished processing a video file. (It is not called when using the camera or static images.) The implementation of this delegate method is optional.  

```

{% include ios/v3/detector/choose-classifiers.md %}

{% include ios/v3/detector/start.md %}

Note that

On `start` the video is decoded to capture video frames then processes them and use the `AFDXDetectorDelegate` protocol to notify of the captured frames, and results.

{% include ios/v3/detector/getting_results.md %}

{% include ios/v3/detector/stop.md %}
