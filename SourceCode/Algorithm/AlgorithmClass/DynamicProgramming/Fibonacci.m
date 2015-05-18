//
//  Fibonacci.m
//  Algorithm
//
//  Created by Mohit Trivedi on 15/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "Fibonacci.h"

@interface Fibonacci ()
@property (nonatomic,strong) NSMutableDictionary *memTableDic;
@end

@implementation Fibonacci

-(void) runTheAlgorithm {
    // Get the 15th Fibonacci number
    NSInteger num = 15;
    self.memTableDic = [[NSMutableDictionary alloc] init];
    NSInteger fibNum = [self getFibonacciNum : num];
    [super printOutput:[NSString stringWithFormat:@"%ldth Fibonacci number is %@",num,[NSNumber numberWithInteger:fibNum]]];
}

-(NSInteger) getFibonacciNum :(NSInteger) index {
    if (index==1) {
        return 0;
    }
    else if (index == 2) {
        return 1;
    }
    if ([self isFibNumberExistforIndex:index]) {
        return [self getFibNumberfromMemTableforIndex:index];
    }
    else {
        NSInteger fibNum = ([self getFibonacciNum:index-1] + [self getFibonacciNum:index-2]);
        [self setFibNumberinTableforIndex:index num:fibNum];
        return fibNum;
    }
}

-(BOOL) isFibNumberExistforIndex : (NSInteger) index {
    return [_memTableDic objectForKey:[NSNumber numberWithInteger:index]] != nil;
}

-(NSInteger) getFibNumberfromMemTableforIndex :(NSInteger) index {
    return [[_memTableDic objectForKey:[NSNumber numberWithInteger:index]] integerValue];
}

-(void) setFibNumberinTableforIndex : (NSInteger) index num:(NSInteger) fibNum{
    [_memTableDic setObject:[NSNumber numberWithInteger:fibNum] forKey:[NSNumber numberWithInteger:index]];
}

-(NSString*) getTimeComplexity {
    return [NSString stringWithFormat:@"O(n)"];
}


@end
