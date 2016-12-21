//
//  UIView+CJExtension.h
//  221
//
//  Created by C.K.Lian on 16/3/23.
//  Copyright © 2016年 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CJExtension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

/**
*  设置圆角
*
*  @param corners     设置哪个角(可多选)
*  @param cornerRadii 圆角大小
*/
- (void)setCorner:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

/**
 *  设置四个圆角
 *
 *  @param cornerRadius 圆角大小
 */
- (void)setAllCornerRadius:(CGFloat)cornerRadius;

/**
 *  取消圆角
 */
- (void)setNoneCorner;
@end
