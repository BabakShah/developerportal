---
title: Analyze a video frame stream
permalink: /v3_3/cpp/analyze-frames/
tags: [windows, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
**classdoc:** FrameDetector [[c++]({{ site.baseurl }}/pages/platforms/v3_3/cpp/classdocs/affdex-native/classaffdex_1_1_frame_detector.html)]

The ```FrameDetector``` tracks expressions in a sequence of real-time frames. It expects each frame to have a timestamp that indicates the time the frame was captured. The timestamps arrive in an increasing order. The ```FrameDetector``` will detect a face in an frame and deliver information on it to you, including the facial expressions.

### Creating the detector
The ```FrameDetector``` constructor expects four parameters { `bufferSize`, `processFrameRate`, `maxNumFaces` and `faceConfig` }

```cpp
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

```cpp
affdex::FrameDetector detector(2);
```
{% include cpp/v3_3/detector/configure.md %}

{% include cpp/v3_3/detector/set-interface-classes.md %}

{% include cpp/v3_3/detector/choose-classifiers.md %}

{% include cpp/v3_3/detector/start.md %}

{% include cpp/v3_3/detector/process-frame.md %}

{{note}} The FrameDetector uses the timestamp field of the Frame to keep track of time. Therefore, make sure it is set to a positive number that increases with each subsequent frame passed for processing. {{end}}

{% include cpp/v3_3/detector/stop.md %}
