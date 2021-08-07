#import <XCTest/XCTest.h>
#import "LevelOrderTraversal.h"

@interface LevelOrderTests : XCTestCase

@end

@implementation LevelOrderTests

- (void)setUp {
    self.continueAfterFailure = false;
}

- (void)testNodes {
    XCTAssertEqualObjects(@[], LevelOrderTraversalForTree(@[]));
// testOnlyRoot
    XCTAssertEqualObjects(@[@[@1]], LevelOrderTraversalForTree(@[@1]));
// testNilRoot
    XCTAssertEqualObjects(@[], LevelOrderTraversalForTree(@[[NSNull null]]));
}

//    ┌── 3
//    1
//    └── nil
- (void)test2Nodes {
    id levels = @[
        @[
            @1
        ],
        @[
            @3
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1, [NSNull null], @3]));

//    ┌── nil
//    1
//    └── 2
// test2NodesLeft {
    levels = @[
        @[
            @1
        ],
        @[
            @2
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1, @2]));
}

- (void)test3Nodes{
    //    ┌── 3
    //    1
    //    └── 2
    id levels = @[
        @[
            @1
        ],
        @[
            @2, @3
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1, @2, [NSNull null],[NSNull null],@3]));

//    ┌── nil
//    1
//    │  ┌── nil
//    └──2
//       └── 3
//test3NodesOnlyLeft
    levels = @[
        @[
            @1
        ],
        @[
            @2
        ],
        @[
            @3
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1, @2, @3]));

//   ┌── 3
//┌──2
//│  └── nil
//1
//└── nil

// test3NodesRightLeft
    levels = @[
        @[
            @1
        ],
        @[
            @2
        ],
        @[
            @3
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1, [NSNull null], @2, [NSNull null], @3]));
}

//          ┌── 4
//       ┌──3
//       │  └── nil
//    ┌──2
//    │  └── nil
//    1
//    └── nil
- (void)test4Nodes1 {
    id levels = @[
        @[
            @1
        ],
        @[
            @2
        ],
        @[
            @3
        ],
        @[
            @4
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1, [NSNull null], @2, [NSNull null], @3, [NSNull null], @4]));

//          ┌── nil
//       ┌──4
//       │  └── 3
//    ┌──2
//    │  └── nil
//    1
//    └── nil
// test4Nodes2
     levels = @[
        @[
            @1
        ],
        @[
            @2
        ],
        @[
            @4
        ],
        @[
            @3
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1, [NSNull null], @2, [NSNull null], @4, @3]));

//       ┌── 4
//    ┌──3
//    │  └── 2
//    1
//    └── nil

// test4Nodes3
     levels = @[
        @[
            @1
        ],
        @[
            @3
        ],
        @[
            @2, @4
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1, [NSNull null], @3, @2, [NSNull null], [NSNull null], @4]));

//       ┌── nil
//    ┌──4
//    │  │  ┌── 3
//    │  └──2
//    │     └── nil
//    1
//    └── nil

// test4Nodes4
     levels = @[
        @[
            @1
        ],
        @[
            @4
        ],
        @[
            @2
        ],
        @[
            @3
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1, [NSNull null], @4, @2, [NSNull null], @3]));

//       ┌── nil
//    ┌──4
//    │  │  ┌── nil
//    │  └──3
//    │     └── 2
//    1
//    └── nil

// test4Nodes5
     levels = @[
        @[
            @1
        ],
        @[
            @4
        ],
        @[
            @3
        ],
        @[
            @2
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1, [NSNull null], @4, @3, @2]));

//       ┌── 4
//    ┌──3
//    │  └── nil
//    2
//    └──1

// test4Nodes6
     levels = @[
        @[
            @2
        ],
        @[
            @1, @3
        ],
        @[
            @4
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@2, @1, [NSNull null], [NSNull null], @3, [NSNull null], @4]));

//       ┌── nil
//    ┌──4
//    │  └── 3
//    2
//    └──1
// test4Nodes7
     levels = @[
        @[
            @2
        ],
        @[
            @1, @4
        ],
        @[
            @3
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@2, @1, [NSNull null], [NSNull null], @4, @3]));

//    ┌──4
//    3
//    │  ┌── 2
//    └──1
//       └── nil

// test4Nodes8
     levels = @[
        @[
            @3
        ],
        @[
            @1, @4
        ],
        @[
            @2
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@3, @1, [NSNull null], @2, [NSNull null], [NSNull null], @4]));

//    ┌── 4
//    3
//    │  ┌── nil
//    └──2
//       └── 1

// test4Nodes9
     levels = @[
        @[
            @3
        ],
        @[
            @2, @4
        ],
        @[
            @1
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@3, @2, @1, [NSNull null], [NSNull null], [NSNull null], @4]));

//    ┌──nil
//    4
//    │     ┌── 3
//    │  ┌──2
//    │  │  └──nil
//    └──1
//       └──nil

// test4Nodes10
    levels = @[
        @[
            @4
        ],
        @[
            @1
        ],
        @[
            @2
        ],
        @[
            @3
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@4, @1, [NSNull null], @2, [NSNull null], @3]));

//    ┌── nil
//    4
//    │     ┌── nil
//    │  ┌──3
//    │  │  └── 2
//    └──1
//       └── nil

// test4Nodes11
    levels = @[
        @[
            @4
        ],
        @[
            @1
        ],
        @[
            @3
        ],
        @[
            @2
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@4, @1, [NSNull null], @3, @2]));

//    ┌── nil
//    4
//    │  ┌── 3
//    └──2
//       └── 1

// test4Nodes12
    levels = @[
        @[
            @4
        ],
        @[
            @2
        ],
        @[
            @1, @3
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@4, @2, @1, [NSNull null], [NSNull null], @3]));

//    ┌── nil
//    4
//    │  ┌── nil
//    └──3
//       │  ┌── 2
//       └──1
//          └── nil

// test4Nodes13
    levels = @[
        @[
            @4
        ],
        @[
            @3
        ],
        @[
            @1
        ],
        @[
            @2
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@4, @3, @1, [NSNull null], @2]));

//    ┌── nil
//    4
//    │  ┌── nil
//    └──3
//       │  ┌── nil
//       └──2
//          └── 1

// test4Nodes14
    levels = @[
        @[
            @4
        ],
        @[
            @3
        ],
        @[
            @2
        ],
        @[
            @1
        ]
    ];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@4, @3, @2, @1]));
}

#pragma mark - Generated 5

//┌── 5
//┌──4
//│└── nil
//┌──3
//│└── nil
//┌──2
//│└── nil
//1
//└── nil

- (void)test5Nodes0 {
    id levels = @[@[@1],@[@2],@[@3],@[@4],@[@5]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@2,[NSNull null],@3,[NSNull null],@4,[NSNull null],@5]));

//┌── nil
//┌──5
//│└── 4
//┌──3
//│└── nil
//┌──2
//│└── nil
//1
//└── nil

// test5Nodes1
    levels = @[@[@1],@[@2],@[@3],@[@5],@[@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@2,[NSNull null],@3,[NSNull null],@5,@4]));

//┌── 5
//┌──4
//│└── 3
//┌──2
//│└── nil
//1
//└── nil

// test5Nodes2
    levels = @[@[@1],@[@2],@[@4],@[@3,@5]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@2,[NSNull null],@4,@3,[NSNull null],[NSNull null],@5]));

//┌── nil
//┌──5
//││┌── 4
//│└──3
//│ └── nil
//┌──2
//│└── nil
//1
//└── nil

// test5Nodes3
    levels = @[@[@1],@[@2],@[@5],@[@3],@[@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@2,[NSNull null],@5,@3,[NSNull null],@4]));

//┌── nil
//┌──5
//││┌── nil
//│└──4
//│ └── 3
//┌──2
//│└── nil
//1
//└── nil

// test5Nodes4
    levels = @[@[@1],@[@2],@[@5],@[@4],@[@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@2,[NSNull null],@5,@4,@3]));

//┌── 5
//┌──4
//│└── nil
//┌──3
//│└── 2
//1
//└── nil

// test5Nodes5
    levels = @[@[@1],@[@3],@[@2,@4],@[@5]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@3,@2,[NSNull null],[NSNull null],@4,[NSNull null],@5]));

//┌── nil
//┌──5
//│└── 4
//┌──3
//│└── 2
//1
//└── nil

// test5Nodes6
    levels = @[@[@1],@[@3],@[@2,@5],@[@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@3,@2,[NSNull null],[NSNull null],@5,@4]));

//┌── 5
//┌──4
//││┌── 3
//│└──2
//│ └── nil
//1
//└── nil

// test5Nodes7
    levels = @[@[@1],@[@4],@[@2,@5],@[@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@4,@2,[NSNull null],@3,[NSNull null],[NSNull null],@5]));

//┌── 5
//┌──4
//││┌── nil
//│└──3
//│ └── 2
//1
//└── nil

// test5Nodes8
    levels = @[@[@1],@[@4],@[@3,@5],@[@2]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@4,@3,@2,[NSNull null],[NSNull null],[NSNull null],@5]));

//┌── nil
//┌──5
//││ ┌── 4
//││┌──3
//│││└── nil
//│└──2
//│ └── nil
//1
//└── nil

// test5Nodes9
    levels = @[@[@1],@[@5],@[@2],@[@3],@[@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@5,@2,[NSNull null],@3,[NSNull null],@4]));

//┌── nil
//┌──5
//││ ┌── nil
//││┌──4
//│││└── 3
//│└──2
//│ └── nil
//1
//└── nil

// test5Nodes10
    levels = @[@[@1],@[@5],@[@2],@[@4],@[@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@5,@2,[NSNull null],@4,@3]));

//┌── nil
//┌──5
//││┌── 4
//│└──3
//│ └── 2
//1
//└── nil

// test5Nodes11
    levels = @[@[@1],@[@5],@[@3],@[@2,@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@5,@3,@2,[NSNull null],[NSNull null],@4]));

//┌── nil
//┌──5
//││┌── nil
//│└──4
//│ │┌── 3
//│ └──2
//│  └── nil
//1
//└── nil

// test5Nodes12
    levels = @[@[@1],@[@5],@[@4],@[@2],@[@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@5,@4,@2,[NSNull null],@3]));

//┌── nil
//┌──5
//││┌── nil
//│└──4
//│ │┌── nil
//│ └──3
//│  └── 2
//1
//└── nil

// test5Nodes13
    levels = @[@[@1],@[@5],@[@4],@[@3],@[@2]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@1,[NSNull null],@5,@4,@3,@2]));

//┌── 5
//┌──4
//│└── nil
//┌──3
//│└── nil
//2
//└── 1
}

- (void)test5Nodes14 {
    id levels = @[@[@2],@[@1,@3],@[@4],@[@5]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@2,@1,[NSNull null],[NSNull null],@3,[NSNull null],@4,[NSNull null],@5]));
}

//┌── nil
//┌──5
//│└── 4
//┌──3
//│└── nil
//2
//└── 1

- (void)test5Nodes15 {
    id levels = @[@[@2],@[@1,@3],@[@5],@[@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@2,@1,[NSNull null],[NSNull null],@3,[NSNull null],@5,@4]));
}

//┌── 5
//┌──4
//│└── 3
//2
//└── 1

- (void)test5Nodes16 {
    id levels = @[@[@2],@[@1,@4],@[@3,@5]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@2,@1,[NSNull null],[NSNull null],@4,@3,[NSNull null],[NSNull null],@5]));
}

//┌── nil
//┌──5
//││┌── 4
//│└──3
//│ └── nil
//2
//└── 1

- (void)test5Nodes17 {
    id levels = @[@[@2],@[@1,@5],@[@3],@[@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@2,@1,[NSNull null],[NSNull null],@5,@3,[NSNull null],@4]));

//┌── nil
//┌──5
//││┌── nil
//│└──4
//│ └── 3
//2
//└── 1

// test5Nodes18
    levels = @[@[@2],@[@1,@5],@[@4],@[@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@2,@1,[NSNull null],[NSNull null],@5,@4,@3]));

//┌── 5
//┌──4
//│└── nil
//3
//│┌── 2
//└──1
//└── nil

// test5Nodes19
    levels = @[@[@3],@[@1,@4],@[@2,@5]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@3,@1,[NSNull null],@2,[NSNull null],[NSNull null],@4,[NSNull null],@5]));

//┌── nil
//┌──5
//│└── 4
//3
//│┌── 2
//└──1
//└── nil

// test5Nodes20
    levels = @[@[@3],@[@1,@5],@[@2,@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@3,@1,[NSNull null],@2,[NSNull null],[NSNull null],@5,@4]));

//┌── 5
//┌──4
//│└── nil
//3
//│┌── nil
//└──2
//└── 1

// test5Nodes21
    levels = @[@[@3],@[@2,@4],@[@1,@5]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@3,@2,@1,[NSNull null],[NSNull null],[NSNull null],@4,[NSNull null],@5]));

//┌── nil
//┌──5
//│└── 4
//3
//│┌── nil
//└──2
//└── 1

// test5Nodes22
    levels = @[@[@3],@[@2,@5],@[@1,@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@3,@2,@1,[NSNull null],[NSNull null],[NSNull null],@5,@4]));

//┌── 5
//4
//│ ┌── 3
//│┌──2
//││└── nil
//└──1
//└── nil

// test5Nodes23
    levels = @[@[@4],@[@1,@5],@[@2],@[@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@4,@1,[NSNull null],@2,[NSNull null],@3,[NSNull null],[NSNull null],@5]));

//┌── 5
//4
//│ ┌── nil
//│┌──3
//││└── 2
//└──1
//└── nil

// test5Nodes24
    levels = @[@[@4],@[@1,@5],@[@3],@[@2]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@4,@1,[NSNull null],@3,@2,[NSNull null],[NSNull null],[NSNull null],@5]));

//┌── 5
//4
//│┌── 3
//└──2
//└── 1

// test5Nodes25
    levels = @[@[@4],@[@2,@5],@[@1,@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@4,@2,@1,[NSNull null],[NSNull null],@3,[NSNull null],[NSNull null],@5]));

//┌── 5
//4
//│┌── nil
//└──3
//│┌── 2
//└──1
//└── nil

// test5Nodes26
    levels = @[@[@4],@[@3,@5],@[@1],@[@2]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@4,@3,@1,[NSNull null],@2,[NSNull null],[NSNull null],[NSNull null],@5]));

//┌── 5
//4
//│┌── nil
//└──3
//│┌── nil
//└──2
//└── 1

// test5Nodes27
    levels = @[@[@4],@[@3,@5],@[@2],@[@1]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@4,@3,@2,@1,[NSNull null],[NSNull null],[NSNull null],[NSNull null],@5]));

//┌── nil
//5
//│  ┌── 4
//│ ┌──3
//│ │└── nil
//│┌──2
//││└── nil
//└──1
//└── nil

// test5Nodes28
    levels = @[@[@5],@[@1],@[@2],@[@3],@[@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@1,[NSNull null],@2,[NSNull null],@3,[NSNull null],@4]));

//┌── nil
//5
//│  ┌── nil
//│ ┌──4
//│ │└── 3
//│┌──2
//││└── nil
//└──1
//└── nil

// test5Nodes29
    levels = @[@[@5],@[@1],@[@2],@[@4],@[@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@1,[NSNull null],@2,[NSNull null],@4,@3]));

//┌── nil
//5
//│ ┌── 4
//│┌──3
//││└── 2
//└──1
//└── nil

// test5Nodes30
    levels = @[@[@5],@[@1],@[@3],@[@2,@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@1,[NSNull null],@3,@2,[NSNull null],[NSNull null],@4]));

//┌── nil
//5
//│ ┌── nil
//│┌──4
//│││┌── 3
//││└──2
//││ └── nil
//└──1
//└── nil

// test5Nodes31
    levels = @[@[@5],@[@1],@[@4],@[@2],@[@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@1,[NSNull null],@4,@2,[NSNull null],@3]));
//
//┌── nil
//5
//│ ┌── nil
//│┌──4
//│││┌── nil
//││└──3
//││ └── 2
//└──1
//└── nil

// test5Nodes32
    levels = @[@[@5],@[@1],@[@4],@[@3],@[@2]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@1,[NSNull null],@4,@3,@2]));

//┌── nil
//5
//│ ┌── 4
//│┌──3
//││└── nil
//└──2
//└── 1

// test5Nodes33
    levels = @[@[@5],@[@2],@[@1,@3],@[@4]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@2,@1,[NSNull null],[NSNull null],@3,[NSNull null],@4]));
//
//┌── nil
//5
//│ ┌── nil
//│┌──4
//││└── 3
//└──2
//└── 1

// test5Nodes34
    levels = @[@[@5],@[@2],@[@1,@4],@[@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@2,@1,[NSNull null],[NSNull null],@4,@3]));

//┌── nil
//5
//│┌── 4
//└──3
//│┌── 2
//└──1
//└── nil

// test5Nodes35
    levels = @[@[@5],@[@3],@[@1,@4],@[@2]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@3,@1,[NSNull null],@2,[NSNull null],[NSNull null],@4]));

//┌── nil
//5
//│┌── 4
//└──3
//│┌── nil
//└──2
//└── 1

// test5Nodes36
    levels = @[@[@5],@[@3],@[@2,@4],@[@1]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@3,@2,@1,[NSNull null],[NSNull null],[NSNull null],@4]));

//┌── nil
//5
//│┌── nil
//└──4
//│ ┌── 3
//│┌──2
//││└── nil
//└──1
//└── nil

// test5Nodes37
    levels = @[@[@5],@[@4],@[@1],@[@2],@[@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@4,@1,[NSNull null],@2,[NSNull null],@3]));

//┌── nil
//5
//│┌── nil
//└──4
//│ ┌── nil
//│┌──3
//││└── 2
//└──1
//└── nil

// test5Nodes38
    levels = @[@[@5],@[@4],@[@1],@[@3],@[@2]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@4,@1,[NSNull null],@3,@2]));
//┌── nil
//5
//│┌── nil
//└──4
//│┌── 3
//└──2
//└── 1

//test5Nodes39
    levels = @[@[@5],@[@4],@[@2],@[@1,@3]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@4,@2,@1,[NSNull null],[NSNull null],@3]));
//
//┌── nil
//5
//│┌── nil
//└──4
//│┌── nil
//└──3
//│┌── 2
//└──1
//└── nil

//test5Nodes40
    levels = @[@[@5],@[@4],@[@3],@[@1],@[@2]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@4,@3,@1,[NSNull null],@2]));

//┌── nil
//5
//│┌── nil
//└──4
//│┌── nil
//└──3
//│┌── nil
//└──2
//└── 1

//test5Nodes41
    levels = @[@[@5],@[@4],@[@3],@[@2],@[@1]];
    XCTAssertEqualObjects(levels, LevelOrderTraversalForTree(@[@5,@4,@3,@2,@1]));
}

@end
