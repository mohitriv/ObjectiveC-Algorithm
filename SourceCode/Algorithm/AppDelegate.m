//
//  AppDelegate.m
//  Algorithm
//
//  Created by Mohit Trivedi on 14/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    // Instance variables
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self stringLearning];
    
    return YES;
}

- (void)stringLearning {
    NSString *textString = [NSString stringWithFormat:@"constant str1 str2 str3"];
    
    NSMutableDictionary *charDictionary = [[NSMutableDictionary alloc] init];
    
    NSString *tokenString = @"";
    
    for (int i=0; i<textString.length; i++) {
        NSString *charStr = [NSString stringWithFormat:@"%d",[textString characterAtIndex:i]];
        if ([charDictionary objectForKey:charStr]) {
            NSInteger prevVal = [[charDictionary objectForKey:charStr] integerValue]+1;
            [charDictionary setObject:[NSNumber numberWithInteger:prevVal] forKey:charStr];
        }
        else {
            [charDictionary setObject:[NSNumber numberWithInteger:1] forKey:charStr];
        }
    }
    
    NSMutableArray *countArr = [[NSMutableArray alloc] init];
    
    for (int i=0; i<tokenString.length; i++) {
        NSString *charKey = [NSString stringWithFormat:@"%d",[tokenString characterAtIndex:i]];
        if ([charDictionary objectForKey:charKey]) {
            NSNumber *val = [charDictionary objectForKey:charKey];
            [countArr addObject:val];
        }
        else {
            break;
        }
    }
    
    NSInteger minVal = 0;
    if ([countArr count]==tokenString.length && [countArr count]>0) {
        minVal = [[countArr objectAtIndex:0] integerValue];
        for (int i=1; i<[countArr count]; i++) {
            minVal = MIN(minVal, [[countArr objectAtIndex:i] integerValue]);
        }
        NSLog(@"Toekn occurs %ld times in a string",minVal);
    }
    else {
        NSLog(@"Token does not exist or empty");
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
