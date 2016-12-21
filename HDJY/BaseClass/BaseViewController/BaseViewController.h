//
//  ViewController.h
//  HDJY
//
//  Created by ChiJinLian on 16/12/20.
//  Copyright © 2016年 HDJY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
/**
 *  初始化时的传值字典
 */
@property (nonatomic, strong) NSDictionary *ext;
/**
 * 是否支持右滑返回，默认YES
 */
@property (nonatomic, assign) BOOL popGestureEnable;


/**
 *  初始化方法
 *
 *  @param uri 对应的xib名称，不存在则传nil
 *  @param ext 需要传递的参数
 *
 *  @return
 */
- (instancetype)initWithUri:(NSString *)uri ext:(NSDictionary *)ext;

/**
 *  返回上层页面
 */
- (void)backPopViewcontroller;

/**
 *  返回根视图
 */
- (void)backRootViewController;
@end

