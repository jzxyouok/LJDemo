//
//  LJSaleHouseListViewController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/2.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJSaleHouseListViewController.h"
#import "LJCustomSelectionMenu.h"
#import "LJErrorView.h"

@interface LJSaleHouseListViewController ()<UITextFieldDelegate>

@end

@implementation LJSaleHouseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LJErrorView *errorView = [LJErrorView viewFromXib];
    errorView.frame = self.view.bounds;
    [errorView setimageNameStr:@"no-network" titleStr:@"网络开了小差" guideInfoStr:@"请点击页面刷新"];
    [self.view addSubview:errorView];
    
    [self initNavigationBar];
    
    LJCustomSelectionMenu *menuView = [LJCustomSelectionMenu viewFromXib];
    menuView.frame = CGRectMake(0, 65, LJScreenW, 44);
    [self.view addSubview:menuView];
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
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(6, 20, 55, 44);
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [backButton setImage:[UIImage imageNamed:@"nav_return_button"] forState:UIControlStateNormal];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(p_back) forControlEvents:UIControlEventTouchUpInside];
    [bar addSubview:backButton];

    UIButton *messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    messageButton.frame = CGRectMake(LJScreenW - 41, 20, 32, 44);
    [messageButton setImage:[UIImage imageNamed:@"im_btn"] forState:UIControlStateNormal];
    [messageButton addTarget:self action:@selector(p_message) forControlEvents:UIControlEventTouchUpInside];
    [bar addSubview:messageButton];
    
    UIButton *locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    locationButton.frame = CGRectMake(LJScreenW - (LJScreenW - messageButton.lj_x + 8) - 32, 20, 32, 44);
    [locationButton setImage:[UIImage imageNamed:@"map_barButtonItem"] forState:UIControlStateNormal];
    [locationButton addTarget:self action:@selector(p_message) forControlEvents:UIControlEventTouchUpInside];
    [bar addSubview:locationButton];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(67, 26.5, LJScreenW -  67 - (LJScreenW - locationButton.lj_x) - 6, 31)];
    view.backgroundColor = [UIColor colorWithRed:0.18 green:0.55 blue:0.34 alpha:1];
    [bar addSubview:view];
    
    UIImageView *searchIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search-icon-list"]];
    searchIcon.lj_origin = CGPointMake(10, 9.5);
    [view addSubview:searchIcon];

    UITextField *searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(29, 0, view.lj_width, 31)];
    searchTextField.delegate = self;
    UIColor *color = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    searchTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入小区名或商圈名称" attributes:@{NSForegroundColorAttributeName: color}];
    searchTextField.font = [UIFont systemFontOfSize:14];
    searchTextField.textColor = [UIColor whiteColor];
    [view addSubview:searchTextField];
    
    [self.view addSubview:bar];
}

/**
 *  跳转到消息界面
 */
- (void)p_message {
    NSLog(@"%s",__func__);
}

/**
 *  返回上一个控制器
 */
- (void)p_back{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"%s",__func__);
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s",__func__);
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"%s",__func__);
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"%s",__func__);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%s",__func__);
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"%s",__func__);
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%s",__func__);
    return YES;
}

@end
