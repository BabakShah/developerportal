---
title: Affdex SDK
permalink: /gen/
tags: [sdk]
audience: writer, designer
keywords:
last_updated:
summary:
---
{% include linkrefs.html %}

##Using the SDK





##Creating a Detector



<!-- startHTML -->
<div id="rootwizard">
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <ul class="nav nav-pills">
                    <li class="active"><a href="#java1" data-toggle="tab">Java</a></li>
                    <li><a href="#obc1" data-toggle="tab">Objective C</a></li>
                    <li><a href="#dn1" data-toggle="tab">.NET</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="tab-content">
        <div class="tab-pane active" id="java1">
            <p>Java</p>
Camera Detector

<pre><code>public CameraDetector(Context context, CameraType cameraType, SurfaceView cameraPreviewView, int maxNumFaces, FaceDetectorMode faceDetectorMode);</code></pre>

Video Detector

<pre><code>public VideoFileDetector(Context context, String filePath, int maxNumFaces, FaceDetectorMode faceDetectorMode);</code></pre>

Image Detector

<pre><code>public PhotoDetector(Context context, int maxNumFaces, FaceDetectorMode faceDetectorMode)</code></pre>

        </div>
        <div class="tab-pane" id="obc1">
            <p>Objective-C</p>
Camera Detector

<pre><code>- (id)initWithDelegate:(id <AFDXDetectorDelegate>)delegate usingCamera:(AFDXCameraType)camera maximumFaces:(NSUInteger)maximumFaces;
</code></pre>

Video Detector

<pre><code>- (id)initWithDelegate:(id <AFDXDetectorDelegate>)delegate usingFile:(NSString *)path maximumFaces:(NSUInteger)maximumFaces;</code></pre>

Image Detector

<pre><code>- (id)initWithDelegate:(id <AFDXDetectorDelegate>)delegate discreteImages:(BOOL)discrete maximumFaces:(NSUInteger)maximumFaces;</code></pre>

        </div>
        <div class="tab-pane" id="dn1">
            <p>.NET</p>

Camera Detector
<pre><code>CameraDetector(const int cameraId = 0, const double cameraFPS = 15,
    const double processFPS = DEFAULT_PROCESSING_FRAMERATE,
    const unsigned int maxNumFaces = DEFAULT_MAX_NUM_FACES,
    const FaceDetectorMode faceConfig = affdex::FaceDetectorMode::LARGE_FACES);</code></pre>

Video Detector
<pre><code>VideoDetector(const double processFPS = DEFAULT_PROCESSING_FRAMERATE,
    const unsigned int maxNumFaces = DEFAULT_MAX_NUM_FACES,
    const FaceDetectorMode faceConfig = affdex::FaceDetectorMode::SMALL_FACES);</code></pre>

Image Detector

<pre><code>PhotoDetector(const unsigned int maxNumFaces = DEFAULT_MAX_NUM_FACES,
    const FaceDetectorMode faceConfig = FaceDetectorMode::SMALL_FACES);</code></pre>

        </div>
    </div>
</div>
<!-- endHTML -->





##Initializing the Detector



<!-- startHTML -->
<div id="rootwizard">
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <ul class="nav nav-pills">
                    <li class="active"><a href="#java2" data-toggle="tab">Java</a></li>
                    <li><a href="#obc2" data-toggle="tab">Objective C</a></li>
                    <li><a href="#dn2" data-toggle="tab">.NET</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="tab-content">
        <div class="tab-pane active" id="java2">
            Java

        </div>
        <div class="tab-pane" id="obc2">
            Objective-C

        </div>
        <div class="tab-pane" id="dn2">
            .NET

        </div>
    </div>
</div>
<!-- endHTML -->





##Interpretting Results



<!-- startHTML -->
<div id="rootwizard">
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <ul class="nav nav-pills">
                    <li class="active"><a href="#java3" data-toggle="tab">Java</a></li>
                    <li><a href="#obc3" data-toggle="tab">Objective C</a></li>
                    <li><a href="#dn3" data-toggle="tab">.NET</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="tab-content">
        <div class="tab-pane active" id="java3">
            Java

        </div>
        <div class="tab-pane" id="obc3">
            Objective-C

        </div>
        <div class="tab-pane" id="dn3">
            .NET

        </div>
    </div>
</div>
<!-- endHTML -->
