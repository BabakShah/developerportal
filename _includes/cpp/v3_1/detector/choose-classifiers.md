### Choosing the classifiers
The next step is to turn on the detection of the metrics needed. For example, to turn on or off the detection of the smile and joy classifiers:  

```csharp
detector.setDetectSmile(true);
detector.setDetectJoy(true);
```

To turn on or off the detection of all expressions, emotions or emojis:

```csharp
detector.setDetectAllExpressions(true);
detector.setDetectAllEmotions(true);
detector.setDetectAllEmojis(true);
detecor.setDetectAllAppearances(true);
```

To check the status of a classifier at any time, for example smile:

```csharp
detector.getDetectSmile();
```
