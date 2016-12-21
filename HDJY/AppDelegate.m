//
//  AppDelegate.m
//  HDJY
//
//  Created by ChiJinLian on 16/12/20.
//  Copyright © 2016年 HDJY. All rights reserved.
//

#import "AppDelegate.h"
#import "CJDeviceVersion.h"
#import "BaseNavigationController.h"
#import "SchoolViewController.h"
#import "InformationViewController.h"
#import "MessageViewController.h"
#import "MyCenterViewController.h"


@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self setTabNavTintColor];
    __weak typeof(self)wSelf = self;
    [self setLaunchViewViewAnimation:^(BOOL finish){
        [wSelf setRootViewController];
    }];
    UIViewController *ctr = [[UIViewController alloc]init];
    self.window.rootViewController = ctr;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)setTabNavTintColor {
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    //去除顶部横线
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]]];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    
    //UINavigationBar 的设置
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                              [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0], NSForegroundColorAttributeName,
                              shadow, NSShadowAttributeName,
                              [UIFont boldSystemFontOfSize:17], NSFontAttributeName, nil]];
    
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x0288d1)];
    
    //设置navigationBar背景颜色，并去除底部分割线
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:0.0594 green:0.3236 blue:0.6013 alpha:1.0]];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [UINavigationBar appearance].shadowImage = [[UIImage alloc] init];
}

- (void)setRootViewController {
    
    SchoolViewController *schoolCtr = [[SchoolViewController alloc]initWithUri:@"SchoolViewController" ext:nil];
    schoolCtr.hidesBottomBarWhenPushed = NO;
    schoolCtr.popGestureEnable = NO;
    BaseNavigationController *schoolNavController = [[BaseNavigationController alloc] initWithRootViewController:schoolCtr];
    UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:@"学校" imageStr:@"nav_icon_bar_index_nor" selectedImageStr:@"nav_icon_bar_index_pre" titleNormalColor:TabBarItemNormalColor titleSelectColor:TabBarItemSelectColor];
    schoolNavController.tabBarItem = item1;
    
    InformationViewController *informationCtr = [[InformationViewController alloc] initWithNibName:@"InformationViewController" bundle:nil];
    informationCtr.hidesBottomBarWhenPushed = NO;
    informationCtr.popGestureEnable = NO;
    BaseNavigationController *informationNavController = [[BaseNavigationController alloc] initWithRootViewController:informationCtr];
    UITabBarItem *item2 = [[UITabBarItem alloc]initWithTitle:@"资讯" imageStr:@"nav_icon_bar_message_nor" selectedImageStr:@"nav_icon_bar_message_pre" titleNormalColor:TabBarItemNormalColor titleSelectColor:TabBarItemSelectColor];
    informationNavController.tabBarItem = item2;
    
    MessageViewController *messageCtr = [[MessageViewController alloc]initWithNibName:@"MessageViewController" bundle:nil];
    messageCtr.hidesBottomBarWhenPushed = NO;
    messageCtr.popGestureEnable = NO;
    BaseNavigationController *messageNavController = [[BaseNavigationController alloc] initWithRootViewController:messageCtr];
    UITabBarItem *item3 = [[UITabBarItem alloc]initWithTitle:@"消息" imageStr:@"nav_icon_bar_contact_nor" selectedImageStr:@"nav_icon_bar_contact_pre" titleNormalColor:TabBarItemNormalColor titleSelectColor:TabBarItemSelectColor];
    messageNavController.tabBarItem = item3;
    
    MyCenterViewController *userCtr = [[MyCenterViewController alloc]initWithNibName:@"MyCenterViewController" bundle:nil];
    userCtr.hidesBottomBarWhenPushed = NO;
    userCtr.popGestureEnable = NO;
    BaseNavigationController *userNavController = [[BaseNavigationController alloc] initWithRootViewController:userCtr];
    UITabBarItem *item4 = [[UITabBarItem alloc]initWithTitle:@"我的" imageStr:@"nav_icon_bar_mine_nor" selectedImageStr:@"nav_icon_bar_mine_pre" titleNormalColor:TabBarItemNormalColor titleSelectColor:TabBarItemSelectColor];
    userNavController.tabBarItem = item4;
    
    self.mainTabBarController = [[BaseTabBarController alloc] init];
    self.mainTabBarController.delegate = self;
    self.mainTabBarController.viewControllers = [NSArray arrayWithObjects:
                                                 schoolNavController,
                                                 informationNavController,
                                                 messageNavController,
                                                 userNavController,
                                                 nil];
    //顶部灰色细线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
    lineView.backgroundColor = [UIColor colorWithRed:0.7804 green:0.7961 blue:0.8039 alpha:0.6];
    [self.mainTabBarController.tabBar addSubview:lineView];
    [self.mainTabBarController.tabBar bringSubviewToFront:lineView];
    self.window.rootViewController = self.mainTabBarController;
    
}

- (void)setLaunchViewViewAnimation:(void (^)(BOOL finish))finish {
    UIView *launchView = [[NSBundle mainBundle ]loadNibNamed:@"LaunchScreen" owner:nil options:nil][0];
    launchView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    launchView.autoresizingMask = UIViewAutoresizingNone;
    
    UIImageView *backImageView = [launchView viewWithTag:100];
    DeviceSize deviceSize = [CJDeviceVersion deviceSize];
    NSString *imageName = ({
        NSString *imageName;
        /* 这里的命名前缀LaunchImage跟Images.xcassets里面的LaunchImage文件夹名字相同
         * 命名后半部分－700-568是不变的
         */
        if (deviceSize == iPhone35inch) {
            imageName = @"LaunchImage.png";
        } else if (deviceSize == iPhone4inch) {
            imageName = @"LaunchImage-700-568h.png";
        } else if (deviceSize == iPhone47inch) {
            imageName = @"LaunchImage-800-667h@2x.png";
        } else if (deviceSize == iPhone55inch) {
            imageName = @"LaunchImage-800-Portrait-736h@3x.png";
        }
        imageName;
    });
    UIImage *backImg = [UIImage imageNamed:imageName];
    backImageView.backgroundColor = [UIColor redColor];
    backImageView.image = backImg;
    [self.window addSubview:launchView];
    
    
    [UIView animateWithDuration:0.6f delay:1.0f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        launchView.alpha = 0.0f;
//        launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5f, 1.5f, 1.0f);
    } completion:^(BOOL finished) {
        [launchView removeFromSuperview];
        if (finish) {
            finish(YES);
        }
    }];
    
    
}
@end
