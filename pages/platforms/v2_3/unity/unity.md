---
title: Affdex SDK for Unity
permalink: /v2_3/unity/
redirect_from: "/unity/"
tags: [unity, sdk, asset]
audience: writer, designer
keywords:
last_updated:
summary:
---
{% include linkrefs.html %}

<img src="{{ "/images/unity.png" | prepend: site.baseurl }}" align="right" style="max-width: 6em;">

SDK Developer Guide Release 2.3.x

## Using the SDK

The purpose of the SDK is to detect facial expressions and their underlying emotions, and appearance from facial images. The SDK is distributed as a Unity package. Its included files enable integration with Unity games and applications. These two data folders are required by Unity:

* **Affdex:** C# code and required libraries.
* **StreamingAssets:** The classifier data files required by the libraries.

Watch the video tutorial below to help you get started on how to use the SDK:
<iframe width="100%" height="400px" src="https://www.youtube.com/embed/e7N88nLllzk" frameborder="0" allowfullscreen></iframe>

***

## Getting started

We package our plugin as an asset, like those you can buy on Unity's Asset Store.  You can download it from below.  

{% include custom/download_link.html build_version="2.3" platform="unity" %}

The purpose of the asset is to detect facial expressions and their underlying emotions from facial images. Facial images can be captured from different sources:  

*   Camera: images from the webcam (or front camera for mobile devices)
*   Frames: a sequence of timed images.
*   Video: a video file on a device's local storage.

The SDK's Detector class implements the core detection functionality, and can be used in any of these three scenarios, although the steps are a bit different in each case.

* [How to analyze a camera feed]({{ site.baseurl }}/v2_3/unity/analyze-camera/)
* [How to analyze a recorded video file]({{ site.baseurl }}/v2_3/unity/analyze-video/)
* [How to analyze a video frame stream]({{ site.baseurl }}/v2_3/unity/analyze-frames/)

## Samples
There are several example Unity apps available on GitHub which you can examine to see the SDK in action:

* [EmoSurvival - An emotion adaptive demo built onto Unity's survival shooter training day](https://github.com/Affectiva/UnityChan)
* [Unity-chan - An emotion mimicry demo](https://github.com/Affectiva/UnityChan)
* [The Labryinth of Emotions - A game made at the Emotion Lab 16 Hackathon](https://github.com/Art-Wolf/emotionlabs16)

## Class Documentation
The classes that come with this asset are viewable [here](/pages/platforms/v2_3/unity/AffdexUnityHelp/index.html).  

## Requirements & Dependencies

<em><strong>Hardware requirements (recommended)</strong></em>

*   Processor, 2 GHz (64-bit)
*   RAM, 1 GB
*   Disk Space (min) : 950 MB

<em><strong>Runtime Requirements</strong></em>

* [Unity 5](http://unity3d.com/get-unity)
* [Visual Studio 14+](https://www.visualstudio.com/) or Xamarin Studio
* [QuickTime Movie Player](http://www.apple.com/quicktime/download/)
* Visual C++ Redistributable runtime for VS 2013


<em><strong>Supported operating systems</strong></em>

*   Windows 7 and above
*   Mac OS X 10.9.5 and above
*   Android 4.3 and above
*   iOS 8.0 and above


## Special Notes

This section outlines issues you may encounter depending on how you use the plugin.

### Builds

* If you build for multiple platforms and want to no-op unsupported platforms you can run <code>AffdexUnityUtils.ValidPlatform()</code> to determine if the current platform is valid at run-time.
* OS X builds only work as universal and x86_64 binaries.
* Building Android apps in Unity requires installation of the [Android SDK](https://docs.unity3d.com/Manual/android-sdksetup.html).


### Apple App Store Submission

The Apple app store has a rigorous set of automated tests it runs on submissions to validate that applications meet their guidelines.  They will specifically expect certain parts of your game to be signed using a certification authority.  All files that need to be signed must be signed using the same signature authority.  This means that you as an individual, or your company, will need a signing certificate for not only your files, but for the files that come from Affectiva.  If the Affectiva files are signed by Affectiva and your other game files are signed by you, your submission will be rejected by the app store.  

The order in which files and bundles are signed is also critical.  You must sign the inner-most files first.  Here is a <a href="http://stackoverflow.com/questions/7697508/how-do-you-codesign-framework-bundles-for-the-mac-app-store/11284404#11284404">Stack Overflow answer</a> that includes a shell script that signs in the proper order.
