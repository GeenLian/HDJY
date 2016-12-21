//
//  UIImage+CJExtension.h
//  rebirthCJ
//
//  Created by YiChe on 16/4/28.
//  Copyright © 2016年 YiChe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CJExtension)

/**
 *  生成纯色图片
 *
 *  @param color
 *  @param width
 *  @param height
 *
 *  @return 
 */
+ (UIImage *)createImageWithColor:(UIColor *)color width:(CGFloat)width height:(CGFloat)height;

/**
 *  根据输入颜色，返回一个纯色UIImage
 *
 *  @param color
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  根据name以及renderingMode生产图片
 *
 *  @param name
 *  @param renderingMode :
 UIImageRenderingModeAutomatic        // 根据图片的使用环境和所处的绘图上下文自动调整渲染模式(默认属性)。
 UIImageRenderingModeAlwaysOriginal   // 始终绘制图片原始状态，设置Tint Color属性无效。
 UIImageRenderingModeAlwaysTemplate   // 始终根据Tint Color绘制图片（颜色）显示，忽略图片的颜色信息（也就是图片原本的东西是不显示的）。
 *
 *  @return
 */
+ (UIImage *)imageNamed:(NSString *)name renderingMode:(UIImageRenderingMode)renderingMode;
@end
