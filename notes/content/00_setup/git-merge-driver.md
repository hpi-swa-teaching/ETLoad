+++
date = "2016-05-19T14:22:21+02:00"
prev = "/00_setup/"
next = "/01_upgrades/"
title = "Git MergeDriver"
weight = 10
+++

Due to the dual use of monticello and git, there are some problems with merging.
Git doesn't know how to merge monticello metadata files, causing a lot of merge conflicts.
The solution for this problem that was presented in class is manually merging in Smalltalk first, and then committing the merged changes in git.

This process can be automated by using the [filetree merge driver](https://github.com/ThierryGoubier/GitFileTree-MergeDriver).
Unfortunately, it probably requires Linux or OSX (the merge script itself is a bash script).
The setup is quite simple:

 * Clone the git repository of the merge driver somewhere where it can stay
 * Run `make` in the repositories root directory

This will have appended some lines to your git config (`~/.gitconfig`) to register the merge driver.
Because our repository already contains a `.gitattributes` file which enables the merge driver for the appropriate files, this is all that needs to be done.
From now on `git merge` should work as expected.
