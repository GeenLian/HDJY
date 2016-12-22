//
//  BaseViewController+NetWorkUIExtension.h
//  HDJY
//
//  Created by ChiJinLian on 16/12/21.
//  Copyright © 2016年 HDJY. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController (NetWorkUIExtension)
/**
 *  显示加载中
 */
- (void)showLoading;
/**
 *  在指定view显示loading视图
 *
 *  @param view
 */
- (void)showLoadingToView:(UIView *)view;
/**
 *  停止加载动画
 */
- (void)hideLoading;


/**
 *  显示errorView
 *
 *  @param delegate 回调所有者
 *  @param handler  回调事件
 */
- (void)showNetWorkErrorDelegate:(id)delegate handler:(SEL)handler;
/**
 *  在指定view上显示errorView
 *
 *  @param view     承载errorView 的view
 *  @param delegate 回调所有者
 *  @param handler  回调事件
 */
- (void)showNetWorkErrorToView:(UIView *)view delegate:(id)delegate handler:(SEL)handler;
/**
 *  隐藏errorView
 */
- (void)hideNetWorkError;
/**
 *  隐藏view上的errorView
 *
 *  @param view
 */
- (void)hideNetWorkErrorFromView:(UIView *)view;


/**
 *  显示无数据view，默认提示文案 “无数据”
 */
- (void)showNoDataView;
/**
 *  显示无数据view，自定义提示文案
 *
 *  @param tips 提示文案
 */
- (void)showNoDataViewWithTips:(NSString *)tips;
/**
 *  在指定view显示无数据view，自定义提示文案
 *
 *  @param view
 *  @param tips
 */
- (void)showNoDataToView:(UIView *)view withTips:(NSString *)tips;
/**
 *  隐藏无数据view
 */
- (void)hideNoDataViewWithTips;
/**
 *  隐藏view上的无数据view
 *
 *  @param view
 */
- (void)hideNoDataViewWithTipsFromView:(UIView *)view;
@end
