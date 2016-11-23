### Stopping the detector

At the end of the interaction with the detection. Stopping the detector can be done as follows:

```java
detector.stop();
```

 Be sure to always call ```stop()``` following a successful call to ```start()``` (including for example, in circumstances where you abort processing, such as in exception catch blocks).  This ensures that resources held by the Detector instance are released.

The processing state can be reset. This method resets the context of the video frames. Additionally Face IDs and Timestamps are set to zero (0):

```java
detector.reset();
```
