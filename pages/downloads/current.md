---
title:
permalink: "/downloads/current/"
redirect_from: /downloads/
metadata: false
---

#### Sign up for a free evaluation license

Use [this form](http://www.affectiva.com/45-day-free-trial/) to signup for a free 45-day license to use the SDK. Once the form is submitted, you should receive an email containing the license file to use with the SDK.  

Contact our [sales team](mailto:sales@affectiva.com?subject=Affdex SDK Licensing Inquiry) for more information about Developer and/or Commercial Distribution licenses.  

Contact our [gaming team](mailto:gaminginfo@affectiva.com?subject=Get Affdex SDK Unity Plugin) if you would like to use the Unity SDK.  

#### Download the SDK

Use the download links below to download the latest version of the SDK:

{% if site.data.downloads.builds_count.stable > 0 %}
#### Stable Release
{% include custom/download_table.html build_status="stable" %}
{% endif %}

{% if site.data.downloads.builds_count.beta > 0 %}
#### In Development

Download release candidates of the SDK. The release candidates are in the final stage of testing. Feel free to [report bugs](mailto:sdk@affectiva.com?subject=Bug Report).  

{% include custom/download_table.html build_status="beta" %}
{% endif %}

{% if site.data.downloads.builds_count.legacy > 0 %}
Download an [older release](/downloads/previous).
{% endif %} 
