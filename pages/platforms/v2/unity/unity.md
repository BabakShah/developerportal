---
title: Affdex SDK for Unity
permalink: /v2/unity/
redirect_from: "/unity/"
tags: [unity, sdk, asset]
audience: writer, designer
keywords:
last_updated:
summary:
---
{% include linkrefs.html %}

<img src="{{ "/images/unity.png" | prepend: site.baseurl }}" align="right" style="max-width: 6em;">

SDK Developer Guide Release 2.0

## Getting started

Downloading the Unity SDK requires sending a manually signed license agreement. Contact gaminginfo@affectiva.com to start the process.

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
*   OS 10.9.5 and above
*   Android 4.4 and above

## Video Tutorial
<iframe width="100%" height="400px" src="https://www.youtube.com/embed/HjtPiXWx220" frameborder="0" allowfullscreen></iframe>

## Class Documentation
The classes that come with this asset are viewable [here](/pages/platforms/v2/unity/AffdexUnityHelp/index.html).  

## Using the Asset

We package our plugin as an asset, like those you can buy on Unity's Asset Store.  It is currently only available directly from us (contact gaminginfo@affectiva.com for a copy).  The purpose of the asset is to detect facial expressions and their underlying emotions from facial images. Facial images can be captured from different sources:  

*   Camera: images from the webcam (or selfie cam for mobile devices)
*   Frames: a sequence of timed images.
*   Video: a video file on a device's local storage.

For each of the different sources, the underlining emotion recognition engine defines a detector class that can handle processing images acquired from that source. There are a set of common steps needed to start using a detector.  

### Add detector to scene
First step is to add a detector to your scene's Main Camera (Add Component -> Scripts -> Affdex -> Detector):  
<img src="{{ "/images/unity/AddComponentDetector.png" | prepend: site.baseurl }}" style="height: 100%; width: 100%">

You can now set the emotions and expressions you are interested in (the more you select the worse performance will be, so only select the ones you need):  
<img src="{{ "/images/unity/SetEmotions.png" | prepend: site.baseurl }}" style="height: 100%; width: 100%">

### Add input script to scene

#### Using CameraInput
You can either use Affectiva's <code>CameraInput</code> script or write your own.  To use ours, add the camera input component to your scene's Main Camera (Add Component -> Scripts -> Affdex -> Camera Input):  
<img src="{{ "/images/unity/AddCameraInput.png" | prepend: site.baseurl }}" style="height: 100%; width: 100%">

Set the camera rate, camera location, width and height:  
<img src="{{ "/images/unity/SetCameraInput.png" | prepend: site.baseurl }}" style="height: 100%; width: 100%">

Affdex performs best using a resolution ratio of 4:3 (ie: 320x240, 640x480, 800x600, 1024x768, etc) and a sample rate from 5 to 20.  You can reduce CPU usage by lowering the resolution and sample rate.

To create your own script for getting images take a look at the <code>Frame</code> data structure below.  You can also see Affectiva's <code>CameraInput</code> script in the asset.  

##### Changing the Camera
If the player has multiple webcams you may want them to have the option of selecting the webcam.  The webcam name can be passed to CameraInput.SelectCamera as the second argument.  You can get a list of connected webcams using the [example code from Unity](http://docs.unity3d.com/ScriptReference/WebCamTexture-devices.html).  Once you have a specific webcam to use you can add code similar to the following to one of your scripts:

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
            cameraInput.SelectCamera(true,cameraName);
            currentCameraName = cameraName;
        }
    
    }
    
    void Awake () {
        mainCamera = GameObject.FindGameObjectWithTag ("MainCamera").transform;
        cameraInput = mainCamera.GetComponent <CameraInput>();
    }
}
```


#### Using VideoInput
Affectiva's <code>VideoInput</code> script is meant more as an example or for testing than for use in an actual game.  Android doesn't support the MovieTexture that this script relies on and thus it cannot be used in Android.  After adding it to a scene you can set a default video and a sample rate.  The sample rate defines how many times per second to pass the video frames to Affectiva for processing metrics.  As an example, if the video is 60 frames per second (YouTube's currently supported frame rate) and you have the sample rate set to 20, then 20 of the 60 frames per second will be processed.  If the video has no camera cuts, and one consistent face, than a sample rate as low as 5 should be sufficient. 

Another common use of the asset is to process previously captured video files. The <code>VideoFileInput</code> helps streamline this effort by decoding and processing frames from a video file. During processing, the <code>VideoFileInput</code> decodes and processes frames as fast as possible and actual processing times will depend on CPU speed. Please see [this list](http://docs.unity3d.com/Manual/class-MovieTexture.html) of accepted file types and recommended video codecs that are compatible with the detector.  

### Configuring a Detector

The Affdex classifier data files are used in frame analysis processing. These files are supplied as part of the asset. The location of the data files on the physical storage must remain as:  

```csharp
Assets/StreamingAssets/affdex-data*
```

When you switch scenes you need to destroy and respawn the <code>Detector</code> and <code>CameraInput</code>.  If you do not respawn these components, Unity's camera interface will get a frozen image at reload thus causing the metrics to continually come from the image taken at the scene transition.

## ImageResultsListener

The Detectors use callback classes to communicate events and results:
The <code>ImageResultsListener</code> is a client callback which receives notification when the detector has started or stopped tracking a face. The OnFaceLost, OnFaceFound, and OnImageResults methods must be defined as part of a class attached as a component within Unity.  Here is an example:  

```csharp
using Affdex;
using System.Collections.Generic;

public class PlayerEmotions : ImageResultsListener
{
    public float currentSmile;
    public float currentInterocularDistance;
    public float currentContempt;
    public float currentValence;
    public float currentAnger;
    public float currentFear;
    public FeaturePoint[] featurePointsList;

    public override void onFaceFound(float timestamp, int faceId)
    {
        Debug.Log("Found the face");
    }

    public override void onFaceLost(float timestamp, int faceId)
    {
        Debug.Log("Lost the face");
    }

    public override void onImageResults(Dictionary<int, Face> faces)
    {
        Debug.Log("Got face results");

        foreach (KeyValuePair<int, Face> pair in faces)
        {
            int FaceId = pair.Key;  // The Face Unique Id.
            Face face = pair.Value;    // Instance of the face class containing emotions, and facial expression values.

            //Retrieve the Emotions Scores
            face.Emotions.TryGetValue(Emotions.Contempt, out currentContempt);
            face.Emotions.TryGetValue(Emotions.Valence, out currentValence);
            face.Emotions.TryGetValue(Emotions.Anger, out currentAnger);
            face.Emotions.TryGetValue(Emotions.Fear, out currentFear);

            //Retrieve the Smile Score
            face.Expressions.TryGetValue(Expressions.Smile, out currentSmile);


            //Retrieve the Interocular distance, the distance between two outer eye corners.
            currentInterocularDistance = face.Measurements.interOcularDistance;


            //Retrieve the coordinates of the facial landmarks (face feature points)
            featurePointsList = face.FeaturePoints;

        }
    }
}
```

OnImageResults is the most popular method.  The Faces class allows you to get the current values of all expressions, and all emotions.  It also allows you to get the interocular distance, facial feature point locations, and the orientation of the face.

For a fully implemented sample, check out [EmoSurvival](https://github.com/Affectiva/EmoSurvival/blob/master/Assets/Scripts/Player/PlayerEmotions.cs).  You can use onFaceLost to pause a game.  If you use Time.timeScale to pause, the camera script will also pause, as it uses the same time values.  

### Setting the Classifiers

While you can use the detector UI to set the emotion and expression classifiers (as discussed above) you can also set them programmatically.  The following methods are available to turn on or off the detection of various classifiers.  

By default, all classifiers are turned off (set to false).  Every classifier you turn on will take a bit more system resources.  

Here is an example of how to set the detection of the smile classifier to on, by calling the Detector class's SetExpressionState method:  

```csharp
void SetExpressionState(Expressions.Smile, true);
```
 
## Detectors

For each of the possible sources of facial frames, the asset has a script to consume and process images from these sources.  

### Detector

In the underlying emotion recognition engine, this uses the <code>Detector</code>.  It tracks expressions in a sequence of real-time frames. It expects each frame to have a timestamp that indicates the time the frame was captured. The timestamps arrive in an increasing order, which is why pausing the game using Time.timeScale can impact processing. The <code>Detector</code> will detect a face in a frame and deliver information on it to you.  

## Data Structures

### Frame

The <code>Frame</code> is used for passing images to and from the detectors. If you use the <code>CameraInput</code> script or <code>VideoInput</code> script described above you don't need to do this as the script takes care of it for you.  To initialize a new instance of a frame, you must call the frame constructor. The frame constructor requires the width and height of the frame. Additionally, the color format of the incoming image must be supplied. For Unity, the timestamp is always required and most of the time you will want to pass it Time.realtimeSinceStartup .    

There are two versions of the frame constuctor.  The first expects an upright image:

```csharp
Frame(Color32[] rgba, int width, int height, float timestamp);
```

The second requires the orientation of the frame:

```csharp
Frame(Color32[] rgba, int width, int height, Orientation orientation, float timestamp);
```

To see an example of how to send frames to the detector review [this GitHub Gist](https://gist.github.com/ForestJay/e47a258cc2ae7a9a44c8).  For more details of the frame structure, see the [class docs](/pages/platforms/v2/unity/AffdexUnityHelp/index.html).

### Face

The Face class represents a face found within a processed frame. It contains results for detected expressions, emotions, and head measurements.  

```csharp
Face.Expressions
Face.Emotions
Face.Measurements
```

The Face object also enables users to retrieve the feature points associated with a face:  

```csharp
Face.FeaturePoints
```

<strong>Expressions</strong>

<code>Expressions</code> is a representation of the probabilities of the facial expressions detected. Each value represents a probability between 0 to 100 of the presence of the expression in the frame analyzed:  

```csharp
struct Expressions
{
  float Smile;
  float InnerEyeBrowRaise;
  float BrowRaise;
  float BrowFurrow;
  float NoseWrinkler;
  float UpperLipRaiser;
  float LipCornerDepressor;
  float ChinRaiser;
  float LipPucker;
  float LipPress;
  float LipSuck;
  float MouthOpen;
  float Smirk;
  float EyeClosure;
  float Attention;
};
```

<strong>Emotions</strong>

<code>Emotions</code> is a representation of the probabilities of the emotions detected. Each value represents a probability between 0 to 100 of the presence of the emotion in the frame analyzed. Valence, a measure of positivity or negativity of the expressions, ranges from -100 to 100:  

```csharp
struct Emotions
{
  float Joy;
  float Fear;
  float Disgust;
  float Sadness;
  float Anger;
  float Surprise;
  float Contempt;
  float Valence;
  float Engagement;
};
```

<strong>Measurements</strong>

<code>Measurements</code> is a representation of the head and face measurements. The Interocular distance is defined as the distance between the two outer eye corners in pixels:  

```csharp
struct Expressions
{
  Orientation orientation;
  float interoculardistance;
};
```
<img src="../images/graphic3.png" align=right>

<strong>Orientation</strong>

<code>Orientation</code> is a representation of the orientation of the head in a 3-D space using Euler angles (pitch, yaw, roll):

```csharp
struct Orientation
{
  float pitch;
  float yaw;
  float roll;
};
```

<strong>FeaturePoint</strong>

<code>FeaturePoint</code> is the cartesian coordinates of a facial feature on the source image and is defined as the following:  

```csharp
struct FeaturePoint
{
  int id;
  float x;
  float y;
};
```

See the feature point indices [table]({{ site.baseurl }}/fpi/) for a full list of feature points.


## Special Notes

This section outlines issues you may encounter depending on how you use the plugin.

### Builds

<ul>
  <li>If you build for multiple platforms and want to no-op unsupported platforms you can run <code>AffdexUnityUtils.ValidPlatform()</code> to determining if the current platform is valid at run-time.</li>
  <li>OS X builds only work as universal and x86_64 binaries.</li>
</ul>

### Apple App Store Submission

The Apple app store has a rigorous set of automated tests it runs on submissions to validate that applications meet their guidelines.  They will specifically expect certain parts of your game to be signed using a certification authority.  All files that need to be signed must be signed using the same signature authority.  This means that you as an individual, or your company, will need a signing certificate for not only your files, but for the files that come from Affectiva.  If the Affectiva files are signed by Affectiva and your other game files are signed by you, your submission will be rejected by the app store.  

The order in which files and bundles are signed is also critical.  You must sign the inner-most files first.  Here is a <a href="http://stackoverflow.com/questions/7697508/how-do-you-codesign-framework-bundles-for-the-mac-app-store/11284404#11284404">Stack Overflow answer</a> that includes a shell script that signs in the proper order.
