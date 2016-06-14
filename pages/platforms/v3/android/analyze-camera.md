---
title: Analyze a camera feed
permalink: /v3/android/analyze-camera/
tags: [android, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
**classdoc:** CameraDetector [[java]({{ site.baseurl }}/pages/platforms/v3/android/javadoc/com/affectiva/android/affdex/sdk/detector/CameraDetector.html)]

Using a webcam is a common way to obtain video for facial expression detection. The ```CameraDetector``` can access a webcam connected to the device to capture frames and feed them directly to the facial expression engine.

### Creating the detector
The ```CameraDetector``` constructor must be called from the app's main thread (i.e., from within the main activity's `onCreate()` method).  There are two signatures - one that needs three parameters { `context`, `cameraType`, and `cameraPreviewView` } and a more complex one that needs five parameters { `context`, `cameraType`, `cameraPreviewView`, `maxNumFaces` and `faceDetectorMode` }.  The 3-argument constructor implements single-face detection and large face mode.

```java
public CameraDetector(
              /**
                The application context.
              */
              Context context,

              /**
                The enum represent which camera to use (Front or Back)
              */
              CameraType cameraType,

              /**
                 A SurfaceView to use as a camera preview.
              */
              SurfaceView cameraPreviewView,

              /**
                The maximum number of faces to track
                If not specified, default=1
              */
              int maxNumFaces,

              /**
                Face detector configuration - If not specified, defaults to FaceDetectorMode.LARGE_FACES
                  FaceDetectorMode.LARGE_FACES=Faces occupying large portions of the frame
                  FaceDetectorMode.SMALL_FACES=Faces occupying small portions of the frame
              */
              FaceDetectorMode faceConfig
);
```

Example,

```java
CameraDetector detector = new CameraDetector(this, CameraType.CAMERA_FRONT);
```

```java
CameraDetector detector = new CameraDetector(this, CameraType.CAMERA_FRONT,
                                             camServiceView, 1, FaceDetectorMode.LARGE_FACES);
```

The ```CameraDetector``` stretches the captured images to fit the entire SurfaceView, so it is the responsibility of the developer to size the SurfaceView to have the same aspect ratio as the returned camera images. The ```OnCameraEventListener``` interface reports the selected camera frame size.

As of SDK 2.0, it is no longer possible to submit a null value for the ```SurfaceView```. The Android API requires a Surface for its camera to function.

Please do not register for the ```SurfaceHolder.Callback``` interface belonging to this ```SurfaceView```, as that interface is managed by the SDK.

{% include android/v3/detector/configure.md %}

**Sizing the SurfaceView**

Aside from the convenience of managing the Android Camera, ```CameraDetector``` also takes care of choosing the frame rate and frame size that will work best with the SDK. Since it is the developer’s responsibility to layout and size the ```SurfaceView``` passed into ```CameraDetector```, you may want to resize the ```SurfaceView``` to match the aspect ratio of the returned frames. For this purpose, implement the ```CameraDetector.OnCameraEventListener``` interface to receive the ```onCameraSizeSelected``` event. Below is a block of sample code showing how to resize the ```SurfaceView``` to occupy as much space as its parent container while matching the aspect ratio of the incoming camera frames.

```java
@Override
public void onCameraSizeSelected(int cameraWidth, int cameraHeight, ROTATE rotation) {
    int cameraPreviewWidth;
    int cameraPreviewHeight;    	

//cameraWidth and cameraHeight report the unrotated dimensions of the camera frames, so switch the width and height if necessary

    if (rotation == ROTATE.BY_90_CCW || rotation == ROTATE.BY_90_CW) {
      cameraPreviewWidth = cameraHeight;
      cameraPreviewHeight = cameraWidth;
    } else {
      cameraPreviewWidth = cameraWidth;
      cameraPreviewHeight = cameraHeight;
    }

//retrieve the width and height of the ViewGroup object containing our SurfaceView (in an actual application, we would want to consider the possibility that the mainLayout object may not have been sized yet)

    int layoutWidth = mainLayout.getWidth();
    int layoutHeight = mainLayout.getHeight();

//compute the aspect Ratio of the ViewGroup object and the cameraPreview

    float layoutAspectRatio = (float)layoutWidth/layoutHeight; 	
    float cameraPreviewAspectRatio = (float)cameraWidth/cameraHeight;

    int newWidth;
    int newHeight;

    if (cameraPreviewAspectRatio > layoutAspectRatio) {
      newWidth = layoutWidth;
      newHeight =(int) (layoutWidth / cameraPreviewAspectRatio);
    } else {
      newWidth = (int) (layoutHeight * cameraPreviewAspectRatio);
      newHeight = layoutHeight;
    }

//size the SurfaceView

    ViewGroup.LayoutParams params = surfaceView.getLayoutParams();
    params.height = newHeight;
    params.width = newWidth;
    surfaceView.setLayoutParams(params);
}
```
**Hiding the SurfaceView**

Some applications may not wish to display the camera preview on screen. Since Android requires an active Surface for the camera to function, ```CameraDetector``` always requires a ```SurfaceView``` to be passed in. However, if you do not wish to display the preview, you can set the ```SurfaceView``` to be 1px by 1px and call ```SurfaceView.setAlpha(0)``` to hide it on-screen.

**Processing**

The number of video frames processed per second can be controlled by calling ```setMaxProcessRate```. The min recommended for the quality emotion detection is 5 frames per second. The higher the process rate, the more CPU intensive the processing is.

```java
int rate = 5;
detector.setMaxProcessRate(rate);
```

The ```onImageResults``` callback will be skipped for the unprocessed frames unless

```java
detector.setSendUnprocessFrames(true);
```


{% include android/v3/detector/set-interface-classes.md %}

The ```CameraEventListener``` is a client callback interface which delivers information about the ```SurfaceView``` size. Call `setOnCameraEventListener` to set the `CameraEventListener`:  

```java
public class MyActivity implements CameraDetector.CameraEventListener {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    detector.setOnCameraEventListener(this);
  }
};
```

{% include android/v3/detector/choose-classifiers.md %}

{% include android/v3/detector/start.md %}

The `start()` connects to the specified camera to capture video frames then processes them and use the callback functions to notify of the captured frames, results and exceptions (if exist).

{% include android/v3/detector/stop.md %}
