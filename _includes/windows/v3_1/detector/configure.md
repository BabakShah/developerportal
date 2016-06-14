### Configuring the detector

In order to initialize the detector, a valid license file must be provided and the location of the data folder must be specified:

**License**

Each license file issued by Affectiva is time bound and will only work for a fixed period of time shown in the license file, after which the SDK will throw an `AffdexLicenseException`

The license can be loaded by specifying the fully qualified path to the license file

```csharp
String licensePath="C:\\myProject\\affdex.license"
detector.setLicensePath(licensePath);
```

Alternatively, the license can be loaded as a byte array

```csharp
detector.setLicenseString(Byte[]);
```

**Data folder**

The Affdex classifier data files are used in frame analysis processing. These files are supplied as part of the SDK. The location of the data files on the physical storage needs to be passed to a detector in order to initialize it by calling the following with the fully qualified path to the folder containing them:

```csharp
String classifierPath="C:\\Program Files(x86)\\Affectiva\\Affdex SDK\\data"
detector.setClassifierPath(classifierPath);
```
