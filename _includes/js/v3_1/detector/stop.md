### Stopping the detector

At the end of the interaction with the detector the web worker thread can be terminated by calling stop():

```js
detector.stop();
```

The processing state can be reset. This method resets the context of the video frames. Additionally Face IDs and Timestamps are set to zero (0):

```js
detector.reset();
```
