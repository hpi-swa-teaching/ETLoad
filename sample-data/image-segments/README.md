This directory contains image segments with known contents. Each of these will become a separate test case of the `ETLSampleImageSegmentTest` class.

Image segments should be named `ShortDescription.ims` and be created as described under ["test segment creation"](http://etoys-notes.xyz/02_imgseg/test-segment-creation/).

Additionally for each image segment there must exists a file with the same name but with an `.st` extension (ie. `ShortDescription.st`) which must contains smalltalk code to reproduce the same objects as present in the image segment.

Currently not working (not importable) image segments are "excluded" from the tests in `ETLSampleImageSegmentTest class>>ignoredImageSegments`.
