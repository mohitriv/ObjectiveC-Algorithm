//
//  DetailViewController.h
//  Algorithm
//
//  Created by Mohit Trivedi on 14/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//




// Feature 1
// HEAD1


#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property(nonatomic,weak) IBOutlet UILabel *nameLbl;
@property(nonatomic,weak) IBOutlet UILabel *timeCompLbl;
@property(nonatomic,strong) NSString *nameStr;
@property(nonatomic,strong) NSString *titleStr;
@end
