---
title: Emotion as a Service
permalink: /eaasapi/
metadata: false
---

The Emotion as a Service API lets clients use our affective science services. With this API they can upload media, launch processing jobs, request emotional classification of their media and retrieve the resulting metrics.

This document is an add-on to the Cloud API Overview and assumes that the reader has read that document.

Watch the video tutorial below to help you get started on how to use the SDK:
<iframe width="100%" height="400px" src="https://www.youtube.com/embed/VPYCCN2OZgg" frameborder="0" allowfullscreen></iframe>

***

## Resources

There are two resources exposed through the API:

Job
: a job tracks a request to process a piece of media.  It has one input (the media to process) and one result (the metrics)

Entry
: an entry represents one piece of media, for example, an MP4 video or a json document containing metrics.

### Job Names

#### multiface

The multiface job processes video and still images.  It can find and classify up to 50 faces.  It uses the current classifier pack, which at the moment this is CT pack, but that will change as we release new classifier packs.  Metrics are returned using generic keys that won't need to change when the pack changes.  The meaning of the individual classifiers is described in Affectiva’s [developer portal](http://developer.affectiva.com/metrics/).

The JSON document produced by this job is an object with the following keys: content_type, configuration, and frames.  The value of the content_type key is application/vnd.affectiva.session.v0+json.

The configuration object provides a mapping from the generic classifier names to the pack-specific ones.  This is unlikely to be useful except in highly specific cases.

The frames array contains one entry for each frame in the input media.  Each frame is an object with two keys: time, and faces.  The value of the time key is the timestamp relative to the start of the video.  The value of the faces key is an object whose keys are face identifiers and whose values are objects containing the metrics for that face.

#### current-pack

The current-pack job processes a video using the current classifier pack.  At the moment this is CT pack, but that will change as we release new classifier packs.  Metrics are returned using generic keys that won't need to change when the pack changes.  The meaning of the individual classifiers is described in Affectiva’s [developer portal](http://developer.affectiva.com/metrics/).

This job is deprecated since it can handle only videos (not still images) and only one face per frame.  Clients should use the multiface job instead.

The JSON document produced by this job is an object with the following keys: content_type, pack, metric_map, and metrics.  The value of the content_type key is application/vnd.affectiva.metrics.v0+json.  The value of the pack key is the name of the pack that was used to generate the metrics.

The metrics_map provides a mapping from the generic classifier names to the pack-specific ones.  This is unlikely to be useful except in highly specific cases.

The metrics object contains a key for each classifier.  The value of each metric is an array of per-frame values.  One special key is TimeStamp(msec) which provides the timestamp (in milliseconds) for each frame of the input video.  Each array in the metrics object will be the same length.

#### no-op

The no-op job does nothing but indicate that it has finished.  It's useful for testing.

#### ct-pack-*

The ct-pack-linear and ct-pack-hybrid jobs process a video using the CT pack classifiers.  Metrics are returned "raw" in that the metrics keys are the CT pack classifier names such as smilect and au02ct.  We recommend that you use the current-pack job (which has better forward-compatibility) unless you know that you need to run the CT pack specifically.

### Job States

Jobs start in the queued state and stay in that state until they have been picked up by a worker for processing.  When a worker picks up a job it puts it into the working state.  When the worker finished the job it puts it into the done state.

## The Job Service

### Locating the Job Service

Clients should use the job service only via a URL provided by the Index Service.  The Cloud API Overview describes how to use the Index Service.

In the JSON-formatted index, the Job Service URL will be the value associated with the key "jobs".

### Creating Jobs

A multipart encoded form POST to the Job Service URL creates a new job. There is one required parameter and another optional parameter

| parameter | description | optionality |
|---|---|---|
| entry_job[input] | a media file to be processed | required |
| entry_job[name] | the job name to process the media. Valid names are multiface, no-op, ct-pack-linear, and ct-pack-hybrid | optional: if no name is provided, multiface is assumed |

The Accept request header should be Accept: application/json. By default the server will try to guess the media's content type based on its filename.

Example:

```http
POST JobServiceURL HTTP/1.1
Accept: application/json
```

Response:

The "Location" header will contain the URL of the newly-created job, and a JSON representation of the job will be returned in the body of the response.

```
{ "updated":"2013­06­26T21:28:39Z",
"published":"2013­06­26T21:28:39Z",
"self": "Job URL",
...
"status": "queued",
"input": []
}
```

Using curl, a media file can be uploaded from the command line using:

```shell
curl ­­form "entry_job[input]=@{media file}" JobServiceURL
```

### Job Status

Each job object has a "status" key.  When the job is created its status is "queued" then it changes to "working" when the job is picked up by a worker process.  When the job finishes the status will be either "done" or "error".

### Retrieving Jobs

A GET to a job's URL (i.e., the URL returned in the Location header when the job was created) will return input and result entries of the job, including an array of entries’ representations, each of which includes a link to that representation’s media.

The "Accept" request header should be Accept: application/json.

### Retrieving Results from Jobs

Each media entry (inputs and results) in the output of the Job’s content list (obtained by "Retrieving Jobs" above) will include a list of representations. Each representation is a different encoding of the same data, for example, json and csv.  Each json object that holds a representation's metadata contains a URL (with the key media) that can be used to download that representation.  In some cases, the server will respond to a GET request to the media URL with a 302 (i.e., HTTP redirect) so the client must be prepared to follow that redirect if necessary.

Example CSV-encoded result representation data:

```json
{
  "representations": [
    {
        "content_type": "application/vnd.affectiva.session.v0+json",
        "file_name": "face-video.mp4-metrics.json",
        "media": "URL to download this representation's media",
        "self": "URL of this representation"
    },
    {
        "content_type": "application/csv",
        "file_name": "face-video.mp4-metrics.csv",
        "media": "URL to download this representation's media",
        "self": "URL of this representation"
    }
  ]
}
```

### Media Content Types

Each result entry is a container for one item of media, which contains one or more representation (one for each content type). Typical content types include:

* <strong>application/vnd.affectiva.session.v0+json</strong> ­ metrics computed for a job in JSON
* <strong>application/vnd.affectiva.metrics.v0+json</strong> ­ legacy format - metrics computed for a job in JSON (single face per frame only)
* <strong>application/csv</strong> - metrics computed for a job in CSV

#### application/vnd.affectiva.session.v0+json JSON Format

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

The "configuration" is a map between the "friendly" metrics names and the underlying classifiers.  The friendly names are easier to understand and will likely be more forward-compatible when new packs are released.  The friendly name "smile", for example, corresponds to "smilect_nonlinear_causal" in the current CT pack.  When we release a new pack the friendly name will continue to be "smile" but the classifier name will likely be different.

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

#### application/vnd.affectiva.metrics.v0+json legacy JSON Format

This is our recommended format for retrieving metrics because it contains more metadata than the CSV format allows.  The metrics v0 format is a JSON object that contains the following keys:

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

The "metric_map" is a map between the "friendly" metrics names and the underlying classifiers.  The friendly names are easier to understand and will likely be more forward-compatible when new packs are released.  The friendly name "smile", for example, corresponds to "smilect_nonlinear_causal" in the current CT pack.  When we release a new pack the friendly name will continue to be "smile" but the classifier name will likely be different.

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

The value of the "pack" key indicates the classifier pack used to process the media, for example "ct-hybrid".

#### application/csv Comma-Separated-Value Format

This is a lowest-common-denominator CSV format.  We recommend using the application/vnd.affectiva.metrics.v0+json format instead.

The header row contains the "firiendly" classifier names, e.g., "smile".  Each value in each non-header row contains either the string "TF" (indicating that the face tracker did not find a face in that frame) or a number indicating that classifier's output for that frame.

### Media Annotations

Annotations are key-value pairs that are attached to media entries.  Within an entry object, the "annotation" key's value will be a URL that returns that entry's annotations.  For example:

```http
GET EntryURL HTTP/1.1
Accept: application/json
```

Response:

```json
{
    "annotations": "EntryAnnotationURL",
    "author": "author@affdex.com",
    "source": "Affectiva/Documentation",
    "media_seconds": 29.0,
    "published": "2016-06-28T11:50:48-04:00",
    "representations": [
        ...
    ],
    "self": "EntryURL",
    "updated": "2016-06-28T11:50:48-04:00"
}
```

A GET to the EntryAnnotationURL returns the annotations:

```http
GET EntryAnnotationURL HTTP/1.1
Accept: application/json
```

Response:

```json
[
    {
        "author": "author@affdex.com",
        "source": "Affectiva/Documentation",
        "entry": "EntryURL",
        "key": "foo",
        "self": "Annotation1URL",
        "value": "bar"
    },
    {
        "author": "other@affdex.com",
        "source": "Affectiva/Documentation",
        "entry": "EntryURL",
        "key": "key2",
        "self": "Annotation2URL",
        "value": "value2"
    }
]
```

A POST to the EntryAnnotationURL creates a new annotation.  Two parameters are required: annotation[key] and annotation[value]. The maximum length of each key and each value is 255 characters.

A third parameter is optional: annotation[source].  The source parameter is stored with the annotation and can be used to track the source of the annotation.  By convention, the source value should start with the API client's company name, so annotations created by Affectiva code will start with "Affectiva".

```http
POST EntryAnnotationURL HTTP/1.1
Accept: application/json
Content-Type: application/json

{
    "annotation": {
        "source": "Affectiva/Documentation",
        "key": "foo2",
        "value": "bar2"
    }
}
```

Response:

```json
{
    "author": "author@affdex.com",
    "source": "Affectiva/Documentation",
    "entry": "EntryURL",
    "key": "foo2",
    "self": "AnnotationURL",
    "value": "bar2"
}
```
