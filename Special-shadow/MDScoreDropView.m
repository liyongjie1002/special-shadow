//
//  MDScoreDropView.m
//  Special-shadow
//
//  Created by 李永杰 on 2019/9/16.
//  Copyright © 2019 muheda. All rights reserved.
//

#define kMDScoreDropViewLeftMargin              15
#define kMDScoreDropViewAddLabelTopMargin       16
#define kMDScoresDropViewAddButtonsTopMargin    10
#define kMDScoreDropViewDownLabelTopMargin      20
#define kMDScoreDropViewLabelHeight             20
#define kMDScoresDropViewDownButtonsTopMargin   10
#define kMDScoresDropViewButtonHeight           33
#define kMDScoresDropViewButtonWidth            105
#define kMDScoresDropViewBottomButtonHeight     50
#define kMDScoresDropViewBottomButtonTop        35

#define kMDScoresDropViewAddButtonTag           141
#define kMDScoresDropViewDownButtonTag          241

#define kMDScoresDropViewRowMaxCount            3

#import "MDScoreDropView.h"

@interface MDScoreDropView ()

@property (nonatomic, strong) UIView    *contentView;

@property (nonatomic, strong) UIView    *lineView;

@property (nonatomic, strong) UILabel   *upLabel;

@property (nonatomic, strong) UILabel   *downLabel;

@property (nonatomic, strong) UIView    *backgroundView;

@property (nonatomic, strong) NSMutableArray    *upButtons;

@property (nonatomic, strong) NSMutableArray    *downButtons;

@property (nonatomic, strong) NSMutableArray    *upTitles;

@property (nonatomic, strong) NSMutableArray    *downTitles;

@property (nonatomic, strong) UIButton          *resetButton;

@property (nonatomic, strong) UIButton          *sureButton;

@end

@implementation MDScoreDropView

- (instancetype)initWithFrame:(CGRect)frame adds:(NSMutableArray *)upTitles downs:(NSMutableArray *)downsTitles {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
        _upTitles = upTitles;
        _downTitles = downsTitles;
        _upButtons = [NSMutableArray array];
        _downButtons = [NSMutableArray array];
    }
    return self;
}

-(void)configUI {
    [self addSubview:self.backgroundView];
    
    NSInteger upRows = (self.upTitles.count % kMDScoresDropViewRowMaxCount) == 0 ? self.upTitles.count / kMDScoresDropViewRowMaxCount : self.upTitles.count / self.upTitles.count + 1;
    NSInteger downRows = (self.downTitles.count % kMDScoresDropViewRowMaxCount) == 0 ? self.downTitles.count / kMDScoresDropViewRowMaxCount : self.downTitles.count / self.downTitles.count + 1;
    CGFloat contentHeight = 1 + kMDScoreDropViewAddLabelTopMargin + kMDScoreDropViewLabelHeight
                            + (kMDScoresDropViewAddButtonsTopMargin + kMDScoresDropViewButtonHeight)*upRows
                            + kMDScoreDropViewDownLabelTopMargin + kMDScoreDropViewLabelHeight
                            + (kMDScoresDropViewDownButtonsTopMargin + kMDScoresDropViewButtonHeight) *downRows
                            + kMDScoresDropViewBottomButtonTop + kMDScoresDropViewBottomButtonHeight;
    
    [self addSubview:self.contentView];
    self.contentView.frame = CGRectMake(0, 0, self.frame.size.width, contentHeight);
    
    [self.contentView addSubview:self.lineView];
    
    [self.contentView addSubview:self.upLabel];
    
    for (int index = 0; index < self.upTitles.count; index++) {
        
        int row = (index % self.upTitles.count) == 0 ? index / self.upTitles.count : index / self.upTitles.count + 1;
        int col = index % self.upTitles.count;
        
        CGFloat cellX = kMDScoreDropViewLeftMargin + col * (kMDScoresDropViewButtonWidth + kMDScoreDropViewLeftMargin);
        CGFloat cellY = kMDScoreDropViewLeftMargin+row * (kMDScoresDropViewButtonHeight + kMDScoresDropViewAddButtonsTopMargin);
        
        NSString *title = self.upTitles[index];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:234/255.0 green:111/255.0 blue:61/255.0 alpha:1] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 17;
        btn.layer.masksToBounds = YES;
        btn.layer.borderColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.1 alpha:1].CGColor;
        [btn setFrame:CGRectMake(cellX,cellY,kMDScoresDropViewButtonWidth,kMDScoresDropViewButtonHeight)];
        [btn addTarget:self action:@selector(clickAddAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = kMDScoresDropViewAddButtonTag + index;
        [self.contentView addSubview:btn];
        [self.upButtons addObject:btn];
    }
    
    [self.contentView addSubview:self.downLabel];
    for (int index = 0; index < self.downTitles.count; index++) {
        int row = (index % self.downTitles.count) == 0 ? index / self.downTitles.count : index / self.downTitles.count + 1;
        int col = index % self.downTitles.count;
        
        CGFloat cellX = kMDScoreDropViewLeftMargin + col * (kMDScoresDropViewButtonWidth + kMDScoreDropViewLeftMargin);
        CGFloat cellY = kMDScoreDropViewLeftMargin+row * (kMDScoresDropViewButtonHeight + kMDScoresDropViewAddButtonsTopMargin);
        
        NSString *title = self.downTitles[index];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:1] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:234/255.0 green:111/255.0 blue:61/255.0 alpha:1] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 17;
        btn.layer.masksToBounds = YES;
        btn.layer.borderColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.1 alpha:1].CGColor;
        [btn setFrame:CGRectMake(cellX,cellY,kMDScoresDropViewButtonWidth,kMDScoresDropViewButtonHeight)];
        [btn addTarget:self action:@selector(clickAddAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = kMDScoresDropViewAddButtonTag + index;
        [self.contentView addSubview:btn];
        [self.upButtons addObject:btn];
    }
    
    [self.contentView addSubview:self.resetButton];
    [self.contentView addSubview:self.sureButton];
}


-(void)clickAddAction:(UIButton *)sender {
    
}

-(void)clickDownAction:(UIButton *)sender {
    
}

#pragma mark lazy
-(UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc]initWithFrame:self.bounds];
        _backgroundView.alpha = 0.6;
    }
    return _backgroundView;
}

-(UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

-(UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(kMDScoreDropViewLeftMargin, 0, self.frame.size.width - 2*kMDScoreDropViewLeftMargin, 1)];
        _lineView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    }
    return _lineView;
}

-(UILabel *)upLabel {
    if (!_upLabel) {
        _upLabel = [[UILabel alloc]initWithFrame:CGRectMake(kMDScoreDropViewLeftMargin, kMDScoreDropViewAddLabelTopMargin, 30, 20)];
        _upLabel.font = [UIFont fontWithName:@"PingFang-SC" size:14];
        _upLabel.text = @"增加";
        _upLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    }
    return _upLabel;
}

-(UILabel *)downLabel {
    if (!_downLabel) {
        _downLabel = [[UILabel alloc]init];
        _downLabel.font = [UIFont fontWithName:@"PingFang-SC" size:14];
        _downLabel.text = @"消耗";
        _downLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    }
    return _downLabel;
}

-(UIButton *)resetButton {
    if (!_resetButton) {
        _resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _resetButton.frame = CGRectMake(0, self.contentView.frame.size.height - kMDScoresDropViewBottomButtonHeight, self.contentView.frame.size.width / 2.0, kMDScoresDropViewBottomButtonHeight);
        _resetButton.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        [_resetButton setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]
                           forState:UIControlStateNormal];
        _resetButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size: 16];
        [_resetButton setTitle:@"重置" forState:UIControlStateNormal];
    }
    return _resetButton;
}

-(UIButton *)sureButton {
    if (!_sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureButton.frame = CGRectMake(self.contentView.frame.size.width / 2.0, self.contentView.frame.size.height - kMDScoresDropViewBottomButtonHeight, self.contentView.frame.size.width / 2.0, kMDScoresDropViewBottomButtonHeight);
        _sureButton.backgroundColor = [UIColor colorWithRed:234/255.0 green:111/255.0 blue:61/255.0 alpha:1];
        [_sureButton setTitleColor:[UIColor whiteColor]
                           forState:UIControlStateNormal];
        _sureButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size: 16];
        [_sureButton setTitle:@"确认" forState:UIControlStateNormal];
    }
    return _sureButton;
}
@end
