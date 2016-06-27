+++
date = "2016-06-06T19:18:21+02:00"
prev = "/02_imgseg/object-header"
next = "/02_imgseg/object-formats/"
title = "Object Oriented Pointer"
weight = 20
+++

When an object contains an oop it isn't even sure that this is a real pointer. Because the last digit of the oop shows if it refers a real object or if it is a so called small integer. A zero means that it is a real pointer, a one that it is a small integer.

A small integer has 31 bit (the last one can't be used for the integer) and can be positive or negative. This means that it can encode every number from -0x40000000 to 0x3FFFFFFF (as usual the numbers are encoded using two's complement).

Now we'll look at the case that an oop is not a small integer. Since every word in squeak is 4 bytes long, the two least significant bits of all pointers are zero, which means that we have to check, if the 31st equals one. If that is the case we have an invalid pointer (this should obviously never happen).

A valid pointer can refer to an object in two different ways. If the value of the pointer is smaller than 0x80000004 the pointer points to an object inside of the segment. In that case the pointer contains the actual address of the object.

But if the value of the pointer is greater than 0x80000004 the pointer refers to an object outside of the segment. All outpointer are stored in the so called outPointerArray and we need to select the right pointer in this array to find out which object is referred. The value 0x80000004 refers to the first element of the array and the value 0x80000000 + n * 4 refers to the nth element of the array. This way we get the actual pointer to the object outside of the segment.
