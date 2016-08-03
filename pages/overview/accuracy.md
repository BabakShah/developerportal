---
title: Accuracy
permalink: /accuracy/
audience: writer, designer
tags: overview
keywords:
last_updated:
summary:
metadata: false
---
<img src="{{ "/images/graphic4.png" | prepend: site.baseurl }}" align="right">

<br />
We continuously train and test our emotion-sensing metrics to provide the most reliable and accurate classifiers. Our key emotions achieve accuracy in the high 90th percentile.  
<br />
Our emotion metrics are trained and tested on very difficult datasets.  We sampled our test set, comprised of hundreds of thousands of facial frames, from more than 3.2 million facial videos.  This data is from more than 75 countries, representing real-world, spontaneous facial expressions, made under challenging conditions, such as varying lighting, different head movements, and variances in facial features due to ethnicity, age, gender, facial hair and glasses.  
<br />

## How do we measure our accuracy?

Affectiva uses the area under a <a href="https://en.wikipedia.org/wiki/Receiver_operating_characteristic" target="_blank">Receiver Operating Characteristic</a> (ROC) curve to report detector accuracy as this is the most generalized way to measure detector accuracy. The ROC score values range between 0 and 1 and the closer the value to 1 the more accurate the classifier is.
Many facial expressions, such as smile, brow furrow, inner brow raise, brow raise, and nose wrinkle have an ROC score of over 0.9.

Some,  more nuanced, facial expressions, which are much harder for even humans to reliably identify, include    lip depressor, lip pucker and eye closure. These have an ROC score of over 0.8.

The classifiers for emotions have ROC scores greater than or equal to 0.8, with expressions of joy, disgust, contempt and surprise the most accurately detected. Expressions of anger, sadness and fear tend to be more nuanced and subtle and are therefore harder to detect resulting in scores at the lower end of the range.

The gender classifier uses the face bounding box tracked over a window of time, if available, to build confidence in its decision. If the confidence level does not meet the threshold within a window of 10 seconds, the gender is reported as _unknown_. The ROC score of the classifier is 0.95 and the average length of time taken to reach a decision is 3.4 seconds.  The ROC score of the glasses classifier is 0.9.

At the current level of accuracy, the ethnicity and age classifiers are more useful as a quantitative measure of demographics than to correctly identify the age and ethnicity on an individual basis. We are always looking to diversify the data sources included in training those metrics to improve their accuracy levels.

The emojis are driven by the expression classifiers. Classifiers for Tongue Out, Wink and Eye Widen expressions were introduced to increase the range of emojis supported. These have an ROC score of over 0.8.  

## Effects of changes in head angles and face luminance

The best performance is in a range of +/- 25 degrees frontal, outside of which accuracy begins to suffer. Furthermore, for the effect of the differences in lighting conditions on accuracy, the classifier accuracy drops only when the face is extremely poorly illuminated or backlit. This occurs when the average pixel brightness of the face falls below 30 on a scale of 0 (pitch black) to 255 (white). In the example below, our classifiers can handle the three images on the right.

<img src="{{ "/images/lighting.png" | prepend: site.baseurl }}" align="center" style="height: 100%; width: 100%">

## Cultural differences

Many scientific studies demonstrate the universality of facial expressions of emotions; however, each culture employs what we call "display rules”—culturally-specific rules that govern when people amplify, dampen or altogether mask a facial expression of emotion. The research demonstrating the effect of display rules is extensive, covers the past 50 years, and is widely acknowledged. In Southeast Asia there are very clear display rules around how to display emotion, especially in the presence of strangers (a work meeting, a moderator in a research study, etc.): namely, dampen their expressions, especially negative ones.

Our classifiers are trained against our massive emotion data repository that reflects data from 75 countries.   This has hardened our technology to account for cultural differences with high accuracy.
