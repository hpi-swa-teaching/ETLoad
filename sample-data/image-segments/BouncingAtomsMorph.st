"^ { BouncingAtomsMorph new openInWorld }."

^ [ :testCase :result | | morph |
    testCase
        assert: 1 equals: result size.

    morph := result at: 1.

    testCase
        assert: 400@250 equals: morph extent;
        assert: 30 equals: morph submorphs size;
        assert: (Color r: 0.8 g: 1 b: 0.8) equals: morph color.

    morph openInWorld.

    testCase
        assert: World equals: morph owner.].
