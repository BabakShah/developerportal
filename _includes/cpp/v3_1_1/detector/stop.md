### Stopping the detector

At the end of the interaction with the detection. Stopping the detector can be done as follows:

```csharp
detector.stop();
```

The processing state can be reset. This method resets the context of the video frames. Additionally Face IDs and Timestamps are set to zero (0):

```csharp
detector.reset();
```
