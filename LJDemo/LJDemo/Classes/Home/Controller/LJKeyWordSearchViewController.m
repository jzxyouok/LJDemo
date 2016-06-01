//
//  LJKeyWordSearchViewController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/1.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJKeyWordSearchViewController.h"
#import "LJNoDataMaskView.h"

@interface LJKeyWordSearchViewController ()
/** 提示View */
@property (nonatomic, strong) LJNoDataMaskView *noDataMaskView;
@end

@implementation LJKeyWordSearchViewController

#pragma mark - ViewLife
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view addSubview:self.noDataMaskView];
    
    [self initNavigationBar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private
/**
 *  自定义导航栏
 */
- (void)initNavigationBar{
    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, 64)];
    [bar setBackgroundImage:[UIImage imageNamed:@"pjdk_butten_tijiao"] forBarMetrics:UIBarMetricsDefault];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(LJScreenW - 56, 30, 40, 23);
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(p_back) forControlEvents:UIControlEventTouchUpInside];
    [bar addSubview:cancelButton];

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(8, 26.5, LJScreenW - 70, 31)];
    view.backgroundColor = [UIColor colorWithRed:0.18 green:0.55 blue:0.34 alpha:1];
    [bar addSubview:view];
    
    UIButton *choiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    choiceButton.frame = CGRectMake(5, 1, 60, 28);
    choiceButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [choiceButton setTitle:@"二手房 ▾" forState:UIControlStateNormal];
    [choiceButton addTarget:self action:@selector(p_choiceHouseMode) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:choiceButton];
    
    UITextField *searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(69, 5, view.lj_width, 21)];
    UIColor *color = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    searchTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入小区名或商圈名称" attributes:@{NSForegroundColorAttributeName: color}];
    searchTextField.font = [UIFont systemFontOfSize:14];
    searchTextField.textColor = [UIColor whiteColor];
    [view addSubview:searchTextField];
    
    [self.view addSubview:bar];
}

/**
 *  选择搜索房源类型  二手房 新房  租房
 */
- (void)p_choiceHouseMode {
    NSLog(@"%s",__func__);
}

/**
 *  返回上一个控制器
 */
- (void)p_back{
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - Lazy
- (LJNoDataMaskView *)noDataMaskView {
    if (_noDataMaskView == nil) {
        _noDataMaskView = [LJNoDataMaskView viewFromXib];
        _noDataMaskView.frame = self.view.bounds;
    }
    return _noDataMaskView;
}

@end
