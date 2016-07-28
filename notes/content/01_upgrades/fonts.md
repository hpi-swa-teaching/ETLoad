+++
date = "2016-05-18T14:16:58+02:00"
prev = "/01_upgrades/class-replacements/"
next = "/02_project-file/"
title = "Fonts"
weight = 30
+++

While loading a project, an error occured in `TextStyle>>addNewFontSize:` because a `fontArray` contained a `TTCFontSet` along with `TTCFont`s. As such an extra check was introduced to ignore objects which are not instances of TTCFont.
