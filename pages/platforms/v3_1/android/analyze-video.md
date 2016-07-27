---
title: Analyze a video file
permalink: /v3_1/android/analyze-video/
tags: [android, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
**classdoc:** [[VideoDetector]({{ site.baseurl }}/pages/platforms/v3_1/android/javadoc/com/affectiva/android/affdex/sdk/detector/VideoFileDetector.html)]

A common use of the SDK is to process previously captured video files. The ```VideoDetector``` helps streamline this effort by decoding and processing frames from a video file.

### Creating the detector
The ```VideoDetector``` constructor expects three parameters { `context`, `filePath`, `maxNumFaces` and `faceDetectorMode` }

```java
public VideoDetector(
              /**
                The application context.
              */
              Context context,

              /**
                String represents the file path on device memory.
              */
              String filePath,

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
String fileName = "/sdcard/movie.mp4";
VideoDetector detector = new VideoDetector(this, fileName);
```

{% include android/v3/detector/configure.md %}

{% include android/v3/detector/set-interface-classes.md %}

{% include android/v3/detector/choose-classifiers.md %}

{% include android/v3/detector/start.md %}

Once `start()` is called, the video frames are decoded, processed and the callback functions are used to notify of the decoded frames, results.

{% include android/v3/detector/stop.md %}
