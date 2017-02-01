---
title: Media API
permalink: /eaasapi/
metadata: false
---

The Media processing API can be used to analyze faces in recorded media (images and videos), ex. videos and images to measure and report [facial expressions and emotions](/metrics).

***

### Resources


There are two resources exposed through the API:

**Job**

A job tracks a request to process a piece of media.  It has one input (the media to process) and one result (the metrics). [More information about the different jobs available here](/api/jobnames). Jobs start in the ```queued``` state and stay in that state until they have been picked up by a worker for processing.  When a worker picks up a job it puts it into the ```working``` state.  When the worker finished the job it puts it into the ```done``` state.

**Entry**

An entry represents one piece of media, for example, an MP4 video or a json document containing metrics.

***

### The Job Service


**Locating the Job Service**

The JSON-formatted index provided by [the Index Service](/apioverview) contains the Job Service URL. It is the value associated with the key "jobs".

***

**Creating Jobs**

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

***

**Job Status**

Each job object has a "status" key.  When the job is created its status is "queued" then it changes to "working" when the job is picked up by a worker process.  When the job finishes the status will be either "done" or "error".

***

**Retrieving Jobs**

A GET to a job's URL (i.e., the URL returned in the Location header when the job was created) will return input and result entries of the job, including an array of entries’ representations, each of which includes a link to that representation’s media.

The "Accept" request header should be Accept: application/json.

***

**Retrieving Results from Jobs**

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

***

**Media Content Types**

Each result entry is a container for one item of media, which contains one or more representations (one for each content type). Typical content types include:

* [**application/vnd.affectiva.session.v0+json**](/api/contenttypes) metrics computed for a job in JSON
* [**application/vnd.affectiva.metrics.v0+json**](/api/contenttypes) legacy format - metrics computed for a job in JSON (single face per frame only)
* [**application/csv**](/api/contenttypes)  - metrics computed for a job in CSV

***
