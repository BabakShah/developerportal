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

SDK Developer Guide Release 3.1

## Getting started

__The Affdex SDK for iOS is integrated into your application through [CocoaPods](https://cocoapods.org/pods/AffdexSDK-iOS). If you do not have CocoaPods installed on your Mac, please install it using the instructions on the CocoaPods site.__


#### 1. Create a Podfile.

After you have installed CocoaPods on your Mac, create a file named "Podfile" in your project directory.  This is the directory which contains the .xcodeproj and/or .xcworkspace files for your project.  The Podfile is a plain-text file which describes the framework and library dependencies that your project contains.  Installing the pod file will load and configure the Affdex SDK framework, along with its supporting dependencies such as the AWS Kinesis framework, for use with your project.<br/>
Place the following text into your Podfile:

```
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target 'AffdexMe' do
    pod 'AffdexSDK-iOS'
    pod 'AWSKinesis'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
      if (target.name == "AWSCore") || (target.name == 'AWSKinesis')
            puts target.name
            target.build_configurations.each do |config|
                config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'
            end
      end
  end
end
```

#### 2. Run the `pod install` command.

With the Podfile created, run the following command from the Terminal application:

```
pod install
```

This command will install the SDK and support pods into the Pods folder, and will create or update the Xcode workspace file to support building from the pods.  Make sure to open the .xcworkspace file in Xcode instead of the .xcodeproj file from this point onwards.  You can now build and run the project to a device or simulator from Xcode.

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
As of v3.0, the SDK exposes a parameter `max_faces` in the detector constructors to specify the maximum number of faces to look for in an image. For the real-time use cases, to achieve a high accuracy and processing throughput (20+ processed frames per second), the SDK uses a separate CPU thread for each face, which increases the total processing load on the system based on how many faces are being tracked.

If the number of faces exceeds the number of available processing units on the machine, all faces will be tracked, but at the cost of a potential reduction in processing frame rate. Therefore, please make sure to plan for enough hardware power to support the maximum number of faces you are expecting to track with each camera.

Although you can run more than one processing thread per CPU core, throughput will be improved on machines with more cores.  On a recent dual-core machine, we can track up to 3 people in parallel with all facial expressions, emotions and appearance metrics enabled.  Processor load can be reduced by tracking fewer metrics, so enable only the metrics you need for best performance.

*Multiface tracking requires iPad Air 2 / iPhone 6 or above.*

#### Supported operating systems

*	iOS 8 and above
