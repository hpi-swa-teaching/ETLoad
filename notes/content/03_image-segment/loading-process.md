+++
date = "2016-06-11T11:23:21+02:00"
prev = "/03_image-segment/object-formats/"
next = "/03_image-segment/test-segment-creation/"
title = "Loading Process"
weight = 40
+++

We load segments with the following algorithm:

+ For the entire segment:
	- Load header
	- Create placeholder
+ For all placeholders:
	- Acquire class oop
+ While not all objects loaded:
	- For all placeholder objects:
		* If class is loaded, load object
		* Else do nothing, class will be loaded in a subsequent iteration

Each object is loaded with the following steps:

+ Create instance (with `class basicNew` or `class basicNew: size`)
+ Write fields via primitives
+ `self becomeForward: createdObject`

The [object formats](/02_imgseg/object-formats/) page goes into more details about how to instantiate and fill objects of different formats.

