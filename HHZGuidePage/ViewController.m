//
//  ViewController.m
//  HHZGuidePage
//
//  Created by 仁和Mac on 2017/7/26.
//  Copyright © 2017年 Renhe. All rights reserved.
//

#import "ViewController.h"
#import "HHZGuidePageCommonView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    HHZGuidePageCommonView * guideView = [[HHZGuidePageCommonView alloc] init];
    guideView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:guideView];
    
    [guideView buildGuideViewByImageArray:@[@"guide1",@"guide2",@"guide3"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
