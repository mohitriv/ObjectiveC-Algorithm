//
//  EditDistance.m
//  Algorithm
//
//  Created by Mohit Trivedi on 01/06/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "EditDistance.h"

@interface EditDistance() {
    NSInteger cI,cD,cR;
}
@end

@implementation EditDistance

-(void) runTheAlgorithm {
    // Define the input
    NSArray *aArr = [NSArray arrayWithObjects:[NSNumber numberWithChar:'p'],[NSNumber numberWithChar:'l'],[NSNumber numberWithChar:'a'],[NSNumber numberWithChar:'s'],[NSNumber numberWithChar:'m'],[NSNumber numberWithChar:'a'], nil];
    NSArray *bArr = [NSArray arrayWithObjects:[NSNumber numberWithChar:'a'],[NSNumber numberWithChar:'l'],[NSNumber numberWithChar:'t'],[NSNumber numberWithChar:'r'],[NSNumber numberWithChar:'u'],[NSNumber numberWithChar:'i'],[NSNumber numberWithChar:'s'],[NSNumber numberWithChar:'m'], nil];
    cI = 1;cD = 1;cR = 1;
    NSInteger minCost = [self findEditDistanceBetween:aArr andArray:bArr];
    [super printOutput:[NSString stringWithFormat:@"Edit Distance cost converting array %@ into array %@ is %ld if Cost for insertion, deletion and replacement are %ld %ld %ld respectively",aArr,bArr,minCost,cI,cD,cR]];
}

// E(i,j) = Min {cD + E(i-1,j), E(i,j-1) + cI, E(i-1,j-1), E(i-1,j-1) + cR}

-(NSInteger) findEditDistanceBetween :(NSArray*) aArr andArray:(NSArray*)bArr {
    NSMutableArray *edArr = [[NSMutableArray alloc] init];
    for (int i=0; i<=[aArr count]; i++) {
        NSMutableArray *rowArr = [[NSMutableArray alloc] init];
        for (int j=0; j<=[bArr count]; j++) {
            if (j==0) {
                [rowArr addObject:[NSNumber numberWithInteger:i*cD]];
            }
            else if (i==0) {
                [rowArr addObject:[NSNumber numberWithInteger:j*cI]];
            }
            else {
                NSInteger min = MAXFLOAT;
                min = MIN(cD + [[[edArr objectAtIndex:i-1] objectAtIndex:j] integerValue], [[rowArr objectAtIndex:j-1] integerValue] + cI);
                if ([[aArr objectAtIndex:i-1] integerValue] == [[bArr objectAtIndex:j-1] integerValue]) {
                    min = MIN(min, [[[edArr objectAtIndex:i-1] objectAtIndex:j-1] integerValue]);
                }
                else {
                    min = MIN(min, [[[edArr objectAtIndex:i-1] objectAtIndex:j-1] integerValue] + cR);
                }
                [rowArr addObject:[NSNumber numberWithInteger:min]];
            }
        }
        [edArr addObject:rowArr];
    }
    return [[[edArr lastObject] lastObject] integerValue];
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(n*m)"];
}

// Next N egg K floor, Boolean parenthesization

@end
