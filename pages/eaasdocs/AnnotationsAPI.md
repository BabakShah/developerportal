---
title: Media Annotation API
permalink: /annotationapi/
metadata: false
---

Media Annotations are key-value pairs that are attached to media entries.  Within an entry object, the "annotation" key's value will be a URL that returns that entry's annotations.  For example:

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
