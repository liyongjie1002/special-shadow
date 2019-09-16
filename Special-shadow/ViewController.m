//
//  ViewController.m
//  Special-shadow
//
//  Created by 李永杰 on 2019/7/23.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "ViewController.h"
#import "MDMeDataScoreView.h"
#import "MDScoreDropView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, 143)];
    [self.view addSubview:view];
    
    MDMeDataScoreView *scoreView = [[MDMeDataScoreView alloc]initWithFrame:CGRectMake(15, 9, kScreenWidth-30, 125)];
    [view addSubview:scoreView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAction)];
    [scoreView addGestureRecognizer:tap];
}

-(void)clickAction {
    MDScoreDropView *dropView = [[MDScoreDropView alloc]initWithFrame:CGRectMake(0, 134, kScreenWidth, kScreenHeight - 134) adds:[NSMutableArray arrayWithObjects:@"购买积分商品", nil] downs:[NSMutableArray arrayWithObjects:@"全部奖励",@"行车安全",@"养修安行", nil]];
    [self.view addSubview:dropView];
}

@end
