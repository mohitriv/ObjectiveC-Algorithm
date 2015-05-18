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

-(NSInteger) findMinCoinsRequiredToMakeChangeforMoney :(NSInteger) C fromCoinsArr :(NSArray*) coinsArr {
    return nil;
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(Cn)"];
}

@end
