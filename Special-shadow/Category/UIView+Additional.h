//
//  UIView+Additional.h
//  Pods
//
//  Created by 李永杰 on 2018/8/1.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    UIViewDashLineDirectionHorizontal = 0,
    UIViewDashLineDirectionVertical
} UIViewDashLineDirection;


@interface UIView (Additional)

#pragma mark - UIView

//创建一个带文字的view
- (UIView *)addTxtColor:(UIColor *)textColor backgroundColor:(UIColor *)backColor labelText:(NSString *)text textAlignment:(NSTextAlignment )alignment;
//垂直方向添加一条线
- (UIView*)addLineWithY:(CGFloat)originY color:(UIColor *)color height:(CGFloat)height width:(CGFloat)width;
//设置虚线
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

/**
 画虚线
 
 @param lineLength 虚线小段长度
 @param lineSpacing 虚线间隔长度
 @param lineColor 虚线颜色
 @param direction 垂直或水平方向
 */
- (void)drawDashlineWithLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor direction:(UIViewDashLineDirection )direction;


/**
 设置圆角

 @param rect 圆角位置。UIRectCornerTopLeft
 @param radius 圆角大小

 [view makeCornerWithrect:(UIRectCornerTopLeft | UIRectCornerTopRight) radius:8];
 */
-(void)makeCornerWithrect:(UIRectCorner )rect radius:(CGFloat )radius;

//设置圆角
+(void)setViewCorner:(UIView *)view cornerRadius:(CGFloat)cornerRadius;


/**
 设置阴影
 
 @param color 阴影颜色
 @param opacity 透明度
 @param shadowRadius 阴影圆角
 @param radius 圆角
 */
-(void)shadowWithColor:(UIColor *)color opacity:(float)opacity shadowRadius:(CGFloat)shadowRadius radius:(CGFloat)radius;

/**
 设置边框

 @param top YES or NO
 @param left YES or NO
 @param bottom YES or NO
 @param right YES or NO
 @param color 边框颜色
 @param width 边框宽度
 */
- (void)setBorderWithtop:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width;
#pragma mark - UILabel

//设置label行间距
+(void)setRowSpace:(UILabel *)label lineSpacing:(CGFloat)lineSpacing;
//创建label
+ (UILabel *)labelWithFrame:(CGRect)frame withTexte:(NSString *)text titleFontSize:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor alignment:(NSTextAlignment)textAlignment;


#pragma mark - UIButton

//设置button属性
+ (void)setButton:(UIButton *)button AddTxtColor:(UIColor *)textColor backgroundColor:(UIColor *)backColor labelText:(NSString *)text textAlignment:(NSTextAlignment )alignment labelFont:(UIFont *) font;

@end
