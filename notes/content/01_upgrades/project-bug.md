+++
date = "2016-05-18T13:21:43+02:00"
prev = "/01_upgrades/"
next = "/_x_resources/"
title = "#Project Bug"
weight = 10
+++

The provided Squeak 5.1 Image contains causes problems when loading projects due to the following circumstances:

1. Squeak 3 has a `#Project` class.
2. Squeak 5 has a `#Project` class, which has become a super class of different kinds of Projects (such as `#MVCProject` and `#MorphicProject`).
3. The Squeak 3 `#Project` has been superseded by `#MorphicProject` in Squeak 5.
4. As such a rename has been introduced in `SmartRefStream>>initKnownRenames`.
5. This rename however was not applied consistently, causing different code paths to work with different names, inevitably leading to an error condition ("`Error: class not in structures list`").
6. The current workaround is to (temporarily) remove the rename, as this rename will only become relevant at a later point in the loading process (which cannot yet be reached due to the incompatible `ImageSegment` format).
