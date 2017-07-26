//
//  HHZGuidePageCommonCell.m
//  HHZGuidePage
//
//  Created by 仁和Mac on 2017/7/26.
//  Copyright © 2017年 Renhe. All rights reserved.
//

#import "HHZGuidePageCommonCell.h"

@interface HHZGuidePageCommonCell ()
@property (nonatomic, strong) UIImageView * guideImageView;
@end

@implementation HHZGuidePageCommonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.guideImageView = [[UIImageView alloc] init];
        [self addSubview:self.guideImageView];
    }
    return self;
}

+(HHZGuidePageCommonCell *)configCell:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath imageArr:(NSArray *)arr size:(CGSize)size
{
    static NSString * cellIndentifier = @"HHZGuidePageCommonCellndentifier";
    HHZGuidePageCommonCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell)
    {
        cell = [[HHZGuidePageCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.transform = CGAffineTransformMakeRotation(M_PI_2);
        cell.frame = CGRectMake(0, 0, size.width, size.height);
        cell.guideImageView.frame = cell.bounds;
    }
    cell.guideImageView.image = arr[indexPath.row];
    return cell;
}

@end
