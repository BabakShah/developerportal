---
title: Analyze a camera feed
permalink: /v3/cpp/analyze-camera/
tags: [cpp, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
**classdoc:** CameraDetector [[c++]({{ site.baseurl }}/pages/platforms/v3/cpp/classdocs/affdex-native/classaffdex_1_1_camera_detector.html)]

Using a webcam is a common way to obtain video for facial expression detection. The ```CameraDetector``` can access a webcam connected to the device to capture frames and feed them directly to the facial expression engine.

### Creating the detector
The ```CameraDetector``` constructor expects five parameters { `cameraId`, `cameraFPS`, `processFrameRate`, `maxNumFaces` and `faceConfig` }

```cpp
CameraDetector(
              /**
                The CameraId
                If not specified, default=0
              */
              int cameraId,

              /**
                The number of frames to capture per second.
                If not specified, default=15
              */
              int cameraFPS,

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
affdex::CameraDetector detector;
```
{% include cpp/v3/detector/configure.md %}

**Camera**

As an alternative to specifying the camera id and frame rate in the constructor.
Those parameters can be set be calling `setCameraId` and `setCameraFPS`:

```csharp
int camId = 10;
int camFPS = 60;

detector.setCameraId(camId);
detector.setCameraFPS(camFPS);
```


{% include cpp/v3/detector/set-interface-classes.md %}

{% include cpp/v3/detector/choose-classifiers.md %}

{% include cpp/v3/detector/start.md %}

The `start()` spawns a thread the connects to the specified camera to capture video frames then processes them and use the callback functions to notify of the captured frames, results and exceptions (if exist). `start()` is a non-blocking call.

{% include cpp/v3/detector/stop.md %}
