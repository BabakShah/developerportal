### Choosing the classifiers
The next step is to turn on the detection of the metrics needed. For example, to turn on or off the detection of the smile, joy and gender classifiers:  

```javascript
// Track smiles
detector.detectExpressions.smile = true;

// Track joy emotion
detector.detectEmotions.joy = true;

// Detect person's gender
detector.detectAppearance.gender = true;
```

To turn on or off the detection of all expressions, appearances, emotions or emojis:

```javascript
detector.detectAllExpressions();
detector.detectAllEmotions();
detector.detectAllEmojis();
detector.detectAllAppearance();
```

The list of possible metrics that affdex detects [can be found here](/metrics)
