//
//  LFButton.m
//  OCWidgetDemo
//
//  Created by 吴林丰 on 2017/4/24.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

#import "LFButton.h"

@implementation LFButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = self.imageView.frame;
    frame.size.width = self.imageView.bounds.size.width;
    frame.size.height = self.imageView.bounds.size.width;
    frame.origin.x = (self.frame.size.width - self.imageView.bounds.size.width)/2;
    frame.origin.y = 10;
    self.imageView.frame = frame;
    self.imageView.userInteractionEnabled = YES;
    // 设置label的位置。
    CGRect frame_lab = self.titleLabel.frame;
    frame_lab.origin.x = 0;
    frame_lab.origin.y = CGRectGetMaxY(self.imageView.frame);
    frame_lab.size.width = self.frame.size.width;
    frame_lab.size.height = self.frame.size.height - CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.frame = frame_lab;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
