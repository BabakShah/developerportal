### Configuring the detector

**License**

You must also specify a path to your license file. This file is provided by Affectiva when you register for the SDK, and must be added to your Xcode project. Xcode will copy the license file to the resources area of the app bundle; you can set the licensePath property as follows:

```objc
detector.licensePath = [[NSBundle mainBundle] pathForResource:@"sdk" ofType:@"license"];
```

Or you can set the licenseString variable to the path of your license file.

```objc
detector.licenseString = @"....."; // change the ellipses to the license string.
```

**Using the <code>AFDXDetectorDelegate</code> Protocol**

The SDK communicates results to your app via the `AFDXDetectorDelegate` protocol. Here are the methods that your app will need to know about.  

```objc
- (void)detector:(AFDXDetector *)detector didStartDetectingFace:(AFDXFace *)face;
```

This method is called in your code and signals when the detector detects a new face that has come into view. It is often used in conjunction with <code>detector:didStopDetectingFace:</code>. The implementation of this delegate method is optional.  

```objc
- (void)detector:(AFDXDetector *)detector didStopDetectingFace:(AFDXFace *)face;
```

This method is called in your code and signals when the detector no longer detects a particular face. This is the converse of detector:didStartDetectingFace:. Together, the two methods provide signals of when a face comes into or goes out of view. The implementation of this delegate method is also optional.  



```objc
- (void)detector:(AFDXDetector *)detector hasResults:(NSMutableDictionary *)faces forImage:(NSImage *)image atTime:(NSTimeInterval)time;
```

This method is called in your code when the detector has processed a video frame from the camera, from a video file, or via a static image.
There are four parameters sent to this method:  

1.	A reference to the detector.
2.	A dictionary of <code>AFDXFace</code> objects corresponding to the faces in the image. They key for each object is the face identifier. If <code>nil</code> is passed, then this is an unprocessed frame.
3.	A reference to the image.
4.	A timestamp (relative to 0) representing the point in time that the image was processed,  

For camera and video cases, the number of frames that are processed to the detector is usually a subset of the available frames.
