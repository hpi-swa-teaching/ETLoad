+++
date = "2016-06-06T19:18:21+02:00"
prev = "/02_imgseg/"
next = "/_x_resources/"
title = "Object Headers"
weight = 10
+++

The header of a Squeak object contains of up to three words with the size of 4 bytes.
The first is the so called base header and is always present.
The second is the full class pointer of the object, it has an offset of -4 and isn't present all the time.
The third word is also optional, it has an offset of -8 and contains the size in words of an object.

Besides the main information every part of the header contains 2 bit which say, how big the header is.
( 0: just the base header is present, 1: the base header and the full class pointer are present, 3: The header contains all three words)

Now we need to know which information are stored in the base header:


| Bits          | Content                                             |
| ------------- |:---------------------------------------------------:|
| 0-2           | storage management information                      |
| 3-14          | object hash                                         |
| 15-19         | compact class index                                 |
| 20-23         | object format                                       |
| 24-29         | size in words                                       |
| 30-31         | header type                                         |

The storage management information and the object hash weren't interesting for us.

The compact class index is an alternative to the full class pointer of the object if the class is one of 32 special classes ('Compact Classes').

The object format gives information about the format of the object. In the table below you can see the meaning of each number:

| Number        | Meaning                                             |
| ------------- |:---------------------------------------------------:|
| 0             |  no fields                                          |
| 1             | fixed pointer fields                                |
| 2             | indexable pointer fields                            |
| 3             | both fixed and indexable pointer fields             |
| 4+5           | not used                                            |
| 6             | indexable word fields (no pointer)                  |
| 7             | not used                                            |
| 8-11          | indexable byte fields (no pointers): low 2 bits are low 2 bits of size in bytes |
| 12-15         | compiled methods: low 2 bits are low 2 bits of size in bytes. The number of literals is specified in method header, followed by the indexable bytes that store byte codes. |

the `size in words` field is used to store the object size unless it exceeds 64 words.
