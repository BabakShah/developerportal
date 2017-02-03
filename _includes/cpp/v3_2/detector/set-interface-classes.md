### Configuring the callback functions
The Detectors use callback functions defined in interface classes to communicate events and results. The event listeners need to be initialized before the detector is started:
The ```FaceListener``` is a client callback interface which sends notification when the detector has started or stopped tracking a face. Call `setFaceListener` to set the `FaceListener`:  

**classdoc:** FaceListener [[c++]({{ site.baseurl }}/pages/platforms/v3_2/cpp/classdocs/affdex-native/classaffdex_1_1_face_listener.html)]

```cpp
class MyApp : public affdex::FaceListener {
public:
  MyApp() {
    detector.setFaceListener(this);
  }

private:
  affdex::Detector detector;
};
```

The ```ImageListener``` is a client callback interface which delivers information about an image which has been handled by the Detector. Call `setImageListener` to set the `ImageListener`:  

**classdoc:** ImageListener [[c++]({{ site.baseurl }}/pages/platforms/v3_2/cpp/classdocs/affdex-native/classaffdex_1_1_image_listener.html)]

```cpp
class MyApp : public affdex::ImageListener {
public:
  MyApp() {
    detector.setImageListener(this);
  }

private:
  affdex::Detector detector;
};
```

The ```ProcessStatusListener``` is a callback interface which provides information regarding the processing state of the detector. Call `setProcessStatusListener` to set the `ProcessStatusListener`:  

**classdoc:** ProcessStatusListener [[c++]({{ site.baseurl }}/pages/platforms/v3_2/cpp/classdocs/affdex-native/classaffdex_1_1_process_status_listener.html)]

```cpp
class MyApp : public affdex::ProcessStatusListener {
public:
  MyApp() {
    detector.setProcessStatusListener(this);
  }

private:
  affdex::Detector detector;
};
```
