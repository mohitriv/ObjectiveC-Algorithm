//
//  MaxValContSubsequence.m
//  Algorithm
//
//  Created by Mohit Trivedi on 14/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "MaxValContSubsequence.h"

@implementation MaxValContSubsequence

-(void) runTheAlgorithm {
    // Define the input
    NSArray *inputArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:20],[NSNumber numberWithInt:30],[NSNumber numberWithInt:-40],[NSNumber numberWithInt:-20],[NSNumber numberWithInt:30],[NSNumber numberWithInt:-10], nil];
    NSInteger maxSum = [self findMaxSum:inputArr count:[inputArr count]];
    [super printOutput:[NSString stringWithFormat:@"Maximum sum for subsequence of the sequence %@ is %@",inputArr,[NSNumber numberWithInteger:maxSum]]];
}

-(NSInteger) findMaxSum :(NSArray*) arr count:(NSInteger) count {
    NSInteger maxSum = 0;
    NSInteger currSum = 0;
    for (int i=0; i<count; i++) {
        currSum += [[arr objectAtIndex:i] integerValue];
        if (currSum<0) {
            currSum = 0;
        }
        if (currSum>maxSum) {
            maxSum = currSum;
        }
    }
    return maxSum;
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(n)"];
}

@end
