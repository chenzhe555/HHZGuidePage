//
//  HHZGuidePageCommonView.m
//  HHZGuidePage
//
//  Created by 仁和Mac on 2017/7/26.
//  Copyright © 2017年 Renhe. All rights reserved.
//

#import "HHZGuidePageCommonView.h"
#import "HHZGuidePageCommonCell.h"

@interface HHZGuidePageCommonView ()<UITableViewDelegate,UITableViewDataSource>

/**
 *  显示的TableView
 */
@property (nonatomic, strong) UITableView * imageTableView;

/**
 *  显示的图片数组
 */
@property (nonatomic, strong) NSMutableArray * imageArr;

/**
 *  点击离开的按钮
 */
@property (nonatomic, strong) UIButton * leaveBtn;
@end

static CGFloat offYWidth;
static CGFloat viewWidth;

@implementation HHZGuidePageCommonView

#pragma mark 初始化数据
-(void)buildGuideViewByImageArray:(NSArray *)imageArr
{
    if (imageArr && imageArr.count > 0)
    {
        self.imageArr = [NSMutableArray array];
        for (int i = 0; i < imageArr.count; ++i)
        {
            [self.imageArr addObject:[UIImage imageNamed:imageArr[i]]];
        }
        [self createTableView];
        [self createLeaveBtn];
    }
    
}

#pragma mark 创建界面
-(void)createTableView
{
    self.imageTableView = [[UITableView alloc] init];
    self.imageTableView.delegate = self;
    self.imageTableView.dataSource = self;
    self.imageTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.imageTableView.showsVerticalScrollIndicator = NO;
    self.imageTableView.showsHorizontalScrollIndicator = NO;
    self.imageTableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.imageTableView.frame = self.bounds;
    self.imageTableView.pagingEnabled = YES;
    self.imageTableView.bounces = NO;
    [self addSubview:self.imageTableView];
}

-(void)createLeaveBtn
{
    self.leaveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leaveBtn.frame = CGRectMake((self.bounds.size.width - 80)/2, (self.bounds.size.height - 80 - 100), 80, 30);
    self.leaveBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.leaveBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [self.leaveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.leaveBtn.backgroundColor = [UIColor colorWithRed:1/255.0 green:168/255.0 blue:236/255.0 alpha:1];
    self.leaveBtn.layer.cornerRadius = 5.0;
    self.leaveBtn.layer.masksToBounds = YES;
    self.leaveBtn.alpha = 0.0f;
    [self addSubview:self.leaveBtn];
    
    [self.leaveBtn addTarget:self action:@selector(logoutGuideView) forControlEvents:UIControlEventTouchUpInside];
    
    viewWidth = self.bounds.size.width;
    offYWidth = (self.imageArr.count - 1)*viewWidth - viewWidth/2.0;
}


#pragma mark UITableView 回调
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imageArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HHZGuidePageCommonCell * cell = [HHZGuidePageCommonCell configCell:tableView IndexPath:indexPath imageArr:self.imageArr size:CGSizeMake(self.imageTableView.bounds.size.width, self.imageTableView.bounds.size.height)];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.bounds.size.width;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > offYWidth)
    {
        self.leaveBtn.alpha = 2 * (scrollView.contentOffset.y - offYWidth)/viewWidth;
    }
    else
    {
        if (self.leaveBtn.alpha > 0.0f)
        {
            self.leaveBtn.alpha = 0.0f;
        }
    }
}

#pragma mark Btn事件
-(void)logoutGuideView
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(dlTapLeaveBtn)])
    {
        [self.delegate dlTapLeaveBtn];
    }
}

#pragma mark 外部改变Btn状态
-(void)changeleaveBtnTitle:(NSString *)title
{
    [self.leaveBtn setTitle:title forState:UIControlStateNormal];
}

-(void)changeleaveBtnFrame:(CGRect)rect
{
    self.leaveBtn.frame = rect;
}
@end
