// RDVFirstViewController.m
// RDVTabBarController
//
// Copyright (c) 2013 Robert Dimitrov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RDVFirstViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "SelfAdaptTableViewController.h"

@implementation RDVFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //带xib的会走
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"标准样版";
    self.titleArr = [[NSMutableArray alloc] init];
    NSString *title1 = @"UItableView自适应";
    [self.titleArr addObject:title1];
    
    [[self rdv_tabBarItem] setBadgeValue:@"3"];
    
    if (self.rdv_tabBarController.tabBar.translucent) {
        UIEdgeInsets insets = UIEdgeInsetsMake(0,
                                               0,
                                               CGRectGetHeight(self.rdv_tabBarController.tabBar.frame),
                                               0);
        
        self.tableView.contentInset = insets;
        self.tableView.scrollIndicatorInsets = insets;
    }
}

- (NSUInteger)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskAll;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return YES;
    }
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;
}

#pragma mark - Methods

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    [[cell textLabel] setText:self.titleArr[indexPath.row]];
}

#pragma mark - Table view

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [[self rdv_tabBarItem] setBadgeValue:[NSString stringWithFormat:@"%ld", indexPath.row+1]];
    if (indexPath.row == 0) {
        SelfAdaptTableViewController *adapt = [[SelfAdaptTableViewController alloc] init];
        [self.navigationController pushViewController:adapt animated:YES];
    }
}

@end
