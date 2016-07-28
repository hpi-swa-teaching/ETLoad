+++
date = "2016-07-28T08:47:54+02:00"
prev = "/_x_resources/"
next = ""
title = "About this wiki"
weight = 1
+++

## Software
This wiki is built with [hugo](https://gohugo.io/). The syntax highlighting is done by [pygments](http://pygments.org/).

## Modifying the wiki
The source files of the wiki are in the `notes/content` directory of the main repository. All source files are written in `markdown` with some hugo specific enhancements. If you want to modify the wiki simply modify the markdown files and push to the github repository.

On every push the wiki gets build by travis. You can find the build script in the `.travis.yml` of the main repository. Please note that the wiki gets only deployed for builds on the master branch.

### Hugo webserver
Hugo provides a simple possibility to preview changes made to the wiki: An own, simple webserver. You can start the webserver in the `notes` directory by typing `hugo server` at your command line.

To use this you need to install hugo. You can either install hugo by downloading an install package directly from their [website](https://gohugo.io), or using the package manager of your choice.

## Modifying the wiki's theme
We are using the [grav](http://getgrav.org/) theme for hugo. All changes made to the theme were in `notes/layouts/partials/`. So if you want to make any changes to the wiki theme you probably should apply the changes there.
