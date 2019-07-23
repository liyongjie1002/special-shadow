//
//  MDMeDataScoreView.m
//  Muheda
//
//  Created by 李永杰 on 2019/7/23.
//  Copyright © 2019 于朝盼. All rights reserved.
//
#define kMeDataScoreTopHeight                       33
#define kMeDataScoreTitleImageViewTopMargin         13
#define kMeDataScoreTitleImageViewLeftMargin        8
#define kMeDataScoreTitleLabelTopMargin             10

#define kMeDataScoreButtonTopMargin                 7
#define kMeDataScoreButtonWidth                     100

#define kMeDataScoreTotalTopMargin                  37


#import "MDMeDataScoreView.h"
#import "UIView+Additional.h"
#import "UIButton+Style.h"

@interface MDMeDataScoreView ()

@property (nonatomic, strong) UIView        *contentView;

@property (nonatomic, strong) UIImageView   *titleImageView;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UIButton      *scoreButton;

@property (nonatomic, strong) UILabel       *totalLabel;
@property (nonatomic, strong) UILabel       *scoreLabel;

@end

@implementation MDMeDataScoreView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = self.bounds;

    [self shadowWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.05] opacity:1 shadowRadius:15 radius:8];
    
    self.titleImageView.frame = CGRectMake(kMeDataScoreTitleImageViewLeftMargin, kMeDataScoreTitleImageViewTopMargin, 15, 15);
    
    self.titleLabel.frame = CGRectMake(self.titleImageView.right + 6, kMeDataScoreTitleLabelTopMargin, 70, 21);
    
    self.scoreButton.frame = CGRectMake(0, kMeDataScoreButtonTopMargin, kMeDataScoreButtonWidth, 26);
    self.scoreButton.right = self.width;
    [self.scoreButton layoutButtonWithEdgeInsetsStyle:MDButtonEdgeInsetsStyleLeft imageTitleSpace:4];
    
    self.totalLabel.frame = CGRectMake(0, kMeDataScoreTotalTopMargin, 110, 20);
    self.totalLabel.centerX = self.width / 2.0;

    self.scoreLabel.frame = CGRectMake(0, self.totalLabel.bottom + 6, 127, 45);
    self.scoreLabel.centerX = self.width / 2.0;
    
    CGRect shadowRect = CGRectMake(0, kMeDataScoreTopHeight, self.width, 92);
    // 阴影路径，凹形
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, shadowRect.origin.y)];
    [path addLineToPoint:CGPointMake(0, shadowRect.origin.y + shadowRect.size.height)];
    [path addLineToPoint:CGPointMake(shadowRect.origin.x + shadowRect.size.width, shadowRect.origin.y + shadowRect.size.height)];
    [path addLineToPoint:CGPointMake(shadowRect.origin.x + shadowRect.size.width, shadowRect.origin.y)];
 
    self.contentView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    self.contentView.layer.cornerRadius = 8;
    self.contentView.layer.shadowColor = [UIColor colorWithRed:62/255.0 green:109/255.0 blue:227/255.0 alpha:0.33].CGColor;
    self.contentView.layer.shadowOffset = CGSizeMake(0,0);
    self.contentView.layer.shadowOpacity = 1;
    self.contentView.layer.shadowRadius = 8;

    self.contentView.layer.shadowPath = path.CGPath;
}

-(void)configUI {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
 
    [self addSubview:self.titleImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.scoreButton];
    
    [self addSubview:self.totalLabel];
    [self addSubview:self.scoreLabel];
}

#pragma mark set
-(void)setScore:(NSString *)score {
    _score = score;
    _scoreLabel.text = score ? score : @"";
}
#pragma mark lazy

-(UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
-(UIImageView *)titleImageView {
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc]init];
        _titleImageView.image = [UIImage imageNamed:@"me_data_score_image"];
    }
    return _titleImageView;
}
-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size: 15];
        _titleLabel.text = @"数据资产";
    }
    return _titleLabel;
}

-(UIButton *)scoreButton {
    if (!_scoreButton) {
        _scoreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_scoreButton setTitle:@"账户安全保障中" forState:UIControlStateNormal];
        [_scoreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_scoreButton setBackgroundImage:[UIImage imageNamed:@"me_data_score_back"] forState:UIControlStateNormal];
        [_scoreButton setImage:[UIImage imageNamed:@"me_data_score_safe"] forState:UIControlStateNormal];
        _scoreButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 10];
    }
    return _scoreButton;
}
-(UILabel *)totalLabel {
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.textColor = [UIColor blackColor];
        _totalLabel.textAlignment = NSTextAlignmentCenter;
        _totalLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 14];
        _totalLabel.text = @"可兑资产（贝）";
    }
    return _totalLabel;
}
-(UILabel *)scoreLabel {
    if (!_scoreLabel) {
        _scoreLabel = [[UILabel alloc]init];
        _scoreLabel.textColor = [UIColor blackColor];
        _scoreLabel.textAlignment = NSTextAlignmentCenter;
        _scoreLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size: 38];
        _scoreLabel.text = @"123123";
    }
    return _scoreLabel;
}
@end
