//
//  NSString+CJExtension.h
//  HDJY
//
//  Created by ChiJinLian on 16/12/21.
//  Copyright © 2016年 HDJY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CJExtension)
/**
 *  计算str的size
 *
 *  @param str
 *  @param font
 *  @param width  指定宽度
 *  @param height 指定高度
 *
 *  @return
 */
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font width:(CGFloat)width height:(CGFloat)height;
@end
