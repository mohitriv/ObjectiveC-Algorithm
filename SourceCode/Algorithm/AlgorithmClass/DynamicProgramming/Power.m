//
//  Power.m
//  Algorithm
//
//  Created by Mohit Trivedi on 15/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "Power.h"

@implementation Power

-(void) runTheAlgorithm {
    // Define the input
    NSInteger a= 2, n = 4;
    NSInteger num = [self getPowerofNumber:a times:n];
    [super printOutput:[NSString stringWithFormat:@"Power(%ld,%ld) is %ld",a,n,num]];
}

-(NSInteger) getPowerofNumber :(NSInteger) a times:(NSInteger) n {
    if (n==1) {
        return a;
    }
    else if (n==0) {
        return 1;
    }
    if (n%2==0) {
        //even
        NSInteger res = [self getPowerofNumber:a times:n/2];
        return res*res;
    }
    else {
        //odd
        NSInteger res = [self getPowerofNumber:a times:(n-1)/2];
        return res*res*a;
    }
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(lg(n))"];
}

@end
