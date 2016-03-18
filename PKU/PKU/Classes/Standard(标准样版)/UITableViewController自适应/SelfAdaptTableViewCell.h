//
//  SelfAdaptTableViewCell.h
//  PKU
//
//  Created by 宋亚伟 on 16/1/19.
//  Copyright © 2016年 SYW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SelfAdaptTableViewCell;

@interface SelfAdaptTableViewCell : UITableViewCell
#pragma mark -传递数据
@property(nonatomic, copy) NSString *message;
#pragma mark -自适应的相关方法
+ (UINib*)nib;
+ (NSString *)cellReuseIdentifier;
+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
@property (nonatomic, copy) NSIndexPath *indexPath;
+ (CGFloat)heightForRow;
+ (CGFloat)heightForRowAtIndexCell:(SelfAdaptTableViewCell *)cell
                         withTable:(UITableView *)tableView
                              message:(NSString *)message;


@end
