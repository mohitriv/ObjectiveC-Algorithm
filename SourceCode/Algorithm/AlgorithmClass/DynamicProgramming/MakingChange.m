//
//  MakingChange.m
//  Algorithm
//
//  Created by Mohit Trivedi on 15/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "MakingChange.h"

@implementation MakingChange

-(void) runTheAlgorithm {
    // Define the input
    NSArray *coinsArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:5],[NSNumber numberWithInt:10],[NSNumber numberWithInt:20],[NSNumber numberWithInt:50], nil];
    NSInteger changeMoney = 57;
    NSInteger minCoins = [self findMinCoinsRequiredToMakeChangeforMoney:changeMoney fromCoinsArr:coinsArr];
    [super printOutput:[NSString stringWithFormat:@"Minimum coins required for making change for money %@ from array %@ are %@",[NSNumber numberWithInteger:changeMoney],coinsArr,[NSNumber numberWithInteger:minCoins]]];
}

// M(j) = Min(M(j-v(i))) + 1 for all i such that v(i) <= j

-(NSInteger) findMinCoinsRequiredToMakeChangeforMoney :(NSInteger) C fromCoinsArr :(NSArray*) coinsArr {
    NSMutableArray *minArr = [[NSMutableArray alloc] init];
    for (int i=0; i<=C; i++) {
        NSInteger min = MAXFLOAT;
        if (i==0) {
            [minArr addObject:[NSNumber numberWithInteger:0]];
            continue;
        }
        for (int j=0; j<[coinsArr count]; j++) {
            NSInteger index = i-[coinsArr[j] integerValue];
            if (index<0) {
                break;
            }
            NSInteger val = [[minArr objectAtIndex:index] integerValue];
            if (val<=min) {
                min = val;
            }
        }
        [minArr addObject:[NSNumber numberWithInteger:min+1]];
    }
    return [[minArr lastObject] integerValue];
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(Cn)"];
}

@end
