//
//  LongestIncreasingSubsequece.m
//  Algorithm
//
//  Created by Mohit Trivedi on 19/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "LongestIncreasingSubsequece.h"

@implementation LongestIncreasingSubsequece

-(void) runTheAlgorithm {
    // Define the input
    NSArray *inputArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:20],[NSNumber numberWithInt:30],[NSNumber numberWithInt:10],[NSNumber numberWithInt:15],[NSNumber numberWithInt:50],[NSNumber numberWithInt:50], nil];
    NSInteger longestLength = [self findLongestIncreasingSubsequence:inputArr];
    [super printOutput:[NSString stringWithFormat:@"Longest increasing subsequence of the sequence %@ is %@",inputArr,[NSNumber numberWithInteger:longestLength]]];
}

-(NSInteger) findLongestIncreasingSubsequence :(NSArray*) inputArr {
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    // L(0) = 0
    for (int j=0; j<[inputArr count]; j++) {
        NSInteger maxVal = 0;
        for (int i=0; i<j; i++) {
            if ([[inputArr objectAtIndex:i] integerValue] >= [[inputArr objectAtIndex:j] integerValue]) {
                // Do nothing
            }
            else {
                maxVal = MAX(maxVal, [[tempArr objectAtIndex:i] integerValue]);
            }
            
        }
        [tempArr addObject:[NSNumber numberWithInteger:maxVal+1]];
    }
    // Max(L(j))
    NSInteger max = 0;
    for (int i=0; i<[tempArr count]; i++) {
        max = MAX(max, [[tempArr objectAtIndex:i] integerValue]);
    }
    return max;
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(n*n)"];
}

@end
