//
//  BaseTipsView.h
//  Ework
//
//  Created by ChiJinLian on 16/12/19.
//  Copyright © 2016年 crm. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  页面样式
 */
typedef NS_ENUM(NSInteger, TipsViewType) {
    NotDataType = 0,  //无数据
    NetErrorType,     //网络错误
};

@interface BaseTipsView : UIView
@property (nonatomic, weak)IBOutlet UIImageView *imageView;
@property (nonatomic, weak)IBOutlet UILabel *textLabel;
@property (nonatomic, weak)IBOutlet UIButton *button;
@property (nonatomic, assign, setter = setType:) TipsViewType type;

+ (BaseTipsView *)baseTipsViewType:(TipsViewType)type delegate:(id)delegate handler:(SEL)handler;

@end
