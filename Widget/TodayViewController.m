//
//  TodayViewController.m
//  Widget
//
//  Created by 吴林丰 on 2017/4/24.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "LFWidgetHead.h"

#define widgetCount 3
#define cellHeight 80
#define ios10_later [[UIDevice currentDevice].systemVersion doubleValue] >= 10.0

@interface TodayViewController () <NCWidgetProviding,LFWidgetDelegate>

@property (nonatomic,weak)LFWidgetHead *headerView;
@property (nonatomic,weak)NSArray *hotTopicDataSource;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddHeadView];
    // Do any additional setup after loading the view from its nib.
}

//初始化View
- (void)AddHeadView{
    
    LFWidgetHead *headerView = [[LFWidgetHead alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 110)];
    headerView.delegate = self;
    [self.view addSubview: headerView];
    self.headerView = headerView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (ios10_later) {
        [self initDataSource];
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    }else{
        [self initDataSource];
         self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,  cellHeight * 10 + 110);
    }
}


- (void)initDataSource{
    @try {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            //在此处进行网络请求数据获取
            //然后更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.view layoutIfNeeded];
            });
            
            
        });
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    //    NCUpdateResultNewData   新的内容需要重新绘制视图
    //    NCUpdateResultNoData    部件不需要更新
    //    NCUpdateResultFailed    更新过程中发生错误
    completionHandler(NCUpdateResultNewData);
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize{
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
         self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    }else{
         self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,  cellHeight * 10 + 110);
    }
}


- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

#pragma mark ---- LFHeadViewDelegate
- (void)LFHeaderView:(LFWidgetHead *)headView ClickBtnTag:(NSInteger)tag{
    NSString *urlString = [NSString stringWithFormat:@"com.Widget://%li",tag];
    NSURL *url = [NSURL URLWithString:urlString];
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        NSLog(@"%d",success);
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
