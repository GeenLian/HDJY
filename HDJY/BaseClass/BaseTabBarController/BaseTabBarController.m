//
//  BaseTabBarController.m
//  rebirthCJ
//
//  Created by YiChe on 16/4/26.
//  Copyright © 2016年 YiChe. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showRedPointIndex:(NSInteger)index value:(NSString *)value {
    if (index >= self.tabBar.items.count) {
        return;
    }
    
    UILabel *redLabel = [self.tabBar viewWithTag:100 + index];
    if (!redLabel || redLabel == nil) {
        redLabel = [[UILabel alloc]init];
        redLabel.tag = 100 + index;
    }
    redLabel.backgroundColor = [UIColor colorWithRed:0.8481 green:0.2105 blue:0.2378 alpha:0.9];
    redLabel.text = value;
    redLabel.adjustsFontSizeToFitWidth = YES;
    redLabel.minimumScaleFactor = 0.01;
    redLabel.textColor = [UIColor whiteColor];
    //确定小红点的位置
    CGFloat itemWidth = ScreenWidth/self.tabBar.items.count;
    float percentX = itemWidth * index  + itemWidth/2.0 + 7 + 5 ;
    CGFloat y = 6;
    redLabel.frame = CGRectMake(percentX, y, 8, 8);//圆形大小为8
    redLabel.layer.masksToBounds = YES;
    redLabel.layer.cornerRadius = 4;
    [self.tabBar addSubview:redLabel];
    [self.tabBar bringSubviewToFront:redLabel];
}

- (void)hideRedPointIndex:(NSInteger)index {
    UILabel *redLabel = [self.tabBar viewWithTag:100 + index];
    [redLabel removeFromSuperview];
    redLabel = nil;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    UINavigationController *rootController  =  (UINavigationController *)[self selectedViewController];
//    UIViewController *topViewController     =  rootController.topViewController;
//    if ([topViewController isKindOfClass:[NSClassFromString(@"AgreeMentMainViewController") class]]) {
//        return UIInterfaceOrientationMaskAllButUpsideDown;
//    }
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
//    UINavigationController *rootController  =   (UINavigationController *)[self selectedViewController];
//    UIViewController *topViewController     =   rootController.topViewController;
//    //判断是否横屏
//    if ([topViewController isKindOfClass:[NSClassFromString(@"AgreeMentMainViewController") class]]) {
//        return YES;
//    }
    return NO;
}

@end
