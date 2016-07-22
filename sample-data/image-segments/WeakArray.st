"Object format 4"
"| object |
object := Object new.

^ { object . WeakArray with: object }."


^ [ :testCase :result | | object array |
    testCase
        assert: 2 equals: result size.

    object := result at: 1.
    array := result at: 2.

    testCase
        assert: Object equals: object class;
        assert: WeakArray equals: array class;
        assert: 1 equals: array size;
        assert: object identical: (array at: 1).
].
