### Configuring the callback functions
The Detectors use callback functions defined in interface classes to communicate events and results. The event listeners need to be initialized before the detector is started:
The ```FaceListener``` is a client callback interface which sends notification when the detector has started or stopped tracking a face. Call `setFaceListener` to set the `FaceListener`:  

**classdoc:** FaceListener [[java]({{ site.baseurl }}/pages/platforms/v3/android/javadoc/com/affectiva/android/affdex/sdk/detector/Detector.FaceListener.html)]

```java
public class MyActivity implements Detector.FaceListener {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    detector.setFaceListener(this);
  }
};
```

The ```ImageListener``` is a client callback interface which delivers information about an image which has been handled by the Detector. Call `setImageListener` to set the `ImageListener`:  

**classdoc:** ImageListener [[java]({{ site.baseurl }}/pages/platforms/v3/android/javadoc/com/affectiva/android/affdex/sdk/detector/Detector.ImageListener.html)]

```java
public class MyActivity implements Detector.ImageListener {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    detector.setImageListener(this);
  }

  //The follow code sample shows an example of how to retrieve metric values from the Face object
  @Override
  public void onImageResults(List<Face> faces, Frame image,float timestamp) {

      if (faces == null)
          return; //frame was not processed

      if (faces.size() == 0)
          return; //no face found

      //For each face found
      for (int i = 0 ; i < faces.size() ; i++) {
        Face face = faces.get(i);

        int faceId = face.getId();

        //Appearance
        Face.GENDER genderValue = face.appearance.getGender();
        Face.GLASSES glassesValue = face.appearance.getGlasses();

        //Some Emoji
        float smiley = face.emojis.getSmiley();
        float laughing = face.emojis.getLaughing();
        float wink = face.emojis.getWink();


        //Some Emotions
        float joy = face.emotions.getJoy();
        float anger = face.emotions.getAnger();
        float disgust = face.emotions.getDisgust();

        //Some Expressions
        float smile = face.expressions.getSmile();
        float brow_furrow = face.expressions.getBrowFurrow();
        float brow_raise = face.expressions.getBrowRaise();

        //Measurements
        float interocular_distance = face.measurements.getInterocularDistance();
        float yaw = face.measurements.orientation.getYaw();
        float roll = face.measurements.orientation.getRoll();
        float pitch = face.measurements.orientation.getPitch();

        //Face feature points coordinates
        PointF[] points = face.getFacePoints();

      }
  }
};
```
