"^ { Morph new openInWorld }."

^ [ :testCase :result | | morph |
    testCase
        assert: 1 equals: result size.

    morph := result at: 1.

    testCase
        assert: Morph equals: morph class;
        assert: 50 @ 40 equals: morph extent;
        assert: Color blue equals: morph color.

    morph openInWorld.

    testCase
        assert: World equals: morph owner. ].
