//
//  BalancePartition.m
//  Algorithm
//
//  Created by Mohit Trivedi on 28/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "BalancePartition.h"

@implementation BalancePartition

-(void) runTheAlgorithm {
    // Define the input
    NSArray *arr = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:2],[NSNumber numberWithInt:1],[NSNumber numberWithInt:13], nil];
    NSInteger sum = 0;
    for (int i=0; i<[arr count]; i++) {
        sum += [[arr objectAtIndex:i] integerValue];
    }
    
    NSArray *pArr = [self createBooleanArr:arr sum:sum];
    NSInteger diffVal = [self findOptimalDifference :pArr sum:sum];
    [super printOutput:[NSString stringWithFormat:@"Min|S1-S2| in array %@ is %ld",arr, diffVal]];
    // Uncomment below to run the Subset sum problem
//    sum = 15;
//    NSMutableArray *pArr = [self createBooleanArr:arr sum:sum];
//    BOOL isExist = [[[pArr lastObject] lastObject] integerValue];
//    [super printOutput:isExist?[NSString stringWithFormat:@"Subset exists in array %@, whose sum is %ld",arr,sum]:[NSString stringWithFormat:@"Subset does not exist in array %@, whose sum is %ld",arr,sum]];
}

-(NSInteger) findOptimalDifference :(NSArray*)pArr sum:(NSInteger)sum{
    NSInteger min = MAXFLOAT;
    for (int j=0; j<[[pArr lastObject] count]; j++) {
        if ([[[pArr lastObject] objectAtIndex:j] integerValue]) {
            if (sum>=2*j) {
                min = MIN(min, sum-2*j);
            }
        }
    }
    return min;
}

-(NSMutableArray*) createBooleanArr :(NSArray*)arr sum:(NSInteger)sum{
    NSMutableArray *pArr = [[NSMutableArray alloc] init];
    for (int i=0; i<=[arr count]; i++) {
        NSMutableArray *rowArr = [[NSMutableArray alloc] init];
        for (int j=0; j<=sum; j++) {
            if (j==0) {
                [rowArr addObject:[NSNumber numberWithInteger:1]];
            }
            else if (i==0) {
                [rowArr addObject:[NSNumber numberWithInteger:0]];
            }
            else {
                NSInteger a = [[[pArr objectAtIndex:i-1] objectAtIndex:j] integerValue];
                NSInteger b = 0;
                if ((j-[[arr objectAtIndex:i-1] integerValue])>=0) {
                    b = [[[pArr objectAtIndex:i-1] objectAtIndex:(j-[[arr objectAtIndex:i-1] integerValue])] integerValue];
                }
                [rowArr addObject:[NSNumber numberWithInteger:MAX(a, b)]];
            }
        }
        [pArr addObject:rowArr];
    }
    return pArr;
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(n*n*k)"];
}

@end
