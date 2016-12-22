//
//  UIImageView+SDImageActivityIndicator.h
//  Ework
//
//  Created by ChiJinLian on 16/10/28.
//  Copyright © 2016年 crm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SDImageActivityIndicator)

/**
 *  加载图片是否显示菊花
 *
 *  @param url
 *  @param placeholder
 *  @param showActivityIndicator
 */
- (void)sd_setImageWithURL:(NSURL *)url
          placeholderImage:(UIImage *)placeholder
     showActivityIndicator:(BOOL)showActivityIndicator;

/**
 *  加载图片是否显示菊花，可选菊花样式
 *
 *  @param url
 *  @param placeholder
 *  @param showActivityIndicator
 *  @param style
 */
- (void)sd_setImageWithURL:(NSURL *)url
          placeholderImage:(UIImage *)placeholder
     showActivityIndicator:(BOOL)showActivityIndicator
    ActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;
@end
