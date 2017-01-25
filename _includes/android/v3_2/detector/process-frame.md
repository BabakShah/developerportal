### Processing a frame
After successfully initializing the detector using the start method. The frames can be passed to the detector by calling the process method. The process method expects a ```Frame```. For each frame, create an ```Affdex.Frame``` (Bitmap, RGBA, and YUV420sp/NV21 formats are supported).

For example to process an YUV420sp/NV21 frame captured from the camera.

**classdoc:** Frame [java]({{ site.baseurl }}/pages/platforms/v3_2/android/javadoc/com/affectiva/android/affdex/sdk/Frame.html)

```java
byte [] frameData;
int width = 640;
int height = 480;
float timeStamp = (float)SystemClock.elapsedRealtime()/1000f;

Frame.ByteArrayFrame frame = new Frame.ByteArrayFrame(frameData, width, height,
                                                      Frame.COLOR_FORMAT.YUV_NV21);
frame.setTargetRotation(rotation);
detector.process(frame, timeStamp);  
```
