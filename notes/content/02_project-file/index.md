+++
chapter = true
date = "2016-07-25T20:50:20+02:00"
icon = "<b>2. </b>"
prev = "/01_upgrades/fonts/"
next = "/03_image-segment/"
title = "Project file format"
weight = 0
+++

# Project file format
The project file format is basically a normal Squeak project file which can be read by standard Squeak tools. Most of the layers are a consequence of the history of Squeak.

{{< figure src="project-file-structure.svg" title="Project file structure of an Etoys project file" >}}

As you can see in the figure the project file consists mainly of an image segment. This image segment is the most important part of the project file. For an exact description of this image segment take look at [the image segment part of the wiki]({{< ref "03_image-segment/index.md" >}}).

The next layer is a `SmartRefStream` which is commonly used to transfer objects between Squeak images.

This layer is contained by a `Self-Describing Stream`, basically consisting of many parts each containing a bit of Squeak code, which gets executed on load and the binary data itself. In our case we have one main part, which consists our image segment.

All these layers then are compressed by the next layer.

Afterwards all the content is zipped into a zip file which contains some metadata beside the binary gzipped file.

## Work with project files
Please keep in mind that this structure is already simplified: Often these files are beginning with unusual data which makes them not readable for standard programs.

We suggest to use [`binwalk`](http://binwalk.org/) to analyse the project files.
