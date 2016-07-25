### Processing a frame
After successfully initializing the detector using the start method. The frames can be passed to the detector by calling the process method. The process method expects an [imageData](https://developer.mozilla.org/en-US/docs/Web/API/ImageData) object.  

```javascript

//Get a canvas element from DOM
var aCanvas = document.getElementById("canvas");
var context = aCanvas.getContext('2d');

//Get imageData object.
var imageData = context.getImageData(0, 0, 640, 480);

//Process the frame
detector.process(imageData);
```
