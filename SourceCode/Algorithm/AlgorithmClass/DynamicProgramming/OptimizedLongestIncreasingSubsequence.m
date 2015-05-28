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
    // Define the input. Assuming all the numbers will be distinct.
    NSArray *inputArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:20],[NSNumber numberWithInt:10],[NSNumber numberWithInt:42],[NSNumber numberWithInt:25],[NSNumber numberWithInt:50],[NSNumber numberWithInt:15],[NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:18],[NSNumber numberWithInt:7],[NSNumber numberWithInt:9], nil];
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
            [self deleteSameLengthElements:0 :tempArr];
        }
        else if ([tempArr count] > 0 && elem > [[[tempArr objectAtIndex:[tempArr count]-1] objectForKey:@"EndElement"] integerValue]) {
            // Largest. Clone the largest element in tempArr and extend it.
            NSInteger count = [[[tempArr objectAtIndex:[tempArr count]-1] objectForKey:@"Count"] integerValue]+1;
            [tempArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:[inputArr objectAtIndex:i],@"EndElement",[NSNumber numberWithInteger:count],@"Count", nil]];
        }
        else if([tempArr count] > 0) {
            // Middle. Find the largest number in tempArr that is smaller than elem. clone it and extend the elem and delete all the same length elements from tempArr.
            // Find the largest element that is less than current element
            NSInteger index = [self findLargestElementLessThanCurrent:elem :tempArr];
            // Clone and Extend
            NSInteger count = [[[tempArr objectAtIndex:index] objectForKey:@"Count"] integerValue]+1;
            [tempArr insertObject:[NSDictionary dictionaryWithObjectsAndKeys:[inputArr objectAtIndex:i],@"EndElement",[NSNumber numberWithInteger:count],@"Count", nil] atIndex:index+1];
            // Delete the same length Elements
            [self deleteSameLengthElements : index+1 : tempArr];
        }
        else if([tempArr count] == 0) {
            [tempArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:[inputArr objectAtIndex:i],@"EndElement",[NSNumber numberWithInt:1],@"Count", nil]];
        }
        
        NSLog(@"TempArr %@",tempArr);
    }
    
    return [[[tempArr objectAtIndex:[tempArr count]-1] objectForKey:@"Count"] integerValue];
}

-(NSInteger) findLargestElementLessThanCurrent :(NSInteger) elem :(NSArray*) tempArr{
    return [self findMaximumNumLessThanElem:0 :[tempArr count]-1 :tempArr :elem];
}

- (NSInteger)findMaximumNumLessThanElem :(NSInteger)low :(NSInteger)high :(NSArray*)tempArr :(NSInteger) searchElem {
    // This runs in O(lg(n))
    if (low==high) {
        return low;
    }
    NSInteger middle = (low+high)/2;
    if (middle+1 < [tempArr count] && [[[tempArr objectAtIndex:middle] objectForKey:@"EndElement"] integerValue]<searchElem && [[[tempArr objectAtIndex:middle+1] objectForKey:@"EndElement"] integerValue]>searchElem) {
        return middle;
    }
    else if ([[[tempArr objectAtIndex:middle] objectForKey:@"EndElement"] integerValue]<searchElem) {
        return [self findMaximumNumLessThanElem:middle+1 :high :tempArr :searchElem];
    }
    else {
        return [self findMaximumNumLessThanElem:low :middle-1 :tempArr :searchElem];
    }
}

-(void) deleteSameLengthElements :(NSInteger) index :(NSMutableArray*) tempArr {
    // This seems to run in O(n) but it runs only once O(1)
    NSInteger len = [[[tempArr objectAtIndex:index] objectForKey:@"Count"] integerValue];
    for (NSInteger i=index+1; i<[tempArr count]; i++) {
        if ([[[tempArr objectAtIndex:i] objectForKey:@"Count"] integerValue] == len) {
            [tempArr removeObjectAtIndex:i];
            i--;
            break;
        }
    }
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(n*lg(n))\n\nApplications: Box stacking and building bridges."];
}


@end
