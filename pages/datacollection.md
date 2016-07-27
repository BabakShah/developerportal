---
title:
permalink: /datacollection/
tags: [data, sdk]
audience: writer, designer
keywords:
last_updated:
summary:
metadata: false
---

#### What data do the SDK(s) collect?

As of version 3.1, the mobile SDKs require access to the internet to collect anonymized usage information and metrics data.

- **Usage information**
-- Number of video frames processed
-- Device make and model
-- App name and version
-- Affdex SDK platform and version

- **Metric data**
We collect the predictions of the enabled [expressions](/metrics#facial-expressions), [appearances](/metrics#appearance) and [emotions](/metrics#emotions) classifiers and the [head angles](/metrics#face-tracking-and-head-angle-estimation).

---

#### Why do we collect data?
The data collected is used for improving the SDKs and in training new metrics to help developers understand their app users and improve their apps.

---

#### Can I access the data collected through my app?
Not yet, but we plan to roll out UIs and APIs to allow developers to get access to data collected through their apps.

---

#### Can the metrics data collection be disabled?
Yes, the metrics data collection can be disabled by a developer through an API call available in the SDK.

---

Please feel free to [contact us](mailto:sdk@affectiva.com?subject=Affdex SDK data collection inquiry) with further questions.
