---
title: Analyze a video frame stream
permalink: /v3/android/analyze-frames/
tags: [android, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
**classdoc:** [[FrameDetector](({{ site.baseurl }}/pages/platforms/v3/android/javadoc/com/affectiva/android/affdex/sdk/detector/FrameDetector.html)]

The ```FrameDetector``` tracks expressions in a sequence of real-time frames. It expects each frame to have a timestamp that indicates the time the frame was captured. The timestamps arrive in an increasing order. The ```FrameDetector``` will detect a face in an frame and deliver information on it to you, including the facial expressions.

### Creating the detector
The ```FrameDetector``` constructor expects three parameters { `context`, `maxNumFaces` and `faceDetectorMode` }

```java
public FrameDetector(
              /**
                The application context.
              */
              Context context,

              /**
                The maximum number of faces to track
                If not specified, default=1
              */
              int maxNumFaces,

              /**
                Face detector configuration - If not specified, defaults to FaceDetectorMode.LARGE_FACES
                  FaceDetectorMode.LARGE_FACES=Faces occupying large portions of the frame
                  FaceDetectorMode.SMALL_FACES=Faces occupying small portions of the frame
              */
              FaceDetectorMode faceConfig
);
```

Example,

```java
FrameDetector detector = new FrameDetector(this);
```
{% include android/v3/detector/configure.md %}

{% include android/v3/detector/set-interface-classes.md %}

{% include android/v3/detector/choose-classifiers.md %}

{% include android/v3/detector/start.md %}

{% include android/v3/detector/process-frame.md %}

{{note}} The FrameDetector uses the timestamp field to keep track of time. Therefore, make sure it is set to a positive number that increases with each subsequent frame passed for processing. {{end}}

{% include android/v3/detector/stop.md %}
