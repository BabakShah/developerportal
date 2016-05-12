---
title:
permalink: "/downloads/current/"
redirect_from: /downloads/
metadata: false
---

#### Sign up for a free evaluation license

Use [this form](http://www.affectiva.com/45-day-free-trial/) to signup for a free 45-day license to evaluate the SDK. Once the form is submitted, you'll receive an email containing the license file to use with the SDK.  

Contact our [sales team](mailto:sales@affectiva.com?subject=Affdex SDK Licensing Inquiry) for more information about Developer and/or Commercial Distribution licenses.  

Contact our [gaming team](mailto:gaminginfo@affectiva.com?subject=Get Affdex SDK Unity Plugin) if you would like to use the Unity SDK.  

#### Get the SDK

{% include custom/download_table.html build_status="stable" %}


{% assign beta_count = 0 %}

{% for platform in site.data.downloads.platforms %}
{% assign beta_array = platform.versions | where: "status","beta" %}
{% assign beta_array_size = beta_array | size %}

{% if beta_array_size > 0 %}
{% capture beta_count %}{{ beta_count | plus:1 }}{% endcapture %}
{% endif %}

{% endfor %}
{% assign bcnum = beta_count | round %}

{% if bcnum > 0 %}

#### In Development

Download release candidates of the SDK. The release candidates are in the final stage of testing. Feel free to [report bugs](mailto:sdk@affectiva.com?subject=Bug Report).  

{% include custom/download_table.html build_status="beta" %}
{% endif %}

Download an [older release](/downloads/previous).
