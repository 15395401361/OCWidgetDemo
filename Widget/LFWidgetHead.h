//
//  LFWidgetHead.h
//  OCWidgetDemo
//
//  Created by 吴林丰 on 2017/4/24.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFWidgetHead;
@protocol LFWidgetDelegate <NSObject>

@optional
- (void)LFHeaderView:(LFWidgetHead *)headView ClickBtnTag:(NSInteger)tag;

@end

@interface LFWidgetHead : UIView

@property (weak,nonatomic) id <LFWidgetDelegate> delegate;
//
//+(id)getLFWidgetHead;
//

@end
