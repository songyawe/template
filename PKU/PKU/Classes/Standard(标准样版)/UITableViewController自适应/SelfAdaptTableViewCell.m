//
//  SelfAdaptTableViewCell.m
//  PKU
//
//  Created by 宋亚伟 on 16/1/19.
//  Copyright © 2016年 SYW. All rights reserved.
//

#import "SelfAdaptTableViewCell.h"

@interface SelfAdaptTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@end

@implementation SelfAdaptTableViewCell
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
}

- (void)setMessage:(NSString *)message{
    _message = message;
    self.contentLabel.text = message;
}

#pragma mark - 返回cell高度方法
- (void)layoutSubviews
{
    [super layoutSubviews];
//    [self.contentView setNeedsLayout];
//    [self.contentView layoutIfNeeded];
    self.contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentLabel.frame);
    
    UIImage *oldImage=[UIImage imageNamed:@"msgs"];
    UIImage *newImage=[oldImage resizableImageWithCapInsets:UIEdgeInsetsMake(25, 30, 25, 34) resizingMode:UIImageResizingModeStretch];
    _backImageView.image=newImage;
}

+ (UINib*)nib
{
    return [UINib nibWithNibName:NSStringFromClass([SelfAdaptTableViewCell class]) bundle:nil];
}

+ (NSString *)cellReuseIdentifier
{
    return [NSString stringWithFormat:@"%@Identifier",NSStringFromClass([SelfAdaptTableViewCell class])];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    static NSString * reuseIdentifier = @"SelfAdaptTableViewCell";
    SelfAdaptTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SelfAdaptTableViewCell class]) owner:self options:nil] firstObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

+ (CGFloat)heightForRow
{
    return 54;
}

+ (CGFloat)heightForRowAtIndexCell:(SelfAdaptTableViewCell *)cell
                         withTable:(UITableView *)tableView
                              message:(NSString *)message
{
    [cell setMessage:message];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height + 1;
}

- (void)drawRect:(CGRect)rect
{
    [self drawSeparatorOfCellContentView:rect];
}

- (void)drawSeparatorOfCellContentView:(CGRect)rect
{
    [self drawSeparatorOfCellContentView:rect padding:0];
}

- (void)drawSeparatorOfCellContentView:(CGRect)rect padding:(CGFloat)padding
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    //下分割线
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextStrokeRect(context, CGRectMake(padding, rect.size.height, rect.size.width-padding*2, 1));
}

//- (void)setContentLabel:(UILabel *)contentLabel{
//    _contentLabel = contentLabel;
//    contentLabel.numberOfLines = 0;
//}


@end
