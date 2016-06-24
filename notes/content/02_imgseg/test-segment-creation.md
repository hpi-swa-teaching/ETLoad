+++
date = "2016-06-11T14:30:26+02:00"
prev = "/02_imgseg/loading-process/"
next = "/_x_resources/"
title = "Test Image Segment Creation"
weight = 40
+++

To better support automated testing and experimentation, it was necessary to create minimal image segments, containing only specific, known objects.

Since the creation of minimal test image segments needs to happen in a Squeak 3 VM, which has no support for `filetree`, the following method needs to be added manually to some class in the image:

{{% notice note %}}
This method probably only works for simple objects - classes, methods and out-pointers may or may not be exported correctly.
{{% /notice %}}

```squeak
dumpSimpleImageSegmentTo: fileName withRoots: rootArray

| is fs sr symbolHolder |

symbolHolder := Symbol allSymbols.

is := ImageSegment new.

is copyFromRoots: rootArray sizeHint: 0 areUnique: true.

fs := FileStream fileNamed: fileName.

sr := SmartRefStream on: fs.

sr nextPut: is.

sr close.

fs close.

symbolHolder.
```

Then use as follows:

```squeak
Dummy dumpSimpleImageSegmentTo: '/tmp/iseg.dump' withRoots: { 42 . 'Hello World' . Object new }.
```
