+++
date = "2016-06-11T11:23:21+02:00"
prev = "/02_imgseg/object-header/"
next = "/02_imgseg/test-segment-creation/"
title = "Loading Process"
weight = 20
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

+ `class basicNew`
+ Write fields via primitives
+ `self becomeForward: createdObject`
