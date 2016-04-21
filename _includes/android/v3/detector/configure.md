### Configuring the detector

**License**

In order to initialize the detector, a valid license file must be provided. Each license file issued by Affectiva is time bound and will only work for a fixed period of time shown in the license file, after which the SDK will throw a `LicenseException`.

**classdoc:** LicenseException [[java]({{ site.baseurl }}/pages/platforms/v3/android/javadoc/com/affectiva/android/affdex/sdk/AffdexException.html)]

Copy the license file to the ```app/main/src/assets/Affdex``` directory and pass the filename to the ```setLicensePath()``` method.

```java
detector.setLicensePath("affdex.license");
```

Alternatively, the license can be loaded as a byte array

```java
detector.setLicenseStream(Reader reader);
```
