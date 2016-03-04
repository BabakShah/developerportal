---
title: Metrics
permalink: /metrics/
tags: []
keywords:
audience:
last_updated:
summary:
metadata: false
---
{% include linkrefs.html %}

The face provides a rich canvas of emotion. Humans are innately programmed to express and communicate emotion through facial expressions. Affdex scientifically measures and reports the emotions and facial expressions using sophisticated computer vision and machine learning techniques. When you use the Affdex Mobile SDK in your applications, you will receive facial expression output from Affdex in the form of Affdex metrics: seven emotion metrics, two composite metrics measuring the emotional experience, 15 facial expression metrics, and 13 emojis.

## Emotions

{%include overview/emotions_table.html %}

Furthermore, the SDK allows for measuring valence and engagement, as alternative metrics for measuring the emotional experience.

<strong>Engagement</strong>: A measure of facial muscle activation that illustrates the subject’s expressivness. The range of values is from 0 to 100.

<strong>Valence</strong>: A measure of the positive or negative nature of the recorded person's experience. The range of values is from -100 to 100.

***

## Facial Expressions

{%include overview/expressions_table.html %}

***

## Emoji Expressions

{%include overview/emojis_table.html %}

***

## Using the Metrics
Emotion, Expression and Emoji metrics scores indicate when users show a specific emotion or expression (e.g., a smile) along with the degree of confidence. The metrics can be thought of as detectors: as the emotion or facial expression occurs and intensifies, the score rises from 0 (no expression) to 100 (expression fully present).

In addition, we also expose a composite emotional metric called _valence_ which gives feedback on the overall experience. Valence values from 0 to 100 indicate a neutral to positive experience, while values from -100 to 0 indicate a negative to neutral experience.

<img src="{{ "/images/graphic1.png" | prepend: site.baseurl }}" />

<br />

***

## Appearance

<img src="{{ "/images/graphic6.png" | prepend: site.baseurl }}" align="right" />

Our SDKs also provide the following metrics about the physical appearance:

**Gender**

The gender classifier attempts to identify the human perception of gender expression. In the case of video or live feeds, it tracks a face over a window of time to build confidence in its decision. If the classifier is unable to reach a decision, the gender is reported as "Unknown".


**Glasses**  

A confidence level of whether the subject in the image is wearing eyeglasses or sunglasses.  

<br />
<br />

***

## Face Tracking and Head Angle Estimation

<img src="{{ "/images/graphic7.png" | prepend: site.baseurl }}" align="right">

<br />

The SDKs include our latest face tracker which calculates the following metrics:

**Facial Landmarks Estimation**

The tracking of the cartesian coordinates for the [facial landmarks](/fpi/).

**Head Orientation Estimation**

Estimation of the head position in a 3-D space in Euler angles (pitch, yaw, roll).

**Interocular Distance**

The distance between the two outer eye corners.

<br />
<br />
