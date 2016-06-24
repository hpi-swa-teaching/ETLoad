+++
date = "2016-06-24T19:18:21+02:00"
prev = "/02_imgseg/object-header/"
next = "/02_imgseg/loading-process/"
title = "Object Formats"
weight = 20
+++

This page compares the different object storage formats available in Squeak version 3 and 5, how they map to each other and how compatibility is best handled.
Both Squeak versions store the format as a number internally (4 bit in Squeak 3, 5 bit in Squeak 5).
These numbers will be mentioned for each format.

Sources for Squeak 3 this include the article "Back to the future" found on the resources page, and for Squeak 5 the documentation on the `Behavior` class, for example `Behavior#instSpec`.

## Formats present in both versions

Empty
:   Examples include things like `UndefinedObject`, `Boolean` and subclasses, etc.
    Instance creation is done via `class basicNew`.

    Represented by a 0 in both Squeak 3 and 5.

Fixed (non-indexable) pointer fields
:   Standard format for most classes.
    Instance creation with `class basicNew`, followed by setting all fields with `instance instVarAt: index put: value`.

    Represented by a 1 in both Squeak 3 and 5.

Indexable pointer fields (without instance variables)
:   Format for classes like `Array`.
    Must be created with `class basicNew: size`, `class basicNew` throws an exception.
    Fields could be set with the usual `instance at: index put: value`, but `instance instVarAt: index put: value` also works, and is also usable with all other formats.

    Represented by a 2 in both versions.

Indexable pointer fields with additional instance variables
:   Used for a very small amount of classes like `MethodDictionary`, `BlockContext` and `SparseLargeTable`.
    These also need to be created with `class basicNew: size`, however the size does *not* include the instance variables.
    Assuming the class hasn't changed, we can do `class basicNew: sizeInWords - class instVarNames size`.
    Some testing suggests that in both versions the content is laid out as variables first, followed by indexable variables, so a series of `instance instVarAt: put:` calls should do the job.

    Represented by a 3 in both versions.

Indexable word fields (array of 32 bit values)
:   Used for classes like `Bitmap`, `IntegerArray` or `WideString`.
    Can be handled like indexable pointer fields, but the contents should not be interpreted as oops but rather as 32 bit words.

    Represented by a 6 in Squeak 3, and by 10-11 in Squeak 5 (the 10 vs. 11 differentiation is used to calculate the byte size in 64 bit VMs).

Indexable byte fields (array of 8 bit values)
:   Used for classes like `ByteString` or `ByteArray`.
    Can also be handled similar to indexable pointer fields, however `instance instVarAt: put:` should always be used over `instance at: put:`.
    For example, `ByteString >> at: put:` expects instances of `Character`, but `ByteString >> instVarAt: put:` works as expected with byte values.
    Also of note, is that `instance instVarAt: put:` sets a single byte, not a word, like in most other cases.
    Therefore, the input words will need to be split up into bytes.

    Represented by 8-11 in Squeak 3, and 16-23 in Squeak 5.
    The different numbers are used to specify the size in bytes in the last word of the object.
    Squeak 5 has double the options, because it supports VMs with 64 bit words.

Compiled methods
:   Represented by 12-15 in Squeak 3, and 24-31 in Squeak 5.
    Some research into the byte code format of both versions is needed to know how compatibility can be handled in this case.

## Formats only available in Squeak 5

Should any object we try to load use a class of one of these formats, we should report an incompatibility.

Weak indexable objects with instance variables
:   Represented by a 4.

Weak non-indexable object with instance variables (ephemerons)
:   Represented by a 5.

64 bit indexable (array of 64 bit values)
:   Represented by a 9.

16 bit indexable (array of 16 bit values)
:   Represented by 12-15.
