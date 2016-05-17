+++
chapter = true
date = "2016-05-17T11:47:09+02:00"
icon = "<b>0. </b>"
prev = ""
next = ""
title = "Setup"
weight = 0
+++

# Setup

## Local Development Setup

1. Clone this repository.
2. Execute the following code:

```smalltalk
Metacello new
    baseline: 'ETLoad';
    repository: 'filetree:///$PATH/WHERE/YOU/CLONED/THE/REPO/packages';
    load.
```
