//
//  SchoolViewController.m
//  HDJY
//
//  Created by ChiJinLian on 16/12/21.
//  Copyright © 2016年 HDJY. All rights reserved.
//

#import "SchoolViewController.h"

@interface SchoolViewController ()

@end

@implementation SchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"学校情况";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextPage:(id)sender {
    BaseViewController *nextPageController = [[BaseViewController alloc]initWithUri:nil ext:nil];
    nextPageController.navigationItem.title = @"子页面";
    [self.navigationController pushViewController:nextPageController animated:YES];
}

@end
