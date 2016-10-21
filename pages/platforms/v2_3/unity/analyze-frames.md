---
title: Analyze a video frame stream
permalink: /v2_3/unity/analyze-frames/
tags: [unity, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

You can process frames from an arbitrary video source by creating Affdex <code>Frame</code> objects and passing them to a <code>Detector</code>. 

{% include unity/v2/add-detector.md %}

### Feeding frames to the Detector
To perform processing, create an Affdex <code>Frame</code> object for each source frame, and pass it to the <code>Detector</code> using the <code>Detector.ProcessFrame</code> method. 

{% include unity/v2/detector-results.md %}