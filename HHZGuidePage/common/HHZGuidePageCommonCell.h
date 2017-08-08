//
//  HHZGuidePageCommonCell.h
//  HHZGuidePage
//
//  Created by 仁和Mac on 2017/7/26.
//  Copyright © 2017年 Renhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHZGuidePageCommonCell : UITableViewCell
+(HHZGuidePageCommonCell *)configCell:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath imageArr:(NSArray *)arr size:(CGSize)size;
@end
