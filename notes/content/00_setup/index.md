+++
chapter = true
date = "2016-07-29T19:30:25+02:00"
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

## Loading Sample Data

Any method loading sample data requires the `ETL_SAMPLE_DIRECTORY` environment variable to be set to the **absolute** path of the `sample-data` directory.

{{% notice warning %}}
This functionality is extensively used by tests, making a correctly set `ETL_SAMPLE_DIRECTORY` environment variable mandatory for a successful test run.
{{% /notice %}}

{{% notice note %}}
On *nix this may be achieved by executing `export ETL_SAMPLE_DIRECTORY=$PWD/sample-data` from the root directory of the repository checkout and then starting the vm from the same shell.
{{% /notice %}}
