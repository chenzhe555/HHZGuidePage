//
//  HHZGuidePageCommonView.h
//  HHZGuidePage
//
//  Created by 仁和Mac on 2017/7/26.
//  Copyright © 2017年 Renhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HHZGuidePageCommonViewDelegate <NSObject>
/**
 *  点击立即体验退出按钮
 */
-(void)dlTapLeaveBtn;

@end

@interface HHZGuidePageCommonView : UIView
@property (nonatomic, assign) id<HHZGuidePageCommonViewDelegate> delegate;
/**
 *  传入图片名称生成引导页
 *  imageArr 图片名称数组
 */
-(void)buildGuideViewByImageArray:(NSArray *)imageArr;

/**
 *  改变点击离开按钮的名称（默认是立即体验）
 */
-(void)changeleaveBtnTitle:(NSString *)title;

/**
 *  改变点击离开按钮的Frame
 */
-(void)changeleaveBtnFrame:(CGRect)rect;
@end
