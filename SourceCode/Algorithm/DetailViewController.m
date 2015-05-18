//
//  DetailViewController.m
//  Algorithm
//
//  Created by Mohit Trivedi on 14/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "DetailViewController.h"
#import "Constant.h"
#import "AlgorithmParent.h"
#import "MaxValContSubsequence.h"
#import "Fibonacci.h"
#import "Power.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _titleStr;
    self.nameLbl.text = _nameStr;
}

-(void) viewWillAppear:(BOOL)animated {
    if (self.isMovingToParentViewController) {
        // Run the algorithm
        AlgorithmParent *ap;
        if ([_titleStr isEqualToString:DYNAMICPROGRAMMING]) {
            if ([_nameStr isEqualToString:MAXVALCONSEQ]) {
                ap = [MaxValContSubsequence alloc];
            }
            else if ([_nameStr isEqualToString:MAKINGCHANGE]) {
               
            }
            else if ([_nameStr isEqualToString:FIBONACCI]) {
                ap = [Fibonacci alloc];
            }
            else if ([_nameStr isEqualToString:POWER]) {
                ap = [Power alloc];
            }
        }
        if (ap) {
            [ap runTheAlgorithm];
            self.timeCompLbl.text = [ap getTimeComplexity];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
