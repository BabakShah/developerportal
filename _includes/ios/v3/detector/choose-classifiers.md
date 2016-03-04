### Choosing the classifiers
The next step is to turn on the detection of the [metrics](/metrics) needed. By default, all classifiers are disabled. Here, we’ll turn on a few classifiers. For example:

```objc
// turning on a few emotions
detector.joy = YES;
detector.anger = YES;

// turning on a few expressions
detector.smile = YES;
detector.browRaise = YES;
detector.browFurrow = YES;

// turning on a few emojis
detector.smiley = YES;
detector.kissing = YES; // etc
```

To turn on or off the detection of all expressions, emotions or emojis:

```objc
[detector setDetectAllEmotions:YES];
[detector setDetectAllExpressions:YES];
[detector setDetectEmojis:YES];
```
