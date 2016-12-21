//
//  NSString+CJExtension.m
//  HDJY
//
//  Created by ChiJinLian on 16/12/21.
//  Copyright © 2016年 HDJY. All rights reserved.
//

#import "NSString+CJExtension.h"

static inline CGFLOAT_TYPE CGFloat_ceil(CGFLOAT_TYPE cgfloat) {
#if CGFLOAT_IS_DOUBLE
    return ceil(cgfloat);
#else
    return ceilf(cgfloat);
#endif
}

@implementation NSString (CJExtension)
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font width:(CGFloat)width height:(CGFloat)height {
    
    CGSize size = CGSizeZero;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize strSize = [str boundingRectWithSize:CGSizeMake(width, height)
                                       options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                    attributes:attributes
                                       context:nil].size;
    size = CGSizeMake(CGFloat_ceil(strSize.width), CGFloat_ceil(strSize.height));
    return size;
}
@end
