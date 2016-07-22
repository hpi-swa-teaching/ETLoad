"^ { Object new . Object new }."

^ [ :testCase :result | | object1 object2 |
    testCase
        assert: 2 equals: result size.

    object1 := result at: 1.
    object2 := result at: 2.

    testCase
        assert: Object equals: object1 class;
        assert: Object equals: object2 class;
        deny: object1 = object2.
].
