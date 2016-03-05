### Getting detection results

When the array of faces comes into the delegate method, your application can interpret the data as it sees fit. Here’s a code example:  

```objc
// Convenience method to work with processed images.
- (void)processedImageReady:(AFDXDetector *)detector image:(UIImage *)image faces:(NSDictionary *)faces atTime:(NSTimeInterval)time;
{
    for (AFDXFace *face in [faces allValues])
    {
        if (isnan(face.expressions.smile) == NO)
        {
            // do something with the value...
        }
        if (isnan(face.expressions.browRaise) == NO)
        {
            // do something with the value...
        }
        // handle other metrics here
        . . .
    }
}

// Convenience method to work with unprocessed images.
- (void)unprocessedImageReady:(AFDXDetector *)detector image:(UIImage *)image atTime:(NSTimeInterval)time;
{
    // This is an unprocessed frame... do something with it...
}

// The delegate method of the AFDXDetectorDelegate protocol.
- (void)detector:(AFDXDetector *)detector hasResults:(NSMutableDictionary *)faces forImage:(UIImage *)image atTime:(NSTimeInterval)time;
{
    if (nil == faces)
    {
        [self unprocessedImageReady:detector image:image atTime:time];
    }
    else
    {
        [self processedImageReady:detector image:image faces:faces atTime:time];
    }
}
```

In the above code snippet, the delegate method will call one of two instance methods depending on the value of the <code>faces</code> dictionary. The <code>unprocessedImageReady:image:atTime:</code> method receives unprocessed frames while the <code>processedImageReady:image:faces:atTime:</code> method receives the processed ones. In that method, you can check the metric values for  all <code>AFDXFace</code> objects in the dictionary. The value extracted from the metric should be checked for NaN (not a number) which indicates that the detector has not been instructed to detect that emotion or expression.

 For multiple face detection, it is important to keep in mind that each face has its own face identifier (a unique number) which is tracked as long as that face remains in the image and does not "cross over" another face. If one face's bounding box collides with another face's bounding box from one frame to the next (in video or non-discrete image mode), the face tracker may assign a different face ID to those faces.
