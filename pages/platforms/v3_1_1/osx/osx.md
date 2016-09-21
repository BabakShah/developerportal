---
title: Affdex SDK for macOS
permalink: /v3_1_1/osx/  
redirect_from: "/macos/"
tags: [osx, sdk]  
audience: writer, designer  
keywords:  
last_updated:  
summary:  
metadata: false
---

{% include linkrefs.html %}

SDK Developer Guide Release 3.1.1

## Getting started

__The Affdex SDK for macOS is distributed as a [CocoaPod](https://cocoapods.org/pods/AffdexSDK-OSX). If you do not have CocoaPods installed on your Mac, please install it using the instructions in the [CocoaPods Getting Started Guide](https://guides.cocoapods.org/using/getting-started.html).__

#### 1. Create a Podfile

After you have installed CocoaPods on your Mac, create a file named "Podfile" in your project directory.  This is the directory which contains the .xcodeproj and/or .xcworkspace files for your project.  The Podfile is a plain-text file which describes the framework and library dependencies that your project contains.  Installing the pod file will load and configure the Affdex SDK framework for use with your project.

Place the following text into your Podfile, substituting your app name for the 'MyApp' target:

```
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target 'MyApp' do
    pod 'AffdexSDK-OSX'
end
```

#### 2. Install the Affdex SDK CocoaPod

With the Podfile created, run the following commands from the Terminal application:

```
pod repo update
pod install
```

This will install the SDK and support pods into the Pods folder, and will create or update the Xcode workspace file to support building from the pods.  Make sure to open the .xcworkspace file in Xcode instead of the .xcodeproj file from this point onwards.  You can now build and run the project on your Mac from Xcode.

After you run `pod install` your app will be linked to the most recent release of the Affdex SDK, although you can also configure your Podfile to install a specific version of the SDK if you choose.  Your project will continue to use this version even if newer versions of the SDK are released.  Use the `pod update` command to update to newer SDK releases as they become available.

#### 3. Capture and analyze faces

Facial images can be captured from different sources. For each of the different sources, the SDK defines a detector class that can handle processing images acquired from that source:

* [Analyze a camera feed]({{ site.baseurl }}/v3_1_1/osx/analyze-camera/)
* [Analyze a recorded video file]({{ site.baseurl }}/v3_1_1/osx/analyze-video/)
* [Analyze a video frame stream]({{ site.baseurl }}/v3_1_1/osx/analyze-frames/)
* [Analyze a photo]({{ site.baseurl }}/v3_1_1/osx/analyze-photo/)

## Going Further
__There are additional sample applications for processing videos and connecting to the camera available for cloning on our [GitHub repository.](https://github.com/Affectiva/affdexme-osx)__

## Reference
* class docs: [[HTML]({{ site.baseurl }}/pages/platforms/v3_1_1/ios/classdocs/annotated.html)]

## Requirements & Dependencies

#### Hardware requirements (recommended)

*	Any Mac capable of running OS X Yosemite (10.10) or newer.

#### Tracking multiple faces
As of v3.0.0, the SDK exposes a parameter `max_faces` in the detector constructors to specify the maximum number of faces to look for in an image. For the real-time use cases, to achieve a high accuracy and processing throughput (20+ processed frames per second), the SDK uses a separate CPU thread for each face, which increases the total processing load on the system based on how many faces are being tracked.

If the number of faces exceeds the number of available processing units on the machine, all faces will be tracked, but at a cost of a potential reduction in processing frame rate. Therefore, please make sure to plan for enough hardware power to support the maximum number of faces you are expecting to track with each camera.

Although you can run more than one processing thread per CPU core, throughput will be improved on machines with more cores.  On a recent dual-core machine, we can track up to 3 people in parallel with all facial expressions, emotions and appearance metrics enabled.  Processor load can be reduced by tracking fewer metrics, so enable only the metrics you need for best performance.

#### Supported operating systems

*	OS X El Capitan (10.11)
*	OS X Yosemite (10.10)
