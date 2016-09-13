---
title: Affdex SDK for OS X  
permalink: /v3/osx/  
tags: [osx, sdk]  
audience: writer, designer  
keywords:  
last_updated:  
summary:  
metadata: false
---

{% include linkrefs.html %}

SDK Developer Guide Release 3.0

## Using the SDK

The purpose of the SDK is to detect facial expressions and their underlying emotions (along with appearance and emojis) from facial images. The SDK is distributed as a framework:

* **Affdex.framework** Framework for OS X  Application.

## Getting started

##### 1. [Download]({{ site.baseurl }}/downloads/) and extract the archives  

##### 2. Import the Affdex framework into your application
* Drag the framework into your Xcode project.
* Your code must include the Objective-C header file `Affdex/Affdex.h`

##### 3. Capture and analyze faces  

Facial images can be captured from different sources. For each of the different sources, the SDK defines a detector class that can handle processing images acquired from that source:

* [Analyze a camera feed]({{ site.baseurl }}/v3/osx/analyze-camera/)
* [Analyze a recorded video file]({{ site.baseurl }}/v3/osx/analyze-video/)
* [Analyze a video frame stream]({{ site.baseurl }}/v3/osx/analyze-frames/)
* [Analyze a photo]({{ site.baseurl }}/v3/osx/analyze-photo/)

## Requirements & Dependencies

##### Hardware requirements (recommended)

*	Any Mac running OS 10.10 or newer.

##### Tracking multiple faces
As of v3.0, the SDK exposes a parameter `max_faces` in the detectors constructor to specify the maximum number of faces to look for in an image. For the realtime use cases, to achieve a high accuracy and processing throughput (20+ processed frames per second), the SDK requires a CPU thread per face.

On a recent dual core machine, we can track up to 3 people in parallel with all the facial expressions, emotions and appearance metrics enabled.

If the number of faces tracked is greater than the number of available CPU threads on the machine, they will all be tracked, but at a cost of the processing frame rate. Therefore, make sure to plan for providing enough hardware power for the number of faces they are expecting to track with each camera.


##### Requirements

The SDK also depends on the following OS X frameworks. Be sure to include these libraries in your app's Xcode project settings:

* CoreMedia.framework
* AVFoundation.framework
* CoreVideo.framework
