---
title: What's new
permalink: /whats_new/
tags: [sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

This page contains the release notes for the different versions of the Affdex SDK(s).

---

***Apr 2017***

##### Linux SDK 3.3
* Fix bug - shared state affecting initialization of multiple detectors
* Fix bug - reduced memory usage in long running sessions


##### Windows SDK 3.4.1
* Fix bug - shared state affecting initialization of multiple detectors
* Fix bug - reduced memory usage in long running sessions

---

***Feb 2017***

##### Web SDK 3.2
* Revised Nose Wrinkle and Smirk models to lower their false positive rates
* Updated Valence model to recalibrate the low Valence range
* Updated Expressiveness to use the new Nose Wrinkle model
* Updated Fear, Surprise, Anger, Disgust, Sadness, and Contempt emotions to include latest expression models

##### Windows SDK 3.4
* Added data collection APIs. See documentation for [[enableAnalytics()]({{site.baseurl}}/pages/platforms/v3_4/windows/classdocs/affdex-native/classaffdex_1_1_detector.html#af54e0259e824d4425db980546b374497)] and [[disableAnalytics()]({{site.baseurl}}/pages/platforms/v3_4/windows/classdocs/affdex-native/classaffdex_1_1_detector.html#aaac2694f11b4a4308de6f8e3a1127ad7)]

##### Linux SDK 3.2
* Added data collection APIs. See documentation for [[enableAnalytics()]({{site.baseurl}}/pages/platforms/v3_2/cpp/classdocs/affdex-native/classaffdex_1_1_detector.html#af54e0259e824d4425db980546b374497)] and [[disableAnalytics()]({{site.baseurl}}/pages/platforms/v3_2/cpp/classdocs/affdex-native/classaffdex_1_1_detector.html#aaac2694f11b4a4308de6f8e3a1127ad7)]

---

***Jan 2017***

##### Android SDK 3.2
* Added support for “brightness” metric to measure the face lighting condition. See documentation for [[qualities]({{ site.baseurl }}/pages/platforms/v3_2/android/javadoc/com/affectiva/android/affdex/sdk/detector/Face.html#qualities)] field in [[Face]({{ site.baseurl }}/pages/platforms/v3_2/android/javadoc/com/affectiva/android/affdex/sdk/detector/Face.html)] class
* Revised Nose Wrinkle and Smirk models to lower their false positive rates
* Updated Valence model to recalibrate the low Valence range
* Updated Expressiveness to use the new Nose Wrinkle model
* Updated Fear, Surprise, Anger, Disgust, Sadness, and Contempt emotions to include latest expression models
* Fixed bug [SDK-1053](https://affectiva.atlassian.net/browse/SDK-1053) - analytics frame records' timestamps should follow detector-specific rules
* Fixed bug [SDK-1003](https://affectiva.atlassian.net/browse/SDK-1003) - SDK should still send start/stop analytics records for non-empty sessions when analytics are disabled
* Fixed bug [SDK-529](https://affectiva.atlassian.net/browse/SDK-529) - native crash if Detector's process method() is called after stop()

##### Windows SDK 3.3

* Added support for "brightness" metric to measure the face lighting condition. See documentation for faceQuality field in Face class [[c++]({{ site.baseurl }}/pages/platforms/v3_3/windows/classdocs/affdex-native/classaffdex_1_1_face.html)], and FaceQuality property in Face class [[c#]({{ site.baseurl }}/pages/platforms/v3_3/windows/classdocs/Affdex/html/6ba06b80-e3de-63ab-3985-5555663602f7.htm)]

##### Windows SDK 3.2

* Revised Nose Wrinkle and Smirk models to lower their false positive rates
* Updated Valence model to recalibrate the low Valence range
* Updated Expressiveness to use the new Nose Wrinkle model
* Updated Fear, Surprise, Anger, Disgust, Sadness, and Contempt emotions to include latest expression models


---

***Nov 2016***

##### Windows SDK 3.1.2

* Fixed bug [SDK-763](https://affectiva.atlassian.net/browse/SDK-763) - Added the RGBA, BGRA, YUV_NV21, YUV_I420, YUV_YUY2 color formats for the enum in Frame class

---

***Oct 2016***

##### Unity SDK 2.3

* Added iOS support

---

***Sep 2016***

##### Unity SDK 2.2.1

* Android: Updated the libpng version used in the native library to address a security vulnerability

##### Android SDK 3.1.2

* Updated the libpng version used in the native library to address a security vulnerability

##### Windows/Linux/Android SDK 3.1.1

* Removed license-related methods. A license file is no longer required to use the SDK.

##### iOS/macOS SDK 3.1.1

* Removed license-related methods. A license file is no longer required to use the SDK.
* API allows developer to choose face detector's face size configuration (SMALL / LARGE)

---

***Aug 2016***

##### Unity SDK 2.2

* Added Android support.
* Frame constructor can now accept a rotation angle of 0, 90, 180, and 270.
* Detector.Initialize is now private because it is called automatically by Detector.Start
* Detector.Stop has been deprecated in favor of Detector.StopDetector

---

***Jul 2016***

##### Windows/Linux/Android SDK 3.1

* Improved emotion metrics. The valence includes new expressions in its calculation.
* Added models for classifying [ethnicity](/metrics#appearance) and estimating [age range](/metrics#appearance).
* Added models for new [expressions](/metrics#facial-expressions): cheek raise, dimpler, eye widen, lid tighten, lip stretch and jaw drop.
* Fixed bug [SCI-86](https://affectiva.atlassian.net/browse/SCI-86) - Disgust false positives due to the occurrence of the smile expression.

##### Web SDK 3.1

* First release of our JavaScript-based SDK to emotion-enable [Web](/web) apps.

---

***May 2016***

##### macOS SDK 3.0.2

* Performance optimizations, [SDK-521](https://affectiva.atlassian.net/browse/SDK-521) - remove dispatch_async() overhead from callback functions.

---

***Mar 2016***

##### macOS SDK 3.0.1

* First release of our Affdex SDK for the [OS X](/macos) platform.

##### Android SDK 3.0.1

* Switch the SDK packaging to the new Android standard packaging (aar).

##### iOS SDK 3.0.1

* Fixed bug [SDK-1](https://affectiva.atlassian.net/browse/SDK-1) - iOS Framework builds v3.0 are much bigger in size than v2.0.
* Fixed bug [SDK-38](https://affectiva.atlassian.net/browse/SDK-38) - iOS device Framework contains i386 and x86_64 architectures.
* Fixed bug [SDK-404](https://affectiva.atlassian.net/browse/SDK-404) - didStopDetectingFace: can pass nil for the face parameter.

##### Linux SDK 3.0

* First release of our Affdex SDK for the [Linux](/linux) platform.

---

***Jan 2016***

##### Windows/iOS/Android SDK 3.0

* New API to allow tracking of multiple faces simultaneously.
* Added a Face to Emoji mapper to allow the developer to map facial expressions of emotion to [13 emojis](/metrics#emoji-expressions) different emojis
* New API that returns the most likely emoji (`dominantEmoji`) posed in an image
* Added models to allow identification of [gender and presence of eyeglasses or sunglasses](/metrics#appearance)
* New API that allows the developer to control the face detector configuration to use in the detection
* Added dynamic core detection to allow SDKs to make use of multiple CPU cores if available
* New Getting Started tutorials on the Developer Portal
* New version of the AffdexMe apps ([iOS](https://github.com/Affectiva/ios-sdk-samples/tree/master/apps/AffdexMe), [Android](https://github.com/Affectiva/affdexme-android) and [Windows](https://github.com/Affectiva/win-sdk-samples/tree/master/AffdexMe)):
  * Track multiple faces in realtime
    On Windows this feature is enabled by default, but on iOS/Android it can be toggled from the settings menu.  
  * Display the metrics for Facial Expression, Emotion, Appearance and Dominant Emoji
  * Allow users to take screenshots of the camera feed with the metrics overlay
  * Allow users to use the back camera to track the metrics
  * Optimize AffdexMe (Windows) metric and camera visualization class
* iOS SDK
  * `AFDXFace` class re-organized into categories expressions, emotions, emoji and appearance
  * `Expressiveness` renamed into `Engagement`
  * Head angles renamed `HeadUpDown`, `HeadLeftRight`, `HeadRoll` to `Pitch`, `Yaw`, `Roll`
  * Added API to allow embedding the license string as a variable in the app code
* Win SDK
  * Performance improvements
  * Fixed bug: The assembly version doesn't match the file metadata
  * Fixed bug: Calling reset() doesn't reset the internal cached timestamps.
* Android SDK
  * Fixed bug: the license token validation fails due to zero padding

---

***Sep 2015***

##### Windows/iOS/Android SDK 2.0

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
