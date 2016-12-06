### Adding a Detector to a scene
The first step is to add a detector to your scene's Main Camera (Add Component -> Scripts -> Affdex -> Detector):
<img src="{{ "/images/unity/AddComponentDetector.png" | prepend: site.baseurl }}" style="height: 100%; width: 100%">

### Configuring the Detector

In the "Detector" section of the Inspector pane, you can now configure the emotions and expressions you are interested in (the more you select the worse performance will be, so only select the ones you need):
<img src="{{ "/images/unity/SetEmotions.png" | prepend: site.baseurl }}" style="height: 100%; width: 100%">

Alternatively, you can enable and disable emotion and expression classifiers programmatically. Here is an example of how to enable the detection of the smile classifier, by calling the <code>Detector</code> class' <code>SetExpressionState</code> method:

```csharp
void SetExpressionState(Expressions.Smile, true);
```

By default, all classifiers are disabled.  Every classifier you enable will take a bit more system resources.

The Affdex classifier data files are used in frame analysis processing. These files are supplied as part of the asset. The location of the data files on the physical storage must remain as:

```csharp
Assets/StreamingAssets/affdex-data*
```
