//
//  UIScrollView+CJRefresh.m
//  test
//
//  Created by ChiJinLian on 16/8/4.
//  Copyright © 2016年 YiChe. All rights reserved.
//

#import "UIScrollView+CJRefresh.h"
#import <objc/runtime.h>

@implementation UIScrollView (CJRefresh)

- (void)addHeaderWithTarget:(id)target action:(SEL)action {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在刷新中..." forState:MJRefreshStateRefreshing];
    header.stateLabel.textColor = [UIColor lightGrayColor];
    header.lastUpdatedTimeLabel.textColor = [UIColor lightGrayColor];
    self.mj_header = header;
}

- (void)addFooterWithTarget:(id)target action:(SEL)action {
    CJMJRefreshBackNormalFooter *footer = [CJMJRefreshBackNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    [footer setTitle:@"上拉加载更多数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"松开加载更多数据" forState:MJRefreshStatePulling];
    [footer setTitle:@"正在加载中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"松开加载更多数据" forState:MJRefreshStateWillRefresh];
    [footer setTitle:@"已经加载全部数据" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.textColor = [UIColor lightGrayColor];
    self.mj_footer = footer;
}

/**
 *  移除下拉刷新头部控件
 */
- (void)removeHeader {
    [self.mj_header removeFromSuperview];
}

/**
 *  移除上拉刷新尾部控件
 */
- (void)removeFooter {
    [self.mj_footer removeFromSuperview];
}
@end


@implementation CJMJRefreshBackNormalFooter

+ (void)initialize {
    if ([NSStringFromClass([self class]) isEqualToString:@"CJMJRefreshBackNormalFooter"]) {
        Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"resetNoMoreData"));
        Method method2 = class_getInstanceMethod([self class], NSSelectorFromString(@"CJResetNoMoreData"));
        method_exchangeImplementations(method1, method2);
    }
    
}

/**
 *  =_= 坑爹！！！有坑
 *  更改state状态后，会自动修改stateLabel的标题，
 *  这种修改UI的行为应该是在 main_queue 线程执行才会有效果的啊
 */
- (void)CJResetNoMoreData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self CJResetNoMoreData];
    });
}

@end
