+++
chapter = true
date = "2016-05-18T14:23:20+02:00"
icon = "<b>2. </b>"
prev = "/01_upgrades/fonts/"
next = "/02_imgseg/Object_Header/"
title = "Image Segment"
weight = 0
+++

# Image Segment

If no other errors occure during the loading process, attempting to load a Squeak 3 Project in Squeak 5 will result in an error ("`Error: Segment has not been becommed into the loaded objects`") from `ImageSegment>>checkAndReportLoadError`, which is called immediatly after the primitive at `ImageSegment>>loadSegmentFrom:outPointers:`.

{{% notice warning %}}
The documentation of `ImageSegment>>loadSegmentFrom:outPointers:` states that "[this primitive] will have destroyed the contents of the segment wordArray" if it fails.
{{% /notice %}}

As such it will probably be required to save a copy of the segment wordArray prior to executing this primitive. Then, should the primitive fail, an attempt can be made to load the ImageSegement "manually".
