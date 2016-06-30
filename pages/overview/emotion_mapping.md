---
title:
permalink: /emotion_mapping/
tags: emotion_mapping
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

#### How do we map facial expressions to emotions?

The Emotion predictors use the observed facial expressions as input to calculate the likelihood of an emotion. Our Facial expression to emotion mapping builds on EMFACS mappings developed by [Friesen & Ekman](http://www.paulekman.com/product-category/facs/). A facial expression can have either a positive or a negative effect on the likelihood of an emotion. The following table shows the relationship between the facial expressions and the emotions predictors.

{%include overview/s_table.html %}

#### How do we calculate valence?
The Valence metric likelihood is calculated based on a set of observed facial expressions:

{%include overview/valence.html %}

#### How do we calculate engagement?

Engagement or expressiveness is a weighted sum of the following facial expressions:

* Brow raise
* Brow lower
* Nose wrinkle
* Lip corner depressor
* Chin raise
* Lip pucker
* Lip press
* Lips part
* Lip suck
