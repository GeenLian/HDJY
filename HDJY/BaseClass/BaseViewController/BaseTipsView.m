//
//  BaseTipsView.m
//  Ework
//
//  Created by ChiJinLian on 16/12/19.
//  Copyright © 2016年 crm. All rights reserved.
//

#import "BaseTipsView.h"

@implementation BaseTipsView

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = self.frame;
    if (self.type == NetErrorType) {
        frame.size.height = CGRectGetMaxY(self.button.frame);
    }else if (self.type == NotDataType) {
        frame.size.height = CGRectGetMaxY(self.textLabel.frame);
    }
    frame.origin.y = (CGRectGetHeight(self.superview.bounds)-frame.size.height)/2.0;
    self.frame = frame;
    self.textLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.superview.bounds)-20;
}

//超出范围的button也可点击
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIView *result = [super hitTest:point withEvent:event];
    CGPoint buttonPoint = [self.button convertPoint:point fromView:self];
    if ([self.button pointInside:buttonPoint withEvent:event]) {
        return self.button;
    }
    return result;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius = 4;
    self.button.layer.borderWidth = 1;
    self.button.layer.borderColor = UIColorFromRGB(0x8A8997).CGColor;
}

- (void)setType:(TipsViewType)type {
    _type = type;
    
    if (type == NotDataType) {
        self.button.hidden = YES;
        self.imageView.image = [UIImage imageNamed:@"img_general_nodata"];
        self.textLabel.font = [UIFont systemFontOfSize:17];
        self.textLabel.text = @"无数据";
    }else if (type == NetErrorType) {
        self.button.hidden = NO;
        self.imageView.image = [UIImage imageNamed:@"img_general_noInternet"];
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.textLabel.text = @"网络错误";
    }
    [self updateConstraints];
    [self setNeedsLayout];
}

+ (BaseTipsView *)baseTipsViewType:(TipsViewType)type delegate:(id)delegate handler:(SEL)handler {
    BaseTipsView *view = [[[NSBundle mainBundle] loadNibNamed:@"BaseTipsView" owner:self options:nil] objectAtIndex:0];
    view.type = type;
    if (delegate && handler) {
        [view.button addTarget:delegate action:handler forControlEvents:UIControlEventTouchUpInside];
    }
    return view;
}

@end
