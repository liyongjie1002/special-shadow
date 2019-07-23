//
//  UIButton+Style.h
//  MHDHome
//
//  Created by 李永杰 on 2019/6/26.
//  Copyright © 2019 muheda. All rights reserved.
//
#import <Foundation/Foundation.h>
// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, MDButtonEdgeInsetsStyle) {
    MDButtonEdgeInsetsStyleTop, // image在上，label在下
    MDButtonEdgeInsetsStyleLeft, // image在左，label在右
    MDButtonEdgeInsetsStyleBottom, // image在下，label在上
    MDButtonEdgeInsetsStyleRight // image在右，label在左
};

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Style)

- (void)layoutButtonWithEdgeInsetsStyle:(MDButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
@end

NS_ASSUME_NONNULL_END
