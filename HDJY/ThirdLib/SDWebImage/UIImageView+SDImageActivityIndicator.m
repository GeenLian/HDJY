//
//  UIImageView+SDImageActivityIndicator.m
//  Ework
//
//  Created by ChiJinLian on 16/10/28.
//  Copyright © 2016年 crm. All rights reserved.
//

#import "UIImageView+SDImageActivityIndicator.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (SDImageActivityIndicator)
- (void)sd_setImageWithURL:(NSURL *)url
          placeholderImage:(UIImage *)placeholder
     showActivityIndicator:(BOOL)showActivityIndicator
{
    [self sd_setImageWithURL:url placeholderImage:placeholder showActivityIndicator:showActivityIndicator ActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

- (void)sd_setImageWithURL:(NSURL *)url
          placeholderImage:(UIImage *)placeholder
     showActivityIndicator:(BOOL)showActivityIndicator
    ActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
{
    __block UIActivityIndicatorView *activityIndicator;
    __weak typeof(self)wSelf = self;
    [self sd_setImageWithURL:url placeholderImage:placeholder options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (showActivityIndicator && !activityIndicator)
        {
            [wSelf addSubview:activityIndicator = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:style]];
            activityIndicator.center = CGPointMake(CGRectGetWidth(wSelf.bounds)/2.0, CGRectGetHeight(wSelf.bounds)/2.0);            [activityIndicator startAnimating];
        }
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (showActivityIndicator) {
            [activityIndicator removeFromSuperview];
            activityIndicator = nil;
        }
    }];
}
@end
