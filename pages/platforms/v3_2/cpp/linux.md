---
title: Affdex SDK for Linux
permalink: /v3_2/linux/
tags: [cpp, linux, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
{% include linkrefs.html %}

SDK Developer Guide Release 3.2

## Using the SDK

The purpose of the SDK is to detect facial expressions and their underlying emotions, appearance and emojis from facial images. The SDK is distributed as a tarball. Its included assemblies enable integration with C++ applications and the data folder required by API in runtime:

* **affdex-native:** C++ Namespace headers and library files.
* **data:** The classifier data files required by both affdex-native and Affdex libraries runtime.

Watch the video tutorial below to help you get started on how to use the SDK:
<iframe width="100%" height="400px" src="https://www.youtube.com/embed/8tSx3xlWNnc" frameborder="0" allowfullscreen></iframe>

***

## Getting started

##### 1. Download and extract the SDK archive

Click on the download link from the table for the desired architecture:

{% include custom/download_link.html platform="linux" build_version="3.2-" %}

**For ARM Architecture:** A beta build of SDK for ARM architecture [is now available]({{ site.baseurl }}/v3_1/linux/arm/). Use it to build apps for embedded platforms such as raspberry pi.

***

Extract the archive:

```bash
mkdir $HOME/affdex-sdk
tar -xzvf affdex-cpp-sdk-3.2-2893-linux-64bit.tar.gz -C $HOME/affdex-sdk
```

##### 2. Installing the runtime dependencies

To compile in Linux, you must have the header files for libcurl, libopenssl, and libuuid. The packages are typically available in your package manager.

Ubuntu : ```sudo apt-get install libcurl-dev uuid-dev```

CentOS : ``` sudo yum install libcurl-devel.x86_64 libuuid-devel.x86_64```

##### 3. Import an affdex API into your application

The tarball includes the header and library files that will be needed by your application. Amend your application compilation process to define the location of the affdex-sdk "include" and "lib" directories.

For example, main.cpp initializes an instance of ```affdex::FrameDetector```

```cpp
#include "FrameDetector.h"

int main(int argc, char ** argsv)
{
  affdex::FrameDetector(1);
  return 0;
}
```

To compile main.cpp file.

```bash
export LD_LIBRARY_PATH=$HOME/affdex-sdk/lib
g++ main.cpp -o main -std=c++11 -I$HOME/affdex-sdk/include -L$HOME/affdex-sdk/lib -l affdex-native

```

For more complex applications, you might want to use CMake to generate the makefiles for compiling your application. An example of how to configure CMake can be found [here](https://github.com/Affectiva/win-sdk-samples/blob/master/CMakeLists.txt#L99).

In addition to libaffdex-native.so, the SDK lib folder contains [FFmpeg libraries](https://www.ffmpeg.org/) which are required by the VideoDetector [[c++]({{ site.baseurl }}/pages/platforms/v3_2/cpp/classdocs/affdex-native/classaffdex_1_1_video_detector.html)] in runtime for the video decoding. FFmpeg is an open source library for video decoding [licensed under LGPL]({{ site.baseurl }}/licenses/). Also, the SDK uses access to the internet when available to [communicate anonymized usage data]({{ site.baseurl }}/datacollection).

##### 4. Capture and analyze faces

Facial images can be captured from different sources. For each of the different sources, the SDK defines a detector class that can handle processing images acquired from that source:

* [How to analyze a camera feed]({{ site.baseurl }}/v3_2/cpp/analyze-camera/)
* [How to analyze a recorded video file]({{ site.baseurl }}/v3_2/cpp/analyze-video/)
* [How to analyze a video frame stream]({{ site.baseurl }}/v3_2/cpp/analyze-frames/)
* [How to analyze a photo]({{ site.baseurl }}/v3_2/cpp/analyze-photo/)

##### 5. Check out sample applications on GitHub
Sample applications for processing videos and connecting to the camera are available for cloning on our [GitHub repository.](http://github.com/Affectiva/cpp-sdk-samples)

## Class documentation
* C++ Namespace: [[HTML]({{ site.baseurl }}/pages/platforms/v3_2/cpp/classdocs/affdex-native/namespaceaffdex.html)]

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

*	GLIBC 3.4
* GLIBCXX 3.4.9
* GCC v4.8
* libcurl
* libopenssl
* libuuid

##### Supported operating systems

*	Ubuntu 14.04 and above
* CentOS 7 and above
