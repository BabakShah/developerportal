---
title: Analyze a photo
permalink: /v3/ios/analyze-photo/
tags: [ios, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

**classdoc:** Detector [[ObjectiveC]({{ site.baseurl }}/pages/platforms/v3/ios/classdocs/interface_a_f_d_x_detector.html)]

Affdex SDK also allows you to process images rather than video. Images can be discrete, or unrelated, or they can be frames extracted from video in which case they're continuous, or related, images.
If you have a library of facial images captured independently of one another then you would use the discrete option.
A scenario illustrating the use of continuous image processing is when your app may record faces on a lengthy basis and, for storage efficiency purposes, you store only one frame per second rather than the standard 30 FPS (the default for iPhones). The resulting images are related and saving one frame per second provides you with sufficient granularity for your app's purpose.
Processing either discrete or continuous images does not entail the use of the device camera so you can use Affdex SDK to process images while your device camera is in use.  

### Creating the detector

```objc
- (id)initWithDelegate:(id <AFDXDetectorDelegate>)delegate discreteImages:(BOOL)discrete maximumFaces:(NSUInteger)maximumFaces;
```

Like the other methods, this initialization method also takes a reference to an object which adheres to the <code>AFDXDetectorDelegate</code> protocol, as well as a maximum number of faces (..

The second parameter `discrete` is a flag that the detector uses to determine whether discrete images will be used or not. It should be set to `YES`.


{% include ios/v3/detector/configure.md %}


```objc
- (void)detectorDidFinishProcessing:(AFDXDetector *)detector;
```

This method is called in your code when the detector has finished processing a video file. (It is not called when using the camera or static images.) The implementation of this delegate method is optional.  

```

{% include ios/v3/detector/choose-classifiers.md %}

{% include ios/v3/detector/start.md %}

### Processing Images

After successful initialization, the following method can be used to process images for detection:  

```objc
- (void)processImage:(UIImage *)facePicture;
```

{% include ios/v3/detector/getting_results.md %}

{% include ios/v3/detector/stop.md %}
