### Getting results

The <code>Detector</code> uses callback methods to communicate events and results:
The <code>ImageResultsListener</code> interface defines methods that are invoked when the <code>Detector</code> has started or stopped tracking a face, and when it has detection results for a face. The <code>OnFaceLost</code>, <code>OnFaceFound</code>, and <code>OnImageResults</code> methods must be defined as part of a class attached as a component within Unity.  Here is an example:

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

<code>OnImageResults</code> delivers the detection results via a dictionary of <code>Face</code> objects, which contain the values of all expressions and emotions for a face in a frame.  It also allows you to get the interocular distance, facial feature point locations, and the orientation of the face.  Note that in the current release, the dictionary will contain at most one face; multiple faces are not supported yet.

For a fully implemented sample, check out [EmoSurvival](https://github.com/Affectiva/EmoSurvival/blob/master/Assets/Scripts/Player/PlayerEmotions.cs).  You can use <code>OnFaceLost</code> to pause a game.  If you use Time.timeScale to pause, the camera script will also pause, as it uses the same time values.


### Data Structures

#### Frame

The <code>Frame</code> class is used for passing images to the <code>Detector</code>. The <code>Frame</code> class' constructor requires the width and height of the frame, the color format of the incoming image must be supplied, and a timestamp.  If the source of the image content has an associated timestamp, you should use that; otherwise, if the images are coming from a real time source, you could use <code>Time.realtimeSinceStartup</code>.

There are two versions of the <code>Frame</code> constructor.  The first expects an upright image:

```csharp
Frame(Color32[] rgba, int width, int height, float timestamp);
```

The second requires the orientation of the image:

```csharp
Frame(Color32[] rgba, int width, int height, Orientation orientation, float timestamp);
```

#### Face

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

#### Expressions

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

#### Emotions

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

#### Measurements

<code>Measurements</code> is a representation of the head and face measurements. The Interocular distance is defined as the distance between the two outer eye corners in pixels:

```csharp
struct Expressions
{
  Orientation orientation;
  float interoculardistance;
};
```
<img src="../images/graphic3.png" align=right>

#### Orientation

<code>Orientation</code> is a representation of the orientation of the head in a 3-D space using Euler angles (pitch, yaw, roll):

```csharp
struct Orientation
{
  float pitch;
  float yaw;
  float roll;
};
```

#### FeaturePoint

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