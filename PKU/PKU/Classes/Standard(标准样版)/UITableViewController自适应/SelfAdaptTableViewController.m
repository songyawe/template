//
//  SelfAdaptTableViewController.m
//  PKU
//
//  Created by 宋亚伟 on 16/1/19.
//  Copyright © 2016年 SYW. All rights reserved.
//

#import "SelfAdaptTableViewController.h"
#import "SelfAdaptTableViewCell.h"

@interface SelfAdaptTableViewController ()
@property (nonatomic, strong) SelfAdaptTableViewCell *selfAdaptTableViewCell;
@property (nonatomic, strong) NSMutableArray *stringArr;
@end

@implementation SelfAdaptTableViewController

/** 屏蔽tableView的样式 */
- (id)init
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"gh_nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    return [self initWithStyle:UITableViewStylePlain];
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stringArr = [[NSMutableArray alloc] init];
    self.title =  @"自适应";
    [self.tableView registerNib:[SelfAdaptTableViewCell nib] forCellReuseIdentifier:[SelfAdaptTableViewCell cellReuseIdentifier]];
    self.selfAdaptTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:[SelfAdaptTableViewCell cellReuseIdentifier]];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.sectionHeaderHeight = 100;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    NSString *message = @"SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试";
        NSString *message1 = @"SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试SS_song测试";
        NSString *message2 = @"SS_song测试";
    [self.stringArr addObject:message];
    [self.stringArr addObject:message1];
    [self.stringArr addObject:message2];
//    [self.tableView reloadData];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.stringArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [SelfAdaptTableViewCell heightForRowAtIndexCell:self.selfAdaptTableViewCell withTable:tableView message:self.stringArr[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SelfAdaptTableViewCell *cell = [SelfAdaptTableViewCell cellWithTableView:tableView indexPath:indexPath];

    cell.message = self.stringArr[indexPath.row];
    return cell;
}



#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}



@end
