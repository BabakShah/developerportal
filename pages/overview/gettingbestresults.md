---
title: Getting Optimal Results from the SDK
permalink: /gettingbestresults/
audience: writer, designer
tags: overview
keywords:
last_updated:
summary:
metadata: false
---  


The Affdex SDK builds on our real world experience analyzing millions of faces worldwide, both online and offline. The SDK handles variances in gender, age, and ethnicity with high accuracy, and has been cross-culturally validated on real world data.  While accommodating a variety of lighting conditions and head orientations, the SDK produces best results when people face the screen and their facial features are visible. Obstructions to the face, such as a hand over the mouth, will result in a temporary loss of facial expression data so developers should advise users to avoid such obstructions.

### Cameras

Recommended:

* RGB camera
* Minimum resolution 320x240
* 10 frames per second minimum frame rate

We have found that the classification performance is good as long as the subject’s face occupies at least 30x30 pixels within an image. Ideally the larger the face the better (assuming that the whole face - including eyebrows, lips and eye corners - is within view of the camera).

### Head pose

The performance is best with frontal head pose. The system performs well with head rotations (pitch, yaw and roll) up to 25 degrees from frontal.  We have not extensively evaluated performance beyond these limits.  If possible, we suggest encouraging the subject to position the camera/hold the mobile device such that their face is roughly center and frontal.

The position of the head (x and y coordinates) within the images is not very important - as long as the eye corners, eyebrows and lips are all visible.  If any of these features are occluded, face tracking will be impeded and may lead to receiving only partial results.

  <img src="{{ "/images/graphic5.png" | prepend: site.baseurl }}" style="display: block; margin-left: auto; margin-right: auto;" />

### Lighting

The Affdex algorithms are very robust in diverse lighting conditions. However, for best results have the subjects lit uniformly and avoid strong lights in the background.
