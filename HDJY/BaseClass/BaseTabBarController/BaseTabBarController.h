//
//  BaseTabBarController.h
//  rebirthCJ
//
//  Created by YiChe on 16/4/26.
//  Copyright © 2016年 YiChe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarController : UITabBarController

- (void)showRedPointIndex:(NSInteger)index value:(NSString *)value;
- (void)hideRedPointIndex:(NSInteger)index;
@end
