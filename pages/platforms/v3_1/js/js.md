---
title: Affdex SDK for the Web
permalink: /v3_1/javascript/
redirect_from: "/web/"
tags: [js, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---
{% include linkrefs.html %}

SDK Developer Guide Release 3.1

## Using the SDK

The purpose of the SDK is to detect facial expressions and their underlying emotions, appearance and emojis from facial images.

## Getting started

##### 1. Add the Affdex API to your project  

```js
<script src="https://download.affectiva.com/js/3.1/affdex.js"/>
```

##### 2. Capture and analyze faces

Facial images can be captured from different sources. For each of the different sources, the SDK defines a detector class that can handle processing images acquired from that source:

* [How to analyze a camera feed]({{ site.baseurl }}/v3_1/javascript/analyze-camera/)
* [How to analyze a video frame stream]({{ site.baseurl }}/v3_1/javascript/analyze-frames/)
* [How to analyze a photo]({{ site.baseurl }}/v3_1/javascript/analyze-photo/)



##### 4. Check out sample applications on GitHub
Sample applications for processing videos, and connecting to the camera are available for cloning on our [GitHub repository.](http://github.com/Affectiva/js-sdk-sample-apps)


## Requirements & Dependencies

##### Hardware requirements (recommended)

*	Processor, 2 GHz
*	RAM, 1 GB


##### Supported browsers  

The following browsers are supported on desktop platforms. Mobile browser support is planned for a future release.

*	Chrome 51 or higher
*	Firefox 47 or higher
* Opera 37
* Edge 10586
