---
title: Content Types
permalink: /api/contenttypes/
metadata: false
---

### application/vnd.affectiva.session.v0+json JSON Format

This is our recommended format for retrieving metrics because it contains more metadata than the CSV format allows.  The session v0 format is a JSON object that contains the following keys:

```json
{
  "content_type": "application/vnd.affectiva.session.v0+json",
  "configuration": {
  ...
  },
  "frames": [
  ...
  ]
}
```

The value of the content_type key is "application/vnd.affectiva.session.v0+json".

The "configuration" is a map between the "friendly" metrics names and the underlying classifiers.  The friendly names are easier to understand and will likely be more forward-compatible when new packs are released.  The friendly name "smile", for example, corresponds to "smile_nonlinear_causal" in the current DE pack.  When we release a new pack the friendly name will continue to be "smile" but the classifier name will likely be different.

The "frames" array contains the values of each metric for each frame and face in the video.  It's an array with one entry per input frame.  Each frame is an object with two keys: time, and faces.  The value of the time key is the timestamp relative to the start of the video.  The value of the faces key is an object whose keys are face identifiers and whose values are objects containing the metrics for that face.

```json
    {
      "time": 59.637,
      "faces": {
        "3": {
          "lip suck": 0,
          ...
          "mean face luminance": 144.5374
        },
        "4": {
          "lip suck": 0.1,
          ...
          "mean face luminance": 67.9999
        }
      }
    }
```

***

### application/vnd.affectiva.metrics.v0+json legacy JSON Format

This is a legacy json format for retrieving metrics from the "current-pack" job.  It's preferred over CSV because it contains more metadata than the CSV format allows, but is limited to only one face per frame.  The metrics v0 format is a JSON object that contains the following keys:

```json
{
  "content_type": "application/vnd.affectiva.metrics.v0+json",
  "metric_map": {
  ...
  },
  "metrics": {
  ...
  },
  "pack": pack name
}
```

The value of the content_type key is "application/vnd.affectiva.metrics.v0+json".

The "metric_map" is a map between the "friendly" metrics names and the underlying classifiers.  The friendly names are easier to understand and will likely be more forward-compatible when new packs are released.  The friendly name "smile", for example, corresponds to "smile_nonlinear_causal" in the current pack.  When we release a new pack the friendly name will continue to be "smile" but the classifier name will likely be different.

The "metrics" object contains the values of each metric for each frame in the video.  The keys are the friendly metrics names, such as "smile" and "joy".  The value of each key is an array of entries, one per frame in the input video.  Each entry in the array can be either the string "TF" (indicating that the face tracker did not find a face in that frame) or a number indicating that classifier's output for that frame.

```json
{
  ...
  "metrics": {
  ...
    "smile":[1.10693264,1.54680443,2.11125374,"TF","TF", ... ],
    "joy":[1.10693264,1.54680443,2.11125374,"TF","TF", ... ]
  }
}
```

Per-frame time stamps are stored in the metrics object with the key "time stamp (msec)".

The value of the "pack" key indicates the classifier pack used to process the media, for example "de-hybrid".

***

### application/csv Comma-Separated-Value Format

This is a lowest-common-denominator CSV format.  We recommend using the application/vnd.affectiva.metrics.v0+json format instead.

The header row contains the "firiendly" classifier names, e.g., "smile".  Each value in each non-header row contains either the string "TF" (indicating that the face tracker did not find a face in that frame) or a number indicating that classifier's output for that frame.
