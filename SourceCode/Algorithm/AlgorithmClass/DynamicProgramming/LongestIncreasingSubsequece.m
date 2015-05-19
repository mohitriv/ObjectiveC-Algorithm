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
    NSArray *inputArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:20],[NSNumber numberWithInt:30],[NSNumber numberWithInt:40],[NSNumber numberWithInt:20],[NSNumber numberWithInt:30],[NSNumber numberWithInt:10], nil];
    //[super printOutput:[NSString stringWithFormat:@"Maximum sum for subsequence of the sequence %@ is %@",inputArr,[NSNumber numberWithInteger:maxSum]]];
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(n*n)"];
}


@end
