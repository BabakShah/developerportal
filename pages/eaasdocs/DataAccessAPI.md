---
title: MR Data Access API
permalink: /dataapi/
metadata: false
---

This API provides access to study-level data in the Affdex Market Research system.

This document is an add-on to the Cloud API Overview and assumes that the reader has read that document.

## The Project Service

The project service provides access to project-level data.

### Locating the Project Service

Clients should use the project service only via a URL provided by the index service.

In the JSON-formatted index, the project service URL will be the value associated with the key "project".

### Locating a Project

Before using a project, a client must locate the URL of that project.  We use the "project code" as a key to a project, so that is passed to the project service as a URL parameter.

To locate a project, make a GET request to the project service root URL, with two parameters named "project_code" and "client_prefix".  For example:

```http
GET ProjectServiceURL?client_prefix=acme_industries&project_code=acme_anvils HTTP/1.1
Accept: application/json
```

The response will be an array of objects, each describing one project.

```json
[
  {
    "name":"Acme Anvils Project",
    "client_prefix":"acme_industries",
    "project_code":"acme_anvils",
    "self":"ProjectURL"
    ...
  }
]
```

A project can also be located by providing only the “project code”. The call will return any projects with that code that the user has permission to view. This is mostly a unique code, but on the off chance that two projects with the same “project code” belong to two different clients both with user permissions, both projects will be returned. To locate a project with the “project code” only, make a GET request to the project service root URL, with one parameter named "project_code".  For example:

```http
GET ProjectServiceURL?project_code=acme_anvils HTTP/1.1
Accept: application/json
```

The response will be an array of objects, each describing one project.

```json
[
  {
    "name":"Acme Anvils Project",
    "client_prefix":"acme_industries",
    "project_code":"acme_anvils",
    "self":"project URL"
    ...
  }
]
```

### Reading Project Index Data

A GET request to the project "self" URL will return the project index: a list of the data available for that project, and the operations that can be requested to act upon that project.

The "Accept" request header should be "Accept: application/json".
Example:

```http
GET ProjectURL HTTP/1.1
Accept: application/json
```

Response:

```json
{
"name":"Acme Anvils Project",
"client_prefix":"acme_industries",
"project_code":"acme_anvils",
"self":"project URL",
"market":"market URL",
"norm_project_type_dimension": "online",
"websessions":"websessions URL"
"jobs":
{
"job 1 url":
{
"self": "job 1 url"
"status": "open"
}
},
"operations": { project operation metadata }
"data":
{
"application/vnd.affectiva.affdex_score+json":
{
"content_type":"application/vnd.affectiva.affdex_score+json",
"self": "affdex score URL"
"updated":"2013-06-27T16:21:35Z",
"published":"2013-06-27T16:21:35Z"
},
"application/vnd.affectiva.dashboard+json":
{
"content_type":"application/vnd.affectiva.dashboard+json",
"self": "dashboard JSON URL"
"updated":"2013-06-27T16:21:35Z",
"published":"2013-06-27T16:21:35Z"
},
"application/vnd.affectiva.summary_metrics+json":
{
"content_type":"application/vnd.affectiva.summary_metrics+json",
"self": "summary metrics URL"
"updated":"2013-06-27T16:21:35Z",
"published":"2013-06-27T16:21:35Z"
},
"application/vnd.affectiva.data_quality+json":
{
"content_type":"application/vnd.affectiva.data_quality+json",
"self": "data quality report URL"
"updated":"2013-06-27T16:21:35Z",
"published":"2013-06-27T16:21:35Z"
}
}
"updated":"2013-06-27T16:21:35Z",
"published":"2013-06-27T16:21:35Z"
}
```

### Project Data

The value of the project "data" key will be an object containing objects.  The keys are the data item content types, and the values are objects with metadata about each data item.

Each media object will have at least two keys, "content_type" and "self".  The "self" URL can be used to request the data.  Note that because of Affdex implementation quirks, some "self" URL's are time-limited, so clients should follow them as soon as possible after requesting a project index.

Not all projects will contain all content types, for example, a project may not contain an "application/vnd.affectiva.dashboard+json" type if the project's dashboard has not been generated yet.

#### Affdex Score

The content type for the affdex score is "application/vnd.affectiva.affdex_score+json".

#### Summary Metrics

The content type for the summary metrics is "application/vnd.affectiva.summary_metrics+json".

#### Data Quality Report

The content type for the data quality report is "application/vnd.affectiva.data_quality+json".

#### Dashboard

The content type for the dashboard json is "application/vnd.affectiva.dashboard+json".

### Project Operations

The value of the project "operations" key will be an object containing objects.  The keys are the operation names, and the values are objects with metadata about each operation.
Example:

```json
"operations":
{
"operation1_name":
{
"name": "operation1_name",
"self": "operation1 initiation URL"
},
"operation2_name":
{
"name": "operation2_name",
"self": "operation2 initiation URL"
}
}
```

#### Summarize

This operation is initiated when the client wants Affdex to calculate the various project summaries such as the Affdex Score, the dashboard, and the summary metrics.  The client must use the HTTP POST method to initiate summarization.  The result of the POST will be to initiate the summarization job, and the response will include a URL that the client can use to track the status of that job.
Example:

```http
POST URL provided in "Project Operations" above HTTP/1.1
Accept: application/json
```

Response:
```json
{
  "project":"project URL",
  "self": "URL to track job status"
}
```

#### Set Parameter

This operation is initiated when the client is ready to transition new face recordings from test mode into live mode. By default, when a project is created, any face video recorded for that project is tagged as a “test” session. These sessions will not be included in the final results. When the client is ready to go into the field and collect live data, he can call this API and set the default session type to be “live”. These sessions will be included in the final results.

Example:

```http
POST URL provided in “Project Operations” above HTTP/1.1
Accept: application/json
Content-Type: application/json
{"key":"default_session_type", "value":"live"}
```

Response:

```json
{
  "self":"project URL",
  "session_type": “live”
}
```

### Project Jobs

Each project can have several jobs in progress at any time.  The value of the project "jobs" key will be an object containing objects.  The keys are the job URL's, and the values are objects with metadata about each job.  Each object will contain at least two keys: a "self" URL that can be used to request that job's metadata individually, and "status" which will be the job's current status.

### Project Websessions

Each project can have many web sessions, each representing a face video. To retrieve a list of the sessions for a project, a client may issue a GET to the websessions URL indicated in the project payload. The response will be a list of sessions with the following format:

```json
{
  "participant_name" : "47_TSTZN77N",
  "coverage" : "98.21",
  "status" : "PROCESSED",
  "session_type" : "live",
  "exposure" : "1",
  "data" : {}
}
```

The data section will contain a URL for that session's prometrics, if they exist. If there are no prometrics for the session, the "data" section will be blank. A session that has prometrics will contain these attributes in the data section:

```json
"data" : {
  "application/vnd.affectiva.prometrics+json": {
    "content_type" : "application/vnd.affectiva.prometrics+json",
    "self" : "prometrics URL"
  }
}
```

To retrieve the prometrics, a client can issue a GET request to the prometrics URL. This will return the prometrics in the following JSON format:

```json
{
  "content_type" : "application/vnd.affectiva.prometrics+json",
  "data" : {
    "classifier_name_1" : [ frame-by-frame metrics ],
    "classifier_name_2" : [ frame-by-frame metrics ],
    "classifier_name_3" : [ frame-by-frame metrics ],
    ...
  }
}
```

Prometrics files are normalized to 14 frames per second.

## Creating a Project

Projects are created by sending a POST request to the project service root URL.  The body of the POST request should be a JSON object, and the request should include a "Content-Type: application/json" header.  The response will be a redirect to the newly-created project's URL.

Example:

```http
POST project service URL HTTP/1.1
Accept: application/json
Content-Type: application/json
{"portal_project":{"name":"ACME Roadrunner Trap"},"market":"USA - English","duration":30.1}
```

Response: (same response as show project)

```json
{
  "name":"Project Name",
  "self":"https://prod-qual.affectiva.com/projects/98765"
  ...
}
```

Response Codes:
302 - New project URL will be in the location header
422 - Unprocessable Entity - Error creating project - invalid data

The following JSON object keys are recognized:

<code>portal_project : { name : "", description:" " }</code>

The project name field is always required.  It must be unique within its owning client and partner.

The description field is optional. If it is omitted, it will default to the name field. Max length 100

<code>market</code>

The project's market (shown in the user interface in the "Fieldwork Market" field).  It must be a valid value.

<code>client</code>

The client that will own this project.  Use the client's "prefix" field to identify the client.  This field is only required if the login sending the POST request has permission to access more than one client.  If the login has permission to access only one client, the project will be owned by that client.

<code>partner</code>

The partner that will own this project.  Use the partner's "prefix" field to identify the partner.  This field is rarely needed, usually only by Affectiva personnel with permission to access more than one partner.

<code>duration</code>

This is an optional field.  If provided, the project will be provisioned with one media item with the provided duration.  If not provided, no media will be provisioned.

## Creating Media Files

Media files are created by sending a POST request to the project media root URL. ( found in the project details JSON in the “media” key ). You can create a media file with a specific duration without uploading a specific file. The body of the POST request should be a JSON object, and the request should include a “Content-Type: application/json” header. The response will be a redirect to the newly-created media file’s URL.
Example:

```http
POST project media URL HTTP/1.1
Accept: application/json
Content-Type: application/json
{"dashboard_label":"Ad 1 - 30 seconds", "id":"unique_media_string", "duration":30.1, "file": <uploaded file>}
```

The following JSON object keys are recognized:

<code>duration</code>

This is a required field if no file is attached, otherwise it will be automatically calculated from the uploaded file. This is the duration in seconds of the ad.

<code>file</code>

This is the media file that is being tested. The duration of the video will be automatically calculated after upload, and will be reflected in the duration parameter once it has completed.

<code>id</code>

This is an optional field. It is a unique identifier that will be used to associate a face video recording with a specific media file. If it is not specified, it will be automatically generated by the system.

<code>dashboard_label</code>

This is an optional field. It is the label for the ad that will appear on the final dashboard results. If it is not specified, it will be automatically generated by the system.

## Classifier Names

Each classifier has two names: a scientific name and a human-readable name. Different documents that are intended for different purposes sometimes use different names, but they can be mapped from one to the other.  Different versions of our classifiers are released periodically and the pattern that they follow is generally [HumanReadableName] + [two letter abbreviation for pack]. Our most recent pack is CT pack.
