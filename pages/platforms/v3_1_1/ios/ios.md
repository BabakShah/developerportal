---
title: Affdex SDK for iOS  
permalink: /v3_1_1/ios/  
redirect_from: "/ios/"
tags: [ios, sdk]  
audience: writer, designer  
keywords:  
last_updated:  
summary:  
metadata: false
---

{% include linkrefs.html %}

SDK Developer Guide Release 3.1.1

## Getting started

__The Affdex SDK for iOS is distributed as a [CocoaPod](https://cocoapods.org/pods/AffdexSDK-iOS). If you do not have CocoaPods installed on your Mac, please install it using the instructions in the [CocoaPods Getting Started Guide](https://guides.cocoapods.org/using/getting-started.html).__

#### 1. Create a Podfile

After you have installed CocoaPods on your Mac, create a file named "Podfile" in your project directory.  This is the directory which contains the .xcodeproj and/or .xcworkspace files for your project.  The Podfile is a plain-text file which describes the framework and library dependencies that your project contains.  Installing the pod file will load and configure the Affdex SDK framework for use with your project.

Place the following text into your Podfile, substituting your app name for the 'MyApp' target:

```
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target 'MyApp' do
    pod 'AffdexSDK-iOS'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if (target.name == "AWSCore") || (target.name == 'AWSKinesis')
            target.build_configurations.each do |config|
                config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'
            end
        end
    end
end
```

{{ note }} The post_install step is required in order to configure the AWS subdependencies of the Affdex SDK (the 'AWSCore' and 'AWSKinesis' targets) if your app supports bitcode.  If you do not require bitcode support in your app, this section can be omitted from the Podfile. {{ end }}

#### 2. Install the Affdex SDK CocoaPod

With the Podfile created, run the following commands from the Terminal application:

```
pod repo update
pod install
```

This will install the SDK and support pods into the Pods folder, and will create or update the Xcode workspace file to support building from the pods.  Make sure to open the .xcworkspace file in Xcode instead of the .xcodeproj file from this point onwards.  You can now build and run the project to a device or simulator from Xcode.

After you run `pod install` your app will be linked to the most recent release of the Affdex SDK, although you can also configure your Podfile to install a specific version of the SDK if you choose.  Your project will continue to use this version even if newer versions of the SDK are released.  Use the `pod update` command to update to newer SDK releases as they become available.

{{ note }} Due to a CocoaPods configuration issue, you may need to run `pod repo update` before pod install to make sure that the correct version of the AffdexSDK-iOS CocoaPod (3.1.1) is installed.  If you see another version such as 3.1.473 loaded by pod install, or if the SDK fails runtime initialization with a licensing error, reinstall the pod using the following command: 'rm -rf Pods Podfile.lock ; pod repo update ; pod install' and make sure AffdexSDK-iOS version 3.1.1 is installed. {{ end }}

#### 3. Capture and analyze faces

Facial images can be captured from different sources. For each of the different sources, the SDK defines a detector class that can handle processing images acquired from that source:

* [Analyze a camera feed]({{ site.baseurl }}/v3_1_1/ios/analyze-camera/)
* [Analyze a recorded video file]({{ site.baseurl }}/v3_1_1/ios/analyze-video/)
* [Analyze a video frame stream]({{ site.baseurl }}/v3_1_1/ios/analyze-frames/)
* [Analyze a photo]({{ site.baseurl }}/v3_1_1/ios/analyze-photo/)

## Going Further
__There are additional sample applications for processing videos and connecting to the camera available for cloning on our [GitHub repository.](http://github.com/Affectiva/ios-sdk-samples)__

{{ note }}The size of the Affdex iOS SDK framework has increased significantly due to the inclusion of bitcode.
Bitcode is a new requirement from Apple for iOS apps that support watchOS and tvOS. This size increase will not be reflected in apps that link to the framework and are submitted to the App Store. {{ end }}

## Reference
* class docs: [[HTML]({{ site.baseurl }}/pages/platforms/v3_1_1/ios/classdocs/annotated.html)]


## Requirements & Dependencies

#### Hardware requirements (recommended)

*	iPad Air or above
*	iPhone 5s or above

#### Tracking multiple faces
As of v3.0.0, the SDK exposes a parameter `max_faces` in the detector constructors to specify the maximum number of faces to look for in an image. For the real-time use cases, to achieve a high accuracy and processing throughput (20+ processed frames per second), the SDK uses a separate CPU thread for each face, which increases the total processing load on the system based on how many faces are being tracked.

If the number of faces exceeds the number of available processing units on the machine, all faces will be tracked, but at the cost of a potential reduction in processing frame rate. Therefore, please make sure to plan for enough hardware power to support the maximum number of faces you are expecting to track with each camera.

Although you can run more than one processing thread per CPU core, throughput will be improved on machines with more cores.  On a recent dual-core machine, we can track up to 3 people in parallel with all facial expressions, emotions and appearance metrics enabled.  Processor load can be reduced by tracking fewer metrics, so enable only the metrics you need for best performance.

*Multiface tracking requires iPad Air 2 / iPhone 6 or above.*

#### Supported operating systems

*	iOS 8 and above
