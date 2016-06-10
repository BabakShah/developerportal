---
title: What's new in this release
permalink: /whats_new/
tags: [sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

This page contains the release notes for the different versions of the Affdex SDK(s).


### Affdex SDK version 3.1
* Win SDK
  - Improved emotion metrics. The valence includes new expressions in its calculation.
  - Added models for classifying [ethnicity](/metrics#appearance) and estimating [age range](/metrics#appearance).

***

### Affdex SDK version 3.0.2
* OSX SDK
  - Performance optimizations, [SDK-521](https://affectiva.atlassian.net/browse/SDK-521) - remove dispatch_async() overhead from callback functions.

***

### Affdex SDK version 3.0.1
* New platforms [OS X](/osx) and [Linux](/linux).
* Android
  - Switch the SDK packaging to the new android standard packaging (aar).
* iOS SDK
  - Fix bug [SDK-1](https://affectiva.atlassian.net/browse/SDK-1) - iOS Framework builds v3.0 are much bigger in size than v2.0.
  - Fix bug [SDK-38](https://affectiva.atlassian.net/browse/SDK-38) - iOS device Framework contains i386 and x86_64 architectures.
  - Fix bug [SDK-404](https://affectiva.atlassian.net/browse/SDK-404) - didStopDetectingFace: can pass nil for the face parameter.

***

### Affdex SDK version 3.0

* New API to allow tracking of multiple faces simultaneously.
* Added a Face to Emoji mapper to allow the developer to map facial expressions of emotion to [13 emojis](/metrics#emoji-expressions) different emojis
* New API that returns the most likely emoji (`dominantEmoji`) posed in an image
* Added models to allow identification of [gender and presence of eyeglasses or sunglasses](/metrics#appearance)
* New API that allows the developer to control the face detector configuration to use in the detection
* Added dynamic core detection to allow SDKs to make use of multiple CPU cores if available
* New Getting Started tutorials on the Developer Portal
* New version of the AffdexMe apps ([iOS](https://github.com/Affectiva/ios-sdk-samples/tree/master/apps/AffdexMe), [Android](https://github.com/Affectiva/affdexme-android) and [Windows](https://github.com/Affectiva/win-sdk-samples/tree/master/AffdexMe)):
  - Track multiple faces in realtime
    On Windows this feature is enabled by default, but on iOS/Android it can be toggled from the settings menu.  
  - Display the metrics for Facial Expression, Emotion, Appearance and Dominant Emoji
  - Allow users to take screenshots of the camera feed with the metrics overlay
  - Allow users to use the back camera to track the metrics
  - Optimize AffdexMe (Windows) metric and camera visualization class
* iOS SDK
  - `AFDXFace` class re-organized into categories expressions, emotions, emoji and appearance
  - `Expressiveness` renamed into `Engagement`
  - Head angles renamed `HeadUpDown`, `HeadLeftRight`, `HeadRoll` to `Pitch`, `Yaw`, `Roll`
  - Added API to allow embedding the license string as a variable in the app code
* Win SDK
  - Performance improvements
  - Fixed bug: The assembly version doesn't match the file metadata
  - Fixed bug: Calling reset() doesn't reset the internal cached timestamps.
* Android SDK
  - Fixed bug: the license token validation fails due to zero padding

***

### Affdex SDK version 2.0

* Dramatically improved accuracy with new expression models trained over a broader set of facial images.

* Better ease of use and accessibility by standardizing models for seven
emotions:
  Anger, Sadness, Disgust, Joy, Surprise, Fear and Contempt.
* New facial expressions, including very
nuanced expressions that are difficult even for the human eye to detect:

    Attention, Brow Furrow, Brow Raise, Inner Brow Raise, Eye Closure, Nose Wrinkle, Upper Lip Raise, Lip Suck, Lip Pucker, Lip Press, Mouth Open, Lip Corner Depressor, Chin Raise, Smirk, Smile.
* 3D head orientation metrics

    Left/Right, Up/Down, Roll

* Supports the development of 64-bit applications for Windows.
* New Developer Portal with documentation and source code for sample apps, including the flagship AffdexMe demo app.
