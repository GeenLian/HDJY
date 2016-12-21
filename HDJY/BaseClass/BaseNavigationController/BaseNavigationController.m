//
//  BaseNavigationController.m
//  rebirthCJ
//
//  Created by YiChe on 16/4/26.
//  Copyright © 2016年 YiChe. All rights reserved.
//

#import "BaseNavigationController.h"
#import "BaseViewController.h"
#import "SchoolViewController.h"
#import "InformationViewController.h"
#import "MessageViewController.h"
#import "MyCenterViewController.h"

@interface BaseNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak BaseNavigationController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - rotation
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    if ([self.topViewController isKindOfClass:[NSClassFromString(@"AgreeMentMainViewController") class]]) {
//        return UIInterfaceOrientationMaskAllButUpsideDown;
//    }
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
//    //判断是否横屏
//    if ([self.topViewController isKindOfClass:[NSClassFromString(@"AgreeMentMainViewController") class]]) {
//        return YES;
//    }
    return NO;
}

//重写push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 如果不是根控制器，隐藏TabBar
    if (self.viewControllers.count > 0) {
        // 注意这里是push进来的ViewContoller隐藏TabBar
        viewController.hidesBottomBarWhenPushed = YES;
        if ([viewController isKindOfClass:[BaseViewController class]]) {
            BaseViewController *baseCtr = (BaseViewController *)viewController;
            if ([baseCtr respondsToSelector:@selector(backPopViewcontroller)]) {
                [baseCtr backPopViewcontroller];
            }
        }
    }
    //处理左滑手势
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    // Enable the gesture again once the new controller is shown
    if ([viewController isKindOfClass:[BaseViewController class]]) {
        BaseViewController *baseCtr = (BaseViewController *)viewController;
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && baseCtr.popGestureEnable == YES){
            self.interactivePopGestureRecognizer.enabled = YES;
        }else{
            self.interactivePopGestureRecognizer.enabled = NO;
        }
    }else{
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
            self.interactivePopGestureRecognizer.enabled = YES;
        }
    }
    //tab上面的四个vc禁用右滑返回
    if ([viewController isMemberOfClass:[SchoolViewController class]] || [viewController isMemberOfClass:[InformationViewController class]] || [viewController isMemberOfClass:[MessageViewController class]] || [viewController isMemberOfClass:[MyCenterViewController class]]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
}
@end
