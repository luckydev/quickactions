//
//  TWMasterViewController.m
//  quickactions
//
//  Created by Anand on 08/12/13.
//  Copyright (c) 2013 Luckydev. All rights reserved.
//

#import "TWMasterViewController.h"


@interface TWMasterViewController () {
    NSMutableArray *_objects;
}

@property (nonatomic, retain) NSIndexPath* indexPathSelected;

@end

@implementation TWMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!self.indexPathSelected) {
        return 2;
    }

    if (self.indexPathSelected.section == section) {
        return 3;
    }else {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"New row";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (self.indexPathSelected) {

        NSIndexPath* prevSelected = [self.indexPathSelected copy];
        NSArray* rowsToDelete = @[[NSIndexPath indexPathForRow:1 inSection:prevSelected.section]];

        self.indexPathSelected = nil;
        [tableView deleteRowsAtIndexPaths:rowsToDelete withRowAnimation:UITableViewRowAnimationFade];

        if (prevSelected.section == indexPath.section) {
            //do nothing. delete and return
            return;
        }

    }

    //add the rows
    self.indexPathSelected = indexPath;
    NSArray* rowsToAdd = @[[NSIndexPath indexPathForRow:1 inSection:indexPath.section]];
    [tableView insertRowsAtIndexPaths:rowsToAdd withRowAnimation:UITableViewRowAnimationFade];
}

@end
