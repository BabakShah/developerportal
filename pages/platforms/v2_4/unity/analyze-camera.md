---
title: Analyze a camera feed
permalink: /v2_4/unity/analyze-camera/
tags: [unity, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

Using a camera is a common way to obtain images for facial expression detection. In a Unity app, you can use a <code>WebCamTexture</code> to get camera frames, then create Affdex <code>Frame</code> objects from the frame data, and feed those <code>Frame</code>s to a <code>Detector</code> object.

A <code>Detector</code> tracks expressions in a sequence of real-time frames. It expects each frame to have a timestamp that indicates the time the frame was captured. The timestamps arrive in an increasing order, which is why pausing the game using Time.timeScale can impact processing. The <code>Detector</code> will detect a face in a frame and deliver information on it to you.

{% include unity/v2/add-detector.md %}

### Feeding camera frames to the Detector
To get camera frames and deliver them to the <code>Detector</code>, you can either use the <code>CameraInput</code> script provided with the Affdex SDK or write your own.  To use ours, add the Camera Input component to your scene's Main Camera (Add Component -> Scripts -> Affdex -> CameraInput):
<img src="{{ "/images/unity/AddCameraInput.png" | prepend: site.baseurl }}" style="height: 100%; width: 100%">

Set the camera rate, camera location, width and height:
<img src="{{ "/images/unity/SetCameraInput.png" | prepend: site.baseurl }}" style="height: 100%; width: 100%">

Affdex performs best using a resolution ratio of 4:3 (e.g.: 320x240, 640x480, 800x600, 1024x768, etc.) and a sample rate from 5 to 20.  You can reduce CPU usage by lowering the resolution and sample rate.

To create your own script for getting images, take a look at the <code>Frame</code> data structure below.  You can also refer to the <code>CameraInput</code> script as an example.

#### Changing the Camera
If the device has multiple cameras, you may want the user to have the option of selecting the camera to use.  The <code>CameraInput</code> class automatically selects the device's front-facing camera in its <code>Start</code> method, but you can switch to a different one by calling <code>CameraInput.SelectCamera</code> with a camera name as the second argument.  You can get a list of connected cameras using the [example code from Unity](http://docs.unity3d.com/ScriptReference/WebCamTexture-devices.html).  Once you have a specific camera selected, you can add code similar to the following to one of your scripts:

```csharp
using UnityEngine;
using System.Collections;

public class ExampleClass : MonoBehaviour {
    Transform mainCamera;
    CameraInput cameraInput;
    string cameraName;
    string currentCameraName = "";

    // Update is called once per frame
    void Update () {

        if (currentCameraName != cameraName)
        {
            cameraInput.SelectCamera(true, cameraName);
            currentCameraName = cameraName;
        }

    }

    void Awake () {
        mainCamera = GameObject.FindGameObjectWithTag ("MainCamera").transform;
        cameraInput = mainCamera.GetComponent <CameraInput>();
    }
}
```

When you switch scenes, you need to destroy and respawn the <code>Detector</code> and <code>CameraInput</code>.  If you do not respawn these components, Unity's camera interface will get a frozen image at reload, thus causing the metrics to continually come from the image taken at the scene transition.


{% include unity/v2/detector-results.md %}
