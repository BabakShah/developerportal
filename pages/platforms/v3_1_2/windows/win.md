---
title: Affdex SDK for Windows
permalink: /v3_1_2/windows/
redirect_from: "/windows/"
tags: [windows, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
{% include linkrefs.html %}

SDK Developer Guide Release 3.1.2

## Using the SDK

The purpose of the SDK is to detect facial expressions and their underlying emotions, appearance and emojis from facial images. The SDK is distributed as a Installer. Its included assemblies enable integration with .NET and C++ Windows applications and the data folder required by API in runtime:

* **affdex-native:** C++ Namespace headers and library files (the Release and Debug versions).
* **Affdex:** .NET Namespace assembly (the Release and Debug versions).
* **data:** The classifier data files required by both affdex-native and Affdex libraries runtime.

## Video Tutorial
<iframe width="100%" height="400px" src="https://www.youtube.com/embed/olRx-LG9YRk?list=PL4uhb2yWZJbytOZkYxMlsuYUp_jP6ygG5" frameborder="0" allowfullscreen></iframe>

## Getting started

##### 1. Download and run the SDK installer

Click on the download link from the table for the desired architecture:

{% include custom/download_link.html build_version="3.1.2-" platform="windows" %}

##### 2. Import an affdex API into your application

&nbsp;&nbsp;&nbsp;&nbsp;**For a C++ Application:** [Configure your project to use the affdex-native library.](https://en.wikibooks.org/wiki/C%2B%2B_Programming/Compiler/Linker/Libraries/Configuring_Visual_Studio)

&nbsp;&nbsp;&nbsp;&nbsp;**For a .NET Application:** [Add the Affdex assembly to your project.](https://msdn.microsoft.com/en-us/library/wkze6zky.aspx)

&nbsp;&nbsp;&nbsp;&nbsp;The .NET assembly depends on the affdex-native.dll and loads it in runtime.

&nbsp;&nbsp;&nbsp;&nbsp;A dynamic library, ```opencv_ffmpeg.dll``` is required by VideoDetector [[c++]({{ site.baseurl }}/pages/platforms/v3_1_1/cpp/classdocs/affdex-native/classaffdex_1_1_video_detector.html)], [[c#]({{ site.baseurl }}/pages/platforms/v3_1_2/windows/classdocs/Affdex/html/6e4b1996-68bf-4750-439a-731c2be17537.htm)] in runtime for the video decoding.

##### 3. Capture and analyze faces

Facial images can be captured from different sources. For each of the different sources, the SDK defines a detector class that can handle processing images acquired from that source:

* [How to analyze a camera feed]({{ site.baseurl }}/v3_1_2/windows/analyze-camera/)
* [How to analyze a recorded video file]({{ site.baseurl }}/v3_1_2/windows/analyze-video/)
* [How to analyze a video frame stream]({{ site.baseurl }}/v3_1_2/windows/analyze-frames/)
* [How to analyze a photo]({{ site.baseurl }}/v3_1_2/windows/analyze-photo/)

##### 4. Check out sample applications on GitHub
Sample applications for processing videos, and connecting to the camera are available for cloning on our [GitHub repository.](http://github.com/Affectiva/cpp-sdk-samples)

##### 5. Check out [AffdexMe](https://download.affectiva.com/windows/AffdexMe-1106-win32.exe)
AffdexMe is an open source application that demonstrates the use of the Affdex SDK. It uses the camera connected to your device to view, process and analyze live video of your face. Start the app and you will see your own face on the screen, and metrics describing your facial expression of emotion.

## Class documentation
* .NET (C#) Namespace: [[HTML]({{ site.baseurl }}/pages/platforms/v3_1_2/windows/classdocs/Affdex/index.html)]
* C++ Namespace: [[HTML]({{ site.baseurl }}/pages/platforms/v3_1_1/cpp/classdocs/affdex-native/namespaceaffdex.html)]

## Requirements & Dependencies

##### Hardware requirements (recommended)

*	Processor, 2 GHz
*	RAM, 1 GB
*	Disk Space (min) : 950 MB

##### Tracking multiple faces
As of v3.1, the SDK exposes a parameter `max_faces` in the detectors constructor to specify the maximum number of faces to look for in an image. For the realtime use cases, to achieve a high accuracy and processing throughput (20+ processed frames per second), the SDK requires a CPU thread per face.

On a recent dual core machine, we can track up to 3 people in parallel with all the facial expressions, emotions and appearance metrics enabled.

If the number of faces tracked is greater than the number of available CPU threads on the machine, they will all be tracked, but at a cost of the processing frame rate. Therefore, make sure to plan for providing enough hardware power for the number of faces they are expecting to track with each camera.

##### Runtime Requirements

*	[Visual C++ Redistributable runtime for VS 2013](https://www.microsoft.com/en-us/download/details.aspx?id=40784)
*	Microsoft .NET framework v 4.0 (.NET SDK only)

The software runtime requirements are installed automatically by the SDK installer.

##### Supported operating systems

*	Windows 7 and above
