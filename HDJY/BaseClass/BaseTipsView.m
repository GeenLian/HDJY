//
//  BaseTipsView.m
//  Ework
//
//  Created by ChiJinLian on 16/12/19.
//  Copyright © 2016年 crm. All rights reserved.
//

#import "BaseTipsView.h"

@implementation BaseTipsView

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
//        self.textBottom.constant = 0;
        self.imageView.image = [UIImage imageNamed:@"img_general_nodata"];
        self.textLabel.font = [UIFont systemFontOfSize:17];
        self.textLabel.text = @"空空如也";
        
    }else if (type == NetErrorType) {
        self.button.hidden = NO;
//        self.textBottom.constant = 53;
        self.imageView.image = [UIImage imageNamed:@"img_general_noInternet"];
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.textLabel.text = @"您已超速驾驶，网络都跟不上啦";
        
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

+ (CGFloat)baseTipsViewHeightWithSuperView:(UIView *)view baseTipsView:(BaseTipsView *)baseTipsView {
    
    CGFloat height = 217*CGRectGetWidth(view.frame)/375.0 + 25 + (ScreenWidth > 375.0?10:0);
    
    UIFont *font = [UIFont systemFontOfSize:15];
    if (baseTipsView.type == NotDataType) {
        font = [UIFont systemFontOfSize:17];
    }else if (baseTipsView.type == NetErrorType) {
        font = [UIFont systemFontOfSize:15];
    }
    
    CGSize textSize = [NSString sizeWithString:baseTipsView.textLabel.text font:font width:CGRectGetWidth(view.bounds)-20 height:MAXFLOAT];
    
    if (baseTipsView.type == NotDataType) {
        height = height + textSize.height;
    }else if (baseTipsView.type == NetErrorType) {
        height = height + textSize.height + 15 + 38;
    }
    return height;
}
@end
