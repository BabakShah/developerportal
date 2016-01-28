---
title: Affdex SDK for Android
permalink: /v3/android/
redirect_from: "/android/"
tags: [android, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

{% include linkrefs.html %}

SDK Developer Guide Release 3.0

## Using the SDK

The purpose of the SDK is to detect facial expressions and their underlying emotions, appearance and emojis from facial images. The SDK is distributed as an archive. It includes assemblies enables integration with android application applications and the assets required by API in runtime:

* **libs:** The Affdex jar file and it's dependency jars (dagger and javax.inject).
* **jniLibs:** Native binaries used by the Affdex jar.
* **src/main/assets:** The classifiers data files required by the Affdex library in runtime.

## Getting started

##### 1. [Download]({{ site.baseurl }}/downloads/) and extract the SDK archive.
##### 2. Import the Affdex API into your application
* Copy the contents of the libs folder into your libs folder under ```app/libs```
* Copy the contents of the ```src/main/assets``` folder into your app assets folder under ```app/src/main/assets```
* Copy the jniLibs folder to your app to your app under ```app/```

 The SDK requires access to external storage on the Android device. Therefore, the ```AndroidManifest.xml``` needs to include permission for that it:

 ```xml
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
 ```

Additionally, if you use the `CameraDetector`, then you will need to add permission to access the camera:

```xml
<uses-permission android:name="android.permission.CAMERA" />
```

##### 3. Capture and analyze faces

Facial images can be captured from different sources. For each of the different sources, the SDK defines a detector class that can handle processing images acquired from that source:

* [How to analyze a camera feed]({{ site.baseurl }}/v3/android/analyze-camera/)
* [How to analyze a recorded video file]({{ site.baseurl }}/v3/android/analyze-video/)
* [How to analyze a video frames feed]({{ site.baseurl }}/v3/android/analyze-frames/)
* [How to analyze a photo]({{ site.baseurl }}/v3/android/analyze-photo/)

##### 3. Checkout Sample applications on GitHub
Sample applications for processing videos, and connecting to the camera are available for cloning on our [GitHub repository.](http://github.com/Affectiva/android-sdk-samples)

## Class documentation
* class docs: [[HTML]({{ site.baseurl }}/pages/platforms/v3/android/javadoc/index.html)]

## Requirements & Dependencies

##### Hardware requirements (recommended)

*	Processor, Quad-core 1.5 GHz Cortex-A53
*	RAM, 1 GB

##### Tracking multiple faces (BETA)
As of v3.0, the SDK exposes a parameter max_faces in the detectors constructor to specify the maximum number of faces to look for in an image. For the realtime use cases, to achieve a high accuracy and processing throughput (5+ processed frames per second), the SDK requires a cpu thread per face.

A recent dual core device, we can track up to 2 people in parallel with all the facial expressions, emotions and appearance metrics enabled.

If number of faces tracked is greater than the number of available cpu threads on the device, they will all be tracked, but at a cost of the processing frame rate.

##### Requirements

* A device running Android API 16 or above.
* Java 1.7 or above is required on your development machine.

##### Supported operating systems

*	Android 4.4 and above
