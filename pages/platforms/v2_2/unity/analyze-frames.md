---
title: Analyze a video frame stream
permalink: /v2_2/unity/analyze-frames/
tags: [unity, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
Using a webcam is a common way to obtain video for facial expression detection. The ```CameraDetector``` can access a webcam connected to the device to capture frames and feed them directly to the facial expression engine. 

### Add detector to scene
First step is to add a detector to your scene's Main Camera (Add Component -> Scripts -> Affdex -> Detector):  
<img src="{{ "/images/unity/AddComponentDetector.png" | prepend: site.baseurl }}" style="height: 100%; width: 100%">

You can now set the emotions and expressions you are interested in (the more you select the worse performance will be, so only select the ones you need):  
<img src="{{ "/images/unity/SetEmotions.png" | prepend: site.baseurl }}" style="height: 100%; width: 100%">

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

The <code>Frame</code> is used for passing images to and from the detectors. To initialize a new instance of a frame, you must call the frame constructor. The frame constructor requires the width and height of the frame. Additionally, the color format of the incoming image must be supplied. For Unity, the timestamp is always required and most of the time you will want to pass it Time.realtimeSinceStartup .    

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