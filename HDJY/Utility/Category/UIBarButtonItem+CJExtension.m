//
//  UIBarButtonItem+CJExtension.m
//  rebirthCJ
//
//  Created by YiChe on 16/4/28.
//  Copyright © 2016年 YiChe. All rights reserved.
//

#import "UIBarButtonItem+CJExtension.h"

@implementation UIBarButtonItem (CJExtension)

+ (instancetype)itemWithImage:(NSString *)imageName hightLightedImage:(NSString *)highLightedImageName target:(id)target selector:(SEL)selector {
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:imageName renderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highLightedImageName renderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    
    // 设置按钮的尺寸为背景图片尺寸
    CGRect frame = button.frame;
    frame.size = button.currentBackgroundImage.size;
    button.frame = frame;
    
    // 监听按钮点击
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
