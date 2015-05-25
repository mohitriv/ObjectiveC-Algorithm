//
//  LongestIncreasingSubsequence.m
//  Algorithm
//
//  Created by Mohit Trivedi on 22/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "OptimizedLongestIncreasingSubsequence.h"

@implementation OptimizedLongestIncreasingSubsequence

-(void) runTheAlgorithm {
    // Define the input
    NSArray *inputArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:30],[NSNumber numberWithInt:45],[NSNumber numberWithInt:10],[NSNumber numberWithInt:15], nil];
    NSInteger longestLength = [self findLongestIncreasingSubsequence:inputArr];
    [super printOutput:[NSString stringWithFormat:@"Longest increasing subsequence of the sequence %@ is %@",inputArr,[NSNumber numberWithInteger:longestLength]]];
}

-(NSInteger) findLongestIncreasingSubsequence :(NSArray*) inputArr {
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    for (int i=0; i<[inputArr count]; i++) {
        NSInteger elem = [[inputArr objectAtIndex:i] integerValue];
        // Check for conditions
        if ([tempArr count] > 0 && elem < [[[tempArr objectAtIndex:0] objectForKey:@"EndElement"] integerValue]) {
            // Smallest. Create new element in tempArr
            [tempArr insertObject:[NSDictionary dictionaryWithObjectsAndKeys:[inputArr objectAtIndex:i],@"EndElement",[NSNumber numberWithInt:1],@"Count", nil] atIndex:0];
        }
        else if ([tempArr count] > 0 && elem > [[[tempArr objectAtIndex:[tempArr count]-1] objectForKey:@"EndElement"] integerValue]) {
            // Largest. Clone the largest element in tempArr and extend it.
            NSInteger count = [[[tempArr objectAtIndex:[tempArr count]-1] objectForKey:@"Count"] integerValue]+1;
            [tempArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:[inputArr objectAtIndex:i],@"EndElement",[NSNumber numberWithInteger:count],@"Count", nil]];
        }
        else if([tempArr count] > 0) {
            // Middle. Find the largest number in tempArr that is smaller than elem. clone it and extend the elem and delete all the same length elements from tempArr.
            //Find the largest element that is less than current element
            NSInteger index = [self findLargestElementLessThanCurrent:elem :tempArr];
            // Clone and Extend
            NSInteger count = [[[tempArr objectAtIndex:index] objectForKey:@"Count"] integerValue]+1;
            //[tempArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:[inputArr objectAtIndex:i],@"EndElement",[NSNumber numberWithInteger:count],@"Count", nil]];
            [tempArr insertObject:[NSDictionary dictionaryWithObjectsAndKeys:[inputArr objectAtIndex:i],@"EndElement",[NSNumber numberWithInteger:count],@"Count", nil] atIndex:index+1];
            // Delete the same length Elements
            [self deleteSameLengthElements : index : tempArr];
        }
        else if([tempArr count] == 0) {
            [tempArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:[inputArr objectAtIndex:i],@"EndElement",[NSNumber numberWithInt:1],@"Count", nil]];
        }
        
        NSLog(@"TempArr %@",tempArr);
    }
    
    return [[[tempArr objectAtIndex:[tempArr count]-1] objectForKey:@"Count"] integerValue];
}

-(NSInteger) findLargestElementLessThanCurrent :(NSInteger) elem :(NSArray*) tempArr{
    for (int i=0; i<[tempArr count]; i++) {
        NSInteger endElem = [[[tempArr objectAtIndex:i] objectForKey:@"EndElement"] integerValue];
        if (endElem>elem) {
            return i-1;
        }
    }
    return 0;
}

-(void) deleteSameLengthElements :(NSInteger) index :(NSMutableArray*) tempArr {
    NSInteger len = [[[tempArr objectAtIndex:index] objectForKey:@"Count"] integerValue];
    for (NSInteger i=index+1; i<[tempArr count]; i++) {
        if ([[[tempArr objectAtIndex:i] objectForKey:@"Count"] integerValue] == len) {
            [tempArr removeObjectAtIndex:i];
            i--;
        }
    }
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(n*lg(n))"];
}


@end
