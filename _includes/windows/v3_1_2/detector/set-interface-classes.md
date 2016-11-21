### Configuring the callback functions
The Detectors use callback functions defined in interface classes to communicate events and results. The event listeners need to be initialized before the detector is started:
The ```FaceListener``` is a client callback interface which sends notification when the detector has started or stopped tracking a face. Call `setFaceListener` to set the `FaceListener`:  

**classdoc:** FaceListener [[c++]({{ site.baseurl }}/pages/platforms/v3_1_2/cpp/classdocs/affdex-native/classaffdex_1_1_face_listener.html)], [[c#]({{ site.baseurl }}/pages/platforms/v3_1_2/windows/classdocs/Affdex/html/0ac8bd67-3ba3-050a-3646-0bcce794bec0.htm)]

```csharp
class MyApp : Affdex.FaceListener {
  MyApp() {
    detector.setFaceListener(this);
  }
};
```

The ```ImageListener``` is a client callback interface which delivers information about an image which has been handled by the Detector. Call `setImageListener` to set the `ImageListener`:  

**classdoc:** ImageListener [[c++]({{ site.baseurl }}/pages/platforms/v3_1_2/cpp/classdocs/affdex-native/classaffdex_1_1_image_listener.html)], [[c#]({{ site.baseurl }}/pages/platforms/v3_1_2/windows/classdocs/Affdex/html/01540d38-9ade-2974-0182-44633d8b0722.htm)]

```csharp
class MyApp : Affdex.ImageListener {
  MyApp() {
    detector.setImageListener(this);
  }
};
```

The ```ProcessStatusListener``` is a callback interface which provides information regarding the processing state of the detector. Call `setProcessStatusListener` to set the `ProcessStatusListener`:  

**classdoc:** ProcessStatusListener [[c++]({{ site.baseurl }}/pages/platforms/v3_1_2/cpp/classdocs/affdex-native/classaffdex_1_1_process_status_listener.html)], [[c#]({{ site.baseurl }}/pages/platforms/v3_1_2/windows/classdocs/Affdex/html/d9d08bc0-b022-4114-64d1-4ef3ed7e1bab.htm)]

```csharp
class MyApp : Affdex.ProcessStatusListener {
  MyApp() {
    detector.setProcessStatusListener(this);
  }
};
```
