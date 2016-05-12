---
title: Emotion as a Service
permalink: /eaasapi/
metadata: false
---

The Emotion as a Service API lets clients use our affective science services. With this API they can upload video content, establish processing jobs, request emotional classification of their video data and retrieve the resulting metrics.

This document is an add-on to the Cloud API Overview and assumes that the reader has read that document.

## Resources

There are two resources exposed through the API:
<strong>Entry</strong> - an entry represents one piece of media, for example, an MP4 video or a json document containing metrics.
<strong>Job</strong> - a job tracks a request to process a piece of media.  It has one input (the media to process) and one result (the metrics).

### Job Names

#### current-pack

The current-pack job processes a video using the current classifier pack.  At the moment this is CT pack, but that will change as we release new classifier packs.  Metrics are returned using generic keys that won't need to change when the pack changes.  The meaning of the individual classifiers is described in Affectiva’s [developer portal](http://developer.affectiva.com/metrics/).

The JSON document produced by the current-pack job is an object with the following keys: content_type, pack, metric_map, and metrics.  The value of the content_type key is application/vnd.affectiva.metrics.v0+json.  The value of the pack key is the name of the pack that was used to generate the metrics.

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

In the JSON­formatted index, the Job Service URL will be the value associated with the key "jobs".

### Creating Jobs

A POST to the Job Service URL creates a new job. There is one required parameter and another optional parameter

| parameter | description | optionality |
|---|---|---|
| entry_job[input] | a media file to be processed | required |
| entry_job[name] | the job name o process the file. Valid names are no-op, pa-pack, ct-pack-linear, ct-pack-hybrid, and current-pack | optional: if no name defined, current-pack is assumed |

The Accept request header should be Accept: application/json. If successful, the response body will contain a representation of the session in json format.  The HTTP Location response header and the JSON self key will contain the newly created session's URL.

Example:

```http
POST JobServiceURL HTTP/1.1
Accept: application/json
Response:
Location: JobURL
{ "updated":"2013­06­26T21:28:39Z",
"published":"2013­06­26T21:28:39Z",
"self": "Job URL",
...
"input": []
}
```

### Retrieving Jobs

A GET to a job's URL (i.e., the URL returned in the Location header when the job was created) will return input and result entries of the job, including an array of entries’ representations, each of which includes a link to that representation’s media.

The "Accept" request header should be Accept: application/json.

### Creating Jobs (i.e., Uploading Media)

POST a multipart encoded form to the job's url. The media parameter name is "entry_job[input]". By default the server will try to guess the media's content type based on its filename.

There is one optional parameter:
entry_job[name] - the job name to process the file.  Valid names are current-pack, no-op, pa-pack, ct-pack-linear, and ct-pack-hybrid.

For example, using curl, a media file can be uploaded from the command line using:

```shell
curl ­­form "entry_job[input]=@{media file}" JobsURL
```

### Retrieving Results from Jobs

Each media entry (inputs and results) in the output of the Job’s content list (obtained by "Retrieving Jobs" above) will include a list of representations. Each representation is a different encoding of the same data, for example, json and csv.  Each json object that holds a representation's metadata contains a URL (with the key media) that can be used to download that representation.  In some cases, the server will respond to a GET request to the media URL with a 302 (i.e., HTTP redirect) so the client must be prepared to follow that redirect if necessary.

Example CSV-encoded result representation data:

```json
{
  "content_type": "application/csv",
  "media": "media URL",
  "media_filename": "1f351848-c142-4c95-985c-184524b03e7e_poses.mp4-metrics.csv",
  "self": "entry URL",
  "updated": "2014-09-09T13:16:32Z"
}
```

### Media Content Types

Each result entry is a container for one item of media, which contains one or more representation (one for each content type). Typical content types include:

<strong>application/vnd.affectiva.metrics.v0+json</strong> ­ metrics computed for a job in JSON
<strong>application/csv</strong> - metrics computed for a job in CSV
