+++
chapter = true
date = "2016-05-17T11:47:09+02:00"
icon = "<b>0. </b>"
prev = ""
next = "/00_setup/git-merge-driver/"
title = "Setup"
weight = 0
+++

# Setup

## Local Development Setup

1. Clone the repository at [github.com/HPI-SWA-Teaching/SWT16-Project-14](https://github.com/HPI-SWA-Teaching/SWT16-Project-14).
2. Execute this code:

```smalltalk
Metacello new
    baseline: 'ETLoad';
    repository: 'filetree:///$PATH/WHERE/YOU/CLONED/THE/REPO/packages';
    load.
```
