---
title: Overview
permalink: /apioverview/
redirect_from: "/api/"
metadata: false
---

The cloud APIs provide access to Affectiva latest Emotion AI. They can be used to upload and analyze images and videos to look for [emotion metrics](/metrics). In addition, submit annotations, such as subjects age and gender, context labels that are associated with the uploaded media.

***

### Credentials to access the APIs

To get credentials to use the API, [please contact us](mailto:sdk@affectiva.com?subject=Sign up to use the API).

Check [the pricing section](/#pricing) for more details on the different pricing options.

***

### Connecting to the APIs

Our APIs use HTTP Basic Access Authentication to authenticate clients.  HTTP Basic Authentication relies on a TLS transport to ensure that the credentials cannot be seen by a third party, so all API communications must be transmitted over a TLS-protected channel.  Please ensure that your Index Service API begins with “https” before using it.

Credentials should be encoded in an Authorization header per section 10.2 of RFC 1945.  This technique is recommended and is typically well-supported by HTTP client programming toolkits. The user names typically include an @ character which needs to be URL-encoded as %40.  The password also needs to be URL-encoded.

***

### The Index Service


The index service is the "root" of our APIs. Begin the API session by requesting the index from the index service which then can be used to locate the API to interact with. An API client should be able to perform all of its operations given only one pre-configured URL: https://index.affectiva.com/.  Any other URL should be provided by the service.

The index service is read-only, so the only HTTP operation supported is GET. The index is available in two representations: JSON, and HTML. JSON is intended for machine consumption and HTML is human-readable.

To request the JSON index, use an Accept: application/json header.

The JSON index is a hash where the keys are the API versions available. The value associated with each key is in turn a hash of service names to the service URLs available to that API version. This allows us to evolve the API without breaking backwards compatibility, to phase out older versions of the API/services in an orderly fashion, and to expose service suites that may be under development or experimental.

To request the HTML index, use an Accept: text/html header.

Example:

```http
GET https://index.affectiva.com/ HTTP/1.1
Accept: application/json
```

Response:

```json
{
    "development": {
        ...
        "project": "project service URL"
        ...
    },
    "v0": {
        ...
        "project": "project service URL"
        ...
    }
}
```

***

### Example: Connecting to the Index Service


These examples connect to the API service and request the index, so they test http communication, basic authentication, and content negotiation.  Once you can get a simple program like these to work in your language of choice, you've got a solid platform to build on.

{% include apidocs/codetabs.md %}

***

### Versions


The Index Service allows clients to choose which version of the API they would like to use.  In general, API versions denote incompatible changes, so “v1” should be considered incompatible with “v2”.  The special “development” version is volatile and shouldn’t be used for production code.

***
