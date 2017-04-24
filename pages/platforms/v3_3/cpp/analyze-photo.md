---
title: Analyze a photo
permalink: /v3_3/cpp/analyze-photo/
tags: [windows, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
**classdoc:** PhotoDetector [[c++]({{ site.baseurl }}/pages/platforms/v3_3/cpp/classdocs/affdex-native/classaffdex_1_1_photo_detector.html)]

The ```PhotoDetector```class is used for streamlining the processing of still images. Since photos lack any continuity over time, the expression and emotion detection is performed independently on each frame and the timestamp is ignored. Due to this fact, the underlying emotion detection may return different results than the video based detectors.

### Creating the detector
The ```PhotoDetector``` constructor expects two parameters { `maxNumFaces` and `faceConfig` }

```cpp
PhotoDetector(
              /**
                The maximum number of faces to track
                If not specified, DEFAULT_MAX_NUM_FACES=1
              */
              unsigned int maxNumFaces,

              /**
                Face detector configuration
                If not specified, defaults to FaceDetectorMode.SMALL_FACES

                FaceDetectorMode.LARGE_FACES=Faces occupying large portions of the photo
                FaceDetectorMode.SMALL_FACES=Faces occupying small portions of the photo
              */
              FaceDetectorMode faceConfig
);
```

Example,

```cpp
affdex::PhotoDetector detector;
```
{% include cpp/v3_3/detector/configure.md %}

{% include cpp/v3_3/detector/set-interface-classes.md %}

{% include cpp/v3_3/detector/choose-classifiers.md %}

{% include cpp/v3_3/detector/start.md %}

{% include cpp/v3_3/detector/process-frame.md %}

{% include cpp/v3_3/detector/stop.md %}
