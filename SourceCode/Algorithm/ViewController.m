//
//  ViewController.m
//  Algorithm
//
//  Created by Mohit Trivedi on 14/05/15.
//  Copyright (c) 2015 Mohit Trivedi. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "Constant.h"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSArray *sectionArray;
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Algorithm";
    self.dataArray = [[NSMutableArray alloc] init];
    NSArray *algoNameArr = [NSArray arrayWithObjects:FIBONACCI,POWER,MAXVALCONSEQ,MAKINGCHANGE,LONGESTINCREASINGSUBSEQ1, nil];
    self.sectionArray = [NSArray arrayWithObjects:DYNAMICPROGRAMMING, nil];
    [self createRow:algoNameArr];
}

-(void) createRow :(NSArray*)algoNameArr {
    for (NSString *algoName in algoNameArr) {
        [_dataArray addObject:algoName];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:MAINTODETAILSEG]) {
        DetailViewController *dvc = (DetailViewController*)[segue destinationViewController];
        dvc.nameStr = [_dataArray objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        dvc.titleStr = [_sectionArray objectAtIndex:[self.tableView indexPathForSelectedRow].section];
    }
}

#pragma mark - Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *sectionName;
    sectionName = [_sectionArray objectAtIndex:section];
    return sectionName;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
