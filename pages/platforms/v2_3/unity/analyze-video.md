---
title: Analyze a video file
permalink: /v2_3/unity/analyze-video/
tags: [unity, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

A common use of the Affdex asset is to process previously captured video files.  To do this, you will need to decode the video file and pass <code>Frame</code> objects to a <code>Detector</code>.  The <code>VideoFileInput</code> script included in the Affdex Unity package helps streamline this effort. 

{% include unity/v2/add-detector.md %}

### Feeding video frames to the Detector
During processing, the <code>VideoFileInput</code> script decodes and processes frames as fast as possible, and actual processing times will depend on CPU speed. Please see [this list](http://docs.unity3d.com/Manual/class-MovieTexture.html) of accepted file types and recommended video codecs that are compatible with the detector.  

The <code>VideoFileInput</code> script is meant more as an example or for testing than for use in an actual game.  Android and iOS don't support the MovieTexture that this script relies on, and thus it cannot be used on those platforms.  After adding it to a scene, you can set a default video and a sample rate.  The sample rate defines how many times per second to pass the video frames to the <code>Detector</code> for processing metrics.  As an example, if the video is 60 frames per second (YouTube's currently supported frame rate) and you have the sample rate set to 20, then 20 of the 60 frames per second will be processed.  If the video has no camera cuts, and one consistent face, than a sample rate as low as 5 should be sufficient. 

{% include unity/v2/detector-results.md %}