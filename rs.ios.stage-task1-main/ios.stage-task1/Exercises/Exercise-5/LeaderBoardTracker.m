#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {
    
    NSMutableArray<NSNumber *> *playerResults = [NSMutableArray<NSNumber *> new];
    int playerResult;
    
    for (int i = 0; i < [playerArray count]; ++i) {
        playerResult = 1;
        for (int j = 0; j < [rankedArray count]; ++j) {
            if ([playerArray[i] intValue] >= [rankedArray[j] intValue]) {
                break;
            } else {
                if (j + 1 == [rankedArray count] || rankedArray[j+1] != rankedArray[j]) {
                    playerResult += 1;
                }
            }
        }
        [playerResults addObject:[NSNumber numberWithInt:playerResult]];
    }
    
    return playerResults;
}

@end
