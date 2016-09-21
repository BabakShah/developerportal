---
title: Affdex SDK for Android
permalink: /v3_1/android/
tags: [android, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

{% include linkrefs.html %}

SDK Developer Guide Release 3.1

## Using the SDK

The SDK is distributed as an Android ".aar" archive. It can be included in an app by declaring a dependency on the SDK in the app's build.gradle file.

##### 1. Add Affectiva's repository as a repository for your application.  This tells gradle that it should scan the Affectiva software distribution site for the app's dependencies.  Add a declation to the app's root build.gradle file:
```groovy
allprojects {
    repositories {
        maven {
            url "http://maven.affectiva.com"
        }
        ...
    }
}
```
For an example please see the [AffdexMe sample app's top-level build.gradle file](https://github.com/Affectiva/affdexme-android/blob/master/build.gradle#L15-L19).

##### 2. Add a dependency declaration to your app's build.gradle file.  This will pick up the most recent bug fix release in the 3.0 series.
```groovy
dependencies {
    ...
    compile 'com.affectiva.android:affdexsdk:3.1'
    ...
}
```
For an example please see the [AffdexMe sample app's app-level build.gradle file](https://github.com/Affectiva/affdexme-android/blob/master/app/build.gradle#L40).

##### 3. Add a few necessary declarations to your app's manifest. Therefore, the ```AndroidManifest.xml``` needs to include the following permissions:

First, the SDK requires access to external storage on the Android device.

```xml
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

Also, the SDK uses access to the internet to [communicate anonymized usage data]({{ site.baseurl }}/datacollection).

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```

Additionally, if you use the `CameraDetector`, then you will need to add permission to access the camera:

```xml
<uses-permission android:name="android.permission.CAMERA" />
```

Second, the SDK is required by Android's packaging system to declare a couple of parameters, android:allowBackup and android:label, that you may want to override.  To do this, add the "tools" namespace to your manifest's document element:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    ...
```

The add a "tools:replace" attribute to the "application" element:

```xml
    <application
        tools:replace="android:allowBackup,android:label"
        ...
```

You can then add your own "allowBackup" and "label" attributes:

```xml
    <application
        ...
        android:allowBackup="false"
        ...
        android:label="@string/app_name">
```

##### 4. Capture and analyze faces

Facial images can be captured from different sources. For each of the different sources, the SDK defines a detector class that can handle processing images acquired from that source:  

* [How to analyze a camera feed]({{ site.baseurl }}/v3/android/analyze-camera/)
* [How to analyze a recorded video file]({{ site.baseurl }}/v3/android/analyze-video/)
* [How to analyze a video frame stream]({{ site.baseurl }}/v3/android/analyze-frames/)
* [How to analyze a photo]({{ site.baseurl }}/v3/android/analyze-photo/)

##### 5. Check out sample applications on GitHub
Sample applications for processing videos, and connecting to the camera are available for cloning on our [GitHub repository.](http://github.com/Affectiva/android-sdk-samples)

## Class documentation
* class docs: [[HTML]({{ site.baseurl }}/pages/platforms/v3/android/javadoc/index.html)]

## Requirements & Dependencies

##### Hardware requirements (recommended)

*	Processor, Quad-core 1.5 GHz Cortex-A53
*	RAM, 1 GB

##### Tracking multiple faces
As of v3.0, the SDK exposes a parameter `max_faces` in the detectors constructor to specify the maximum number of faces to look for in an image. For the realtime use cases, to achieve a high accuracy and processing throughput (20+ processed frames per second), the SDK requires a CPU thread per face.

On a recent dual core machine, we can track up to 3 people in parallel with all the facial expressions, emotions and appearance metrics enabled.

If the number of faces tracked is greater than the number of available CPU threads on the machine, they will all be tracked, but at a cost of the processing frame rate. Therefore, make sure to plan for providing enough hardware power for the number of faces they are expecting to track with each camera.

##### Requirements

* A device running Android API 16 or above.
* Java 1.7 or above is required on your development machine.

##### Supported operating systems

*	Android 4.4 and above
