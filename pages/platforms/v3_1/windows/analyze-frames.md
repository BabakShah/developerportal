---
title: Analyze a video frame stream
permalink: /v3_1/windows/analyze-frames/
tags: [windows, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
**classdoc:** FrameDetector [[c++]({{ site.baseurl }}/pages/platforms/v3_1/cpp/classdocs/affdex-native/classaffdex_1_1_frame_detector.html)], [[c#]({{ site.baseurl }}/pages/platforms/v3_1/windows/classdocs/Affdex/html/bd91c0f9-9c20-5ef9-0df9-565cb08997b9.htm)]

The ```FrameDetector``` tracks expressions in a sequence of real-time frames. It expects each frame to have a timestamp that indicates the time the frame was captured. The timestamps arrive in an increasing order. The ```FrameDetector``` will detect a face in an frame and deliver information on it to you, including the facial expressions.

### Creating the detector
The ```FrameDetector``` constructor expects four parameters { `bufferSize`, `processFrameRate`, `maxNumFaces` and `faceConfig` }

```csharp
FrameDetector(
              /**
                The number of frames to hold in the internal frame buffer for processing
                If the buffer becomes full because processing cannot keep up with the supply of frames,
                the oldest unprocessed frame is dropped.
              */
              int bufferSize,

              /**
                The maximum number of frames processed per second
                If not specified, DEFAULT_PROCESSING_FRAMERATE=30
              */
              float processFrameRate,

              /**
                The maximum number of faces to track
                If not specified, DEFAULT_MAX_NUM_FACES=1
              */
              unsigned int maxNumFaces,

              /**
                Face detector configuration - If not specified, defaults to FaceDetectorMode.LARGE_FACES
                  FaceDetectorMode.LARGE_FACES=Faces occupying large portions of the frame
                  FaceDetectorMode.SMALL_FACES=Faces occupying small portions of the frame
              */
              FaceDetectorMode faceConfig
);
```

Example,

```csharp
FrameDetector detector = new FrameDetector(2);
```
{% include windows/v3_1/detector/configure.md %}

{% include windows/v3_1/detector/set-interface-classes.md %}

{% include windows/v3_1/detector/choose-classifiers.md %}

{% include windows/v3_1/detector/start.md %}

{% include windows/v3_1/detector/process-frame.md %}

{{note}} The FrameDetector uses the timestamp field of the Frame to keep track of time. Therefore, make sure it is set to a positive number that increases with each subsequent frame passed for processing. {{end}}

{% include windows/v3_1/detector/stop.md %}
