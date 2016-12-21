//
//  BaseViewController+NetWorkUIExtension.m
//  HDJY
//
//  Created by ChiJinLian on 16/12/21.
//  Copyright © 2016年 HDJY. All rights reserved.
//

#import "BaseViewController+NetWorkUIExtension.h"

#import "BaseTipsView.h"

@implementation BaseViewController (NetWorkUIExtension)
#pragma mark - Loading
- (void)showLoading {
    
}

- (void)showLoadingToView:(UIView *)view {
    
}

- (void)hideLoading {
    
}


#pragma mark - NetWorkError
- (void)showNetWorkErrorDelegate:(id)delegate handler:(SEL)handler {
    [self showNetWorkErrorToView:self.view delegate:delegate handler:handler];
}

- (void)showNetWorkErrorToView:(UIView *)view delegate:(id)delegate handler:(SEL)handler {
    UIView *tipsBackView = [view viewWithTag:[@"netWorkError" hash]];
    if (!tipsBackView || tipsBackView == nil) {
        tipsBackView = [[UIView alloc]initWithFrame:view.bounds];
        tipsBackView.autoresizingMask = ViewAutoresizingFlexibleAll;
        tipsBackView.backgroundColor = UIColorFromRGB(0xefeef3);
        tipsBackView.tag = [@"netWorkError" hash];
        BaseTipsView *tipsView = [BaseTipsView baseTipsViewType:NetErrorType delegate:delegate handler:handler];
        [self baseTipsViewFrame:tipsView SuperView:view];
        [tipsBackView addSubview:tipsView];
    }
    [view addSubview:tipsBackView];
}

- (void)hideNetWorkError {
    [self hideNetWorkErrorFromView:self.view];
}

- (void)hideNetWorkErrorFromView:(UIView *)view {
    UIView *tipsBackView = [view viewWithTag:[@"netWorkError" hash]];
    [tipsBackView removeFromSuperview];
    tipsBackView = nil;
}


#pragma mark - NoData
- (void)showNoDataView {
    [self showNoDataToView:self.view withTips:nil];
}

- (void)showNoDataViewWithTips:(NSString *)tips {
    [self showNoDataToView:self.view withTips:tips];
}

- (void)showNoDataToView:(UIView *)view withTips:(NSString *)tips {
    UIView *tipsBackView = [view viewWithTag:[@"NoData" hash]];
    if (!tipsBackView || tipsBackView == nil) {
        tipsBackView = [[UIView alloc]initWithFrame:view.bounds];
        tipsBackView.autoresizingMask = ViewAutoresizingFlexibleAll;
        tipsBackView.backgroundColor = UIColorFromRGB(0xefeef3);
        tipsBackView.tag = [@"netWorkError" hash];
        BaseTipsView *tipsView = [BaseTipsView baseTipsViewType:NotDataType delegate:nil handler:nil];
        [self baseTipsViewFrame:tipsView SuperView:view];
        if (tips) {
            tipsView.textLabel.text = tips;
        }
        [tipsBackView addSubview:tipsView];
    }
    [view addSubview:tipsBackView];
}

- (void)hideNoDataViewWithTips {
    [self hideNoDataViewWithTipsFromView:self.view];
}

- (void)hideNoDataViewWithTipsFromView:(UIView *)view {
    UIView *tipsBackView = [view viewWithTag:[@"NoData" hash]];
    [tipsBackView removeFromSuperview];
    tipsBackView = nil;
}

- (void)baseTipsViewFrame:(BaseTipsView *)tipsView SuperView:(UIView *)view {
    CGRect frame = tipsView.frame;
    frame.origin.x = 0;
    frame.size.height = [BaseTipsView baseTipsViewHeightWithSuperView:view baseTipsView:tipsView];
    frame.origin.y = (CGRectGetHeight(view.bounds)-frame.size.height)/2.0;
    frame.size.width = CGRectGetWidth(view.bounds);
    tipsView.autoresizingMask = ViewAutoresizingFlexibleAll;
    tipsView.frame = frame;
}
@end

