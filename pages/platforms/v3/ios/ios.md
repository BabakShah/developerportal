---
title: Affdex SDK for iOS  
permalink: /v3/ios/  
redirect_from: "/ios/"
tags: [ios, sdk]  
audience: writer, designer  
keywords:  
last_updated:  
summary:  
metadata: false
---

{% include linkrefs.html %}

SDK Developer Guide Release 3.0

## Using the SDK

The purpose of the SDK is to detect facial expressions and their underlying emotions (along with appearance and emojis) from facial images. The SDK is distributed as a group of frameworks:

* **Framework_Device/Affdex.framework** Framework for armv7 and arm64 device targets. It should be used for apps submitted to the App Store.
* **Framework_Simulator/Affdex.framework:** Framework for i386 and x86_64 simulator targets. It should be used with apps to be run on the simulator.
* **Framework_Universal/Affdex.framework:** Framework for both device and simulator targets. It should be used to test the app binary to be run on both the simulator and on a device.

{{ note }}The size of the Affdex iOS SDK framework has increased in version 3.0 significantly due to the inclusion of bitcode. 
Bitcode is a new requirement from Apple for iOS apps that support watchOS and tvOS. This size increase will not be reflected in apps that link to the framework and are submitted to the App Store. {{ end }} 

## Getting started

##### 1. [Download]({{ site.baseurl }}/downloads/) and extract the archives

##### 2. Import the Affdex API into your application
* Choose the appropriate framework for your specific development situation (Device, Simulator, or Universal)
* Your code must include the Objective-C header file `Affdex/Affdex.h`

##### 3. Capture and analyze faces

Facial images can be captured from different sources. For each of the different sources, the SDK defines a detector class that can handle processing images acquired from that source:

* [Analyze a camera feed]({{ site.baseurl }}/v3/ios/analyze-camera/)
* [Analyze a recorded video file]({{ site.baseurl }}/v3/ios/analyze-video/)
* [Analyze a video frame stream]({{ site.baseurl }}/v3/ios/analyze-frames/)
* [Analyze a photo]({{ site.baseurl }}/v3/ios/analyze-photo/)

##### 4. Check out sample applications on GitHub
Sample applications for processing videos, and connecting to the camera are available for cloning on our [GitHub repository.](http://github.com/Affectiva/ios-sdk-samples)

## Reference
* class docs: [[HTML]({{ site.baseurl }}/pages/platforms/v3/ios/classdocs/annotated.html)]


## Requirements & Dependencies

##### Hardware requirements (recommended)

*	iPad Air or above
*	iPhone 5s or above

##### Tracking multiple faces (BETA)
As of v3.0, the SDK exposes a parameter `max_faces` in the detector's constructor to specify the maximum number of faces to look for in an image. To achieve high accuracy and processing throughput for realtime use cases, we recommend using a framerate of 5 processed frames per second.  


On a recent dual core device, we can track up to 2 people in parallel with all the facial expressions, emotions and appearance metrics enabled.

If the number of faces tracked is greater than the number of available CPU threads on the device, they will all be tracked, but at a cost of the processing frame rate.

*Multiface tracking requires (iPad Air 2 / iPhone 6) or above.*

##### Requirements

The SDK also depends on the following iOS frameworks. Be sure to include these libraries in your app's Xcode project settings:

* AudioToolbox.framework
* CoreMedia.framework
*	AVFoundation.framework
* CoreVideo.framework
* QuartzCore.framework
* CoreImage.framework
* CoreGraphics.framework
* UIKit.framework
* Foundation.framework
* SystemConfiguration.framework
* AssetsLibrary.framework
* libc++.dylib

##### Supported operating systems

*	iOS 8 and above