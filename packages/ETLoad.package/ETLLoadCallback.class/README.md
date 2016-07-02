A dynamic, process-specific variable for a callback, which will be executed after loading of an image segment is complete.

While testing, we want to execute a block with the results of loading a sample image segment/project.
To ensure, that we get the result of loading the sample and not another one which is loaded by another process, we need make the callback process specific using this variable.

See ETLSegmentLoader do: withLoadResultDo: