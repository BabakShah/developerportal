### Choosing the classifiers
The next step is to turn on the detection of the metrics needed. For example, to turn on or off the detection of the smile and joy classifiers:  

```java
detector.setDetectSmile(true);
detector.setDetectJoy(true);
```

To turn on or off the detection of all expressions, emotions, emojis, or appearances:

```java
detector.setDetectAllExpressions(true);
detector.setDetectAllEmotions(true);
detector.setDetectAllEmojis(true);
detector.setDetectAllAppearances(true);
```

To check the status of a classifier at any time, for example smile:

```java
detector.getDetectSmile();
```
