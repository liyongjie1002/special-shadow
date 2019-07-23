//
//  ViewController.m
//  Special-shadow
//
//  Created by 李永杰 on 2019/7/23.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "ViewController.h"
#import "MDMeDataScoreView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, 143)];
    [self.view addSubview:view];
    
    MDMeDataScoreView *scoreView = [[MDMeDataScoreView alloc]initWithFrame:CGRectMake(15, 9, kScreenWidth-30, 125)];
    [view addSubview:scoreView];
    // Do any additional setup after loading the view.
}


@end
