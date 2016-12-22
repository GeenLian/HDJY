//
//  ViewController.m
//  HDJY
//
//  Created by ChiJinLian on 16/12/20.
//  Copyright © 2016年 HDJY. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (instancetype)initWithUri:(NSString *)uri ext:(NSDictionary *)ext {
    if (uri && uri.length > 0) {
        self =  [super initWithNibName:NSStringFromClass(self.class) bundle:nil];
    }else{
        self = [super initWithNibName:nil bundle:nil];
    }
    if (self) {
        self.ext = ext;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = appBackViewColor;
    if (iOS_VERSION >= 7.0) {
        //不设置iOS7之后view将向四周延伸
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"this is %@", NSStringFromClass([self class]));
    
    //二级页面，开启iOS7系统之后的滑动返回效果
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //只有在二级页面之后生效
        if ([self.navigationController.viewControllers count] >= 2) {
            self.navigationController.interactivePopGestureRecognizer.delegate = self;
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //自定义返回按钮与左滑手势返回有冲突，在viewWillDisappear:与viewDidAppear:中进行处理
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)backPopViewcontroller {
    [self.navigationItem setLeftBarButtonItem:[self creatBackRootViewBarItem:NO]];
}

- (void)backRootViewController {
    [self.navigationItem setLeftBarButtonItem:[self creatBackRootViewBarItem:YES]];
}

- (UIBarButtonItem *)creatBackRootViewBarItem:(BOOL)backRootView {
    UIImage *selectedImage=[UIImage imageNamed: @"back-icon"];
    //设置图片颜色，不然UIBarButtonItem背景图颜色会取tintColor的颜色
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if (backRootView) {
        //自定义返回按钮的图标
        return [[UIBarButtonItem alloc]initWithImage:selectedImage style:UIBarButtonItemStylePlain target:self action:@selector(backRootViewcontroller:)];
    }else{
        //自定义返回按钮的图标
        return [[UIBarButtonItem alloc]initWithImage:selectedImage style:UIBarButtonItemStylePlain target:self action:@selector(backPopViewcontroller:)];
    }
}

- (void)backPopViewcontroller:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)backRootViewcontroller:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
