
### Configuring the detector

In order to initialize the detector, a valid location of the data folder must be specified:

**Data folder**

The Affdex classifier data files are used in frame analysis processing. These files are supplied as part of the SDK. The location of the data files on the physical storage needs to be passed to a detector in order to initialize it by calling the following with the fully qualified path to the folder containing them:

```csharp
String classifierPath="C:\\Program Files(x86)\\Affectiva\\AffdexSDK\\data"
detector.setClassifierPath(classifierPath);
```
