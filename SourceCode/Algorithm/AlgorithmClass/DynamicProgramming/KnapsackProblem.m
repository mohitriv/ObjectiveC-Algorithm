//
//  KnapsackProblem.m
//  Algorithm
//
//  Created by Mohit Trivedi on 27/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "KnapsackProblem.h"

@implementation KnapsackProblem

-(void) runTheAlgorithm {
    // Define the input
    NSArray *inputArr = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:2], @"Weight", [NSNumber numberWithInt:3], @"Value", nil],[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:3], @"Weight", [NSNumber numberWithInt:5], @"Value", nil],[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:4], @"Weight", [NSNumber numberWithInt:5], @"Value", nil],[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:5], @"Weight", [NSNumber numberWithInt:3], @"Value", nil], nil];
    NSInteger maxCapacity = 14;
    NSInteger maxValue = [self findMaxValue:inputArr capacity:maxCapacity];
    [super printOutput:[NSString stringWithFormat:@"Maximum value for subsequence of the sequence %@ is %@",inputArr,[NSNumber numberWithInteger:maxValue]]];
}

// M(i,j) = Max{ M(i-1,j), M(i-1,j-s(i))+v(i)}

-(NSInteger) findMaxValue :(NSArray*) inputArr capacity:(NSInteger)maxCapacity {
    NSInteger maxVal = 0;
    NSMutableArray *mArr = [[NSMutableArray alloc] init];
    for (int i=0; i<=[inputArr count]; i++) {
        NSMutableArray *rowArr = [[NSMutableArray alloc] init];
        for (int j=0; j<=maxCapacity; j++) {
            if (j==0) {
                [rowArr addObject:[NSNumber numberWithInt:0]];
            }
            else if (i==0) {
                [rowArr addObject:[NSNumber numberWithInt:0]];
            }
            else {
                NSInteger val = 0;
                if (j-([[[inputArr objectAtIndex:i-1] objectForKey:@"Weight"] integerValue])>=0) {
                    val = [[[mArr objectAtIndex:i-1] objectAtIndex:j-([[[inputArr objectAtIndex:i-1] objectForKey:@"Weight"] integerValue])] integerValue] + [[[inputArr objectAtIndex:i-1] objectForKey:@"Value"] integerValue];
                }
                NSInteger optimumVal = MAX([[[mArr objectAtIndex:i-1] objectAtIndex:j] integerValue], val);
                [rowArr addObject:[NSNumber numberWithInteger:optimumVal]];
            }
        }
        [mArr addObject:rowArr];
    }
    for (int i=0; i<=maxCapacity; i++) {
        maxVal = MAX([[[mArr lastObject] objectAtIndex:i] integerValue], maxVal);
    }
    
    return maxVal;
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(Cn)"];
}


@end
