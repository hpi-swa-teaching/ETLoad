This directory contains image segments with known contents. Each of these will become a separate test case of the `ETLSampleImageSegmentTest` class.

Image segments should be named `ShortDescription.ims` and be created as described under ["test segment creation"](http://hpi-swa-teaching.github.io/ETLoad/02_imgseg/test-segment-creation/).

Additionally for each image segment there must exist a file with the same name but with an `.st` extension (ie. `ShortDescription.st`). That file is interpreted as smalltalk code and must either

a) return an object which compares equal to the data in the image segment or
b) return a block which validates the objects loaded from the image segment, taking a `TestCase` instance and the loaded objects as arguments.

Currently not working (not importable) image segments are "excluded" from the tests in `ETLSampleImageSegmentTest class>>ignoredImageSegments`.
