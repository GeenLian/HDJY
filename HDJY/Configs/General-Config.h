//
//  General-Config.h
//  rebirthCJ
//
//  Created by YiChe on 16/4/28.
//  Copyright © 2016年 YiChe. All rights reserved.
//

#ifndef General_Config_h
#define General_Config_h

#if defined(DEBUG)||defined(_DEBUG)
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif


#define iOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define ScreenHeight ([[UIScreen mainScreen] bounds].size.height)

#pragma mark - fame相关的宏
//自适应拉伸options
#define ViewAutoresizingFlexibleAll UIViewAutoresizingFlexibleLeftMargin|\
                                    UIViewAutoresizingFlexibleWidth|\
                                    UIViewAutoresizingFlexibleRightMargin|\
                                    UIViewAutoresizingFlexibleTopMargin|\
                                    UIViewAutoresizingFlexibleHeight|\
                                    UIViewAutoresizingFlexibleBottomMargin

#pragma mark - 颜色相关的宏
/*
 根据RGB创建颜色
 */
#define UIRGBColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                                 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                                  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define appBackViewColor  [UIColor colorWithRed:0.8686 green:0.9768 blue:0.9865 alpha:1.0]//主视图背景色
#define TabBarItemNormalColor [UIColor colorWithRed:0.2235 green:0.2235 blue:0.2275 alpha:1.0]
#define TabBarItemSelectColor [UIColor colorWithRed:0.1176 green:0.749 blue:0.6745 alpha:1.0]

//static inline内联函数，这相当于把函数体当做一个大号的宏定义.不过这也不是百分之百有效,到底能不能把函数体转换为大号宏定义来用要看编译器心情,它要是觉得你的方法太复杂,他就不转了.他直接调用函数.
/**
 *  位置移动动画
 *  示例：CGPoint fromPoint = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT);
         CGPoint toPoint   = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
         CABasicAnimation *animation = GetPositionAnimation([NSValue valueWithCGPoint:fromPoint], [NSValue valueWithCGPoint:toPoint], 0.2, @"position");
         [self.view.layer addAnimation:animation forKey:nil];
 *
 *  @param fromValue 开始位置
 *  @param toValue   结束为止
 *  @param duration  持续时间
 *  @param keyPath   动画key
 *
 *  @return
 */
static inline CABasicAnimation * GetPositionAnimation (id fromValue, id toValue, CFTimeInterval duration, NSString *keyPath) {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.fromValue = fromValue;
    animation.toValue   = toValue;
    animation.duration = duration;
    animation.repeatCount = 0;
    animation.autoreverses = NO;
    //以下两个设置，保证了动画结束后，layer不会回到初始位置（保持在动画结束时的状态）
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}


/**
 *  生成一组持续动画(这里实现了按钮的抖动效果)
 *  示例：[self.view.layer addAnimation:GetBtnStatusChangedAnimation() forKey:nil];
 *
 *  @return
 */
static inline CAKeyframeAnimation * GetBtnStatusChangedAnimation() {
    CAKeyframeAnimation *animate = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animate.duration = 0.3;
    animate.removedOnCompletion = YES;
    animate.fillMode = kCAFillModeForwards;
    
    animate.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.7, 0.7, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    return animate;
}

#endif /* General_Config_h */
