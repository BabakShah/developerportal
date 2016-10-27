---
title: Analyze a photo
permalink: /v3_1_1/android/analyze-photo/
tags: [android, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
**classdoc:** [[PhotoDetector]({{ site.baseurl }}/pages/platforms/v3_1_1/android/javadoc/com/affectiva/android/affdex/sdk/detector/PhotoDetector.html)]

The ```PhotoDetector``` class is used for streamlining the processing of still images. Since photos lack any continuity over time, the expression and emotion detection is performed independently on each frame and the timestamp is ignored. Due to this fact, the underlying emotion detection may return different results than the video based detectors.

### Creating the detector
The ```PhotoDetector``` constructor expects three parameters { `context`, `maxNumFaces` and `faceDetectorMode` }

```java
public PhotoDetector(
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
                Face detector configuration - If not specified, defaults to FaceDetectorMode.SMALL_FACES
                  FaceDetectorMode.LARGE_FACES=Faces occupying large portions of the frame
                  FaceDetectorMode.SMALL_FACES=Faces occupying small portions of the frame
              */
              FaceDetectorMode faceConfig
);
```

Example,

```java
PhotoDetector detector = new PhotoDetector(this);
```

{% include android/v3/detector/set-interface-classes.md %}

{% include android/v3/detector/choose-classifiers.md %}

{% include android/v3/detector/start.md %}

### Processing a photo
After successfully starting the detector, photos can be processed by calling the ```process()``` method. ```process()``` expects an ```Affdex.Frame``` (Bitmap, RGBA, and YUV420sp/NV21 formats are supported).

**classdoc:** Frame [java]({{ site.baseurl }}/pages/platforms/v3/android/javadoc/com/affectiva/android/affdex/sdk/Frame.html)

For example to process an YUV420sp/NV21 frame:

```java
byte [] frameData;
int width = 640;
int height = 480;

Frame.ByteArrayFrame frame = new Frame.ByteArrayFrame(frameData, width, height,
                                                      Frame.COLOR_FORMAT.YUV_NV21);
detector.process(frame);
```

{% include android/v3/detector/stop.md %}
