---
title: Analyze a video file
permalink: /v3_2/cpp/analyze-video/
tags: [windows, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
**classdoc:** VideoDetector [[c++]({{ site.baseurl }}/pages/platforms/v3_2/cpp/classdocs/affdex-native/classaffdex_1_1_video_detector.html)]

A common use of the SDK is to process previously captured video files. The VideoDetector [[c++]({{ site.baseurl }}/pages/platforms/v3_2/cpp/classdocs/affdex-native/classaffdex_1_1_video_detector.html)] helps streamline this effort by decoding and processing frames from a video file. Like the `FrameDetector`, the constructor accepts a parameter for processing frames per second. This parameter regulates how many frames from the video stream get processed. During processing, the <code>VideoDetector</code> decodes and processes frames as fast as possible and actual processing times will depend on CPU speed. Please see [this list]({{ site.baseurl }}/supportedvideoformats/) of accepted file types and recommended video codecs that are compatible with the detector.

### Creating the detector
The VideoDetector [[c++]({{ site.baseurl }}/pages/platforms/v3_2/cpp/classdocs/affdex-native/classaffdex_1_1_video_detector.html)] constructor expects two parameters { `processFrameRate`, `maxNumFaces` and `faceConfig` }

```cpp
VideoDetector(
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
affdex::VideoDetector detector(15);
```
{% include cpp/v3_2/detector/configure.md %}

{% include cpp/v3_2/detector/set-interface-classes.md %}

{% include cpp/v3_2/detector/choose-classifiers.md %}

{% include cpp/v3_2/detector/start.md %}

The `start()` spawns a thread that decodes video frames then processes them and use the callback functions to notify of the decoded frames, results and exceptions (if exist).

### Processing a video
Once the detector is started, the processing begins by calling the process function, the path to video file you are processing is passed in as a parameter:  

```csharp
void process(String path);
```

On completion of the video processing, the `onProcessingFinished` function is called from the ProcessStatusListener [[c++]({{ site.baseurl }}/pages/platforms/v3_2/cpp/classdocs/affdex-native/classaffdex_1_1_process_status_listener.html)]. `process()` is a non-blocking call.

{% include cpp/v3_2/detector/stop.md %}
