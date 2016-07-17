This directory contains image segments with known contents. The following is a list of all files in the directory and the content of the image segement inside of them:

* **`42.ims`**: A `SmallInteger` with the value `42`.
* **`Array1To9.ims`**: Array of `SmallInteger` with values from `1` to `9`.
* **`ArrayOfArrayOf1.ims`**: Nested array containing `SmallInteger` in last level.
* **`MixedArraySmallInteger.ims`**: mixed arrays with SmallIntegers.
* **`HelloWorldStr.ims`**: The string `'Hello World'`.
* **`Morph.ims`**: An instance of the `Morph` class, which has been `open(ed)InWorld`.
* **`FatBitsPaint.ims`**: A Morph used by Etoys.
* **`FlexMorph.ims`**: Another Morph used by Etoys.
* **`BouncingAtomsMorph.ims`** Sample Morph of Squeak.
* **`Set.ims`**: Contains a Set of SmallInteger.
* **`Bag.ims`**: Contains a Bag of SmallInteger.
* **`Nil.ims`**: Contains a nil object.
* **`ColorX.ims`**: Contains a color object of certain color.
* **`True.ims` / `False.ims`**: Contains True/False object.
* **`TrueClass.ims` / `FalseClass.ims`**: Contains True/False class.
* **`MethodDictionary.ims`**: Contains an object of MethodDictionary.

Currently not working (not importable) image segments are "excluded" from the tests in `ETLSampleImageSegmentTest>>expectedFailures`.
