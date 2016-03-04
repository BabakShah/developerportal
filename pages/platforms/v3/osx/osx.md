---
title: Affdex SDK for OS X  
permalink: /v3/osx/  
redirect_from: "/osx/"
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

##### 4. Check out sample applications on GitHub
Sample applications for processing videos, and connecting to the camera are available for cloning on our [GitHub repository.](http://github.com/Affectiva/osx-sdk-samples)


## Requirements & Dependencies

##### Hardware requirements (recommended)

*	Any Mac running OS 10.10 or newer.

##### Tracking multiple faces (BETA)
As of v3.0, the SDK exposes a parameter `max_faces` in the detector's constructor to specify the maximum number of faces to look for in an image. To achieve high accuracy and processing throughput for realtime use cases, we recommend using a framerate of 5 processed frames per second.  

If the number of faces tracked is greater than the number of available CPU threads on the device, they will all be tracked, but at a cost of the processing frame rate.


##### Requirements

The SDK also depends on the following OS X frameworks. Be sure to include these libraries in your app's Xcode project settings:

* CoreMedia.framework
* AVFoundation.framework
* CoreVideo.framework