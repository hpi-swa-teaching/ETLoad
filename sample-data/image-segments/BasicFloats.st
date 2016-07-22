"^ { 0.0 . -0.0 . 1.0 . -1.0 . Float infinity . Float infinity negated . Float pi . Float e . Float nan }."

^ [ :testCase :result |

    "self halt."

    "Transcript show: result."

    testCase
        assert: 9 equals: result size;
        assert: 0.0 equals: (result at: 1);
        assert: -0.0 equals: (result at: 2);
        assert: 1.0 equals: (result at: 3);
        assert: -1.0 equals: (result at: 4);
        assert: (result at: 5) equals: Float infinity;
        assert: (result at: 6) equals: Float infinity negated;
        assert: Float pi equals: (result at: 7);
        assert: Float e equals: (result at: 8);
        assert: (result at: 9) isNaN.

    "FIXME: These should compare equals and thus this should fail, but it does not"
    testCase
        deny: Float infinity = (result at: 5);
        deny: Float infinity = (result at: 6).

].
