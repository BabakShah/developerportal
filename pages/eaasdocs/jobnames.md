---
title: API Job Names
permalink: /api/jobnames/
metadata: false
---

The following are the list of [jobs](/eaasapi) that are available through the API.

#### multiface

The multiface job processes video and still images.  It can find and analyze up to 50 faces.  By default it uses our latest emotion and expression classifiers available. [The Metrics](/metrics) keys don't change when a new classifier version is released to the API.

The JSON document produced by this job is an object with the following keys: content_type, configuration, and frames.  The value of the content_type key is [application/vnd.affectiva.session.v0+json](/api/contenttypes).

***

#### sdk-metrics

The sdk-metrics processes video and still images, using the same metric versions provided by our Emotion SDKs.  These metric classifiers are less resource-intensive than those used by the multiface job, at a small reduction in accuracy.  It uses the [application/vnd.affectiva.session.v0+json](/api/contenttypes) format.

***

#### no-op

The no-op job does nothing but indicate that it has finished.  It's useful for testing.

***

#### current-pack (deprecated)

The multiface job processes video and still images.  It can find and analyze up to 50 faces.  By default it uses our latest emotion and expression classifiers available. [The Metrics](/metrics) keys don't change when a new classifier version is released to the API.

This job is deprecated since it can handle only videos (not still images) and only one face per frame.

The JSON document produced by this job is an object with the following keys: content_type, pack, metric_map, and metrics.  The value of the content_type key is [application/vnd.affectiva.metrics.v0+json](/api/contenttypes).
