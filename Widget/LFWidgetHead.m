//
//  LFWidgetHead.m
//  OCWidgetDemo
//
//  Created by 吴林丰 on 2017/4/24.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

#import "LFWidgetHead.h"
#import "LFButton.h"
#define ios10_later [[UIDevice currentDevice].systemVersion doubleValue] >= 10.0
#define btnTag  90908
@implementation LFWidgetHead

//+(id)getLFWidgetHead{
//    return [[LFWidgetHead alloc] init];
//}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

//布局
- (void)createUI{
    CGFloat magin = 10;
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 110);
    CGFloat widht = (frame.size.width - 6 * magin - 10)/4;
    CGFloat height = frame.size.height - 2*magin;
    NSArray *infoArr = [[NSArray alloc] init];
    infoArr = @[
                @{@"imageName":@"invitePatients",
                  @"title":@"邀请患者"
                  },
                @{@"imageName":@"groupCC",
                  @"title":@"群发"
                  },
                @{@"imageName":@"missionVC",
                  @"title":@"宣教"
                  },
                @{@"imageName":@"myMedicineShop",
                  @"title":@"我的药房"
                  },
                ];

    
    for (int i = 0; i<4; i++) {
        LFButton *btn = [[LFButton alloc] initWithFrame:CGRectMake(magin *(i + 1)+ widht*i, magin, widht, height)];
        [btn setImage:[UIImage imageNamed:[infoArr[i] objectForKey:@"imageName"]] forState:UIControlStateNormal];
        [btn setTitle:[infoArr[i] objectForKey:@"title"] forState:UIControlStateNormal];
        if (ios10_later) {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        [self addSubview:btn];
    }
    for (int i = 0; i<4; i++) {
        UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        newBtn.frame = CGRectMake(magin *(i + 1)+ widht*i, magin, widht, height);
        newBtn.userInteractionEnabled = YES;
        newBtn.alpha = 0.1;
        [newBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        newBtn.tag = btnTag + i;
        [self addSubview:newBtn];
    }

}
- (void)clickBtnAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(LFHeaderView:ClickBtnTag:)]) {
        [self.delegate LFHeaderView:self ClickBtnTag:(sender.tag - btnTag)];
    }
}


@end
