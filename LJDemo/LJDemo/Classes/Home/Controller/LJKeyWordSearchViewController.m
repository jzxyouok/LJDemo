//
//  LJKeyWordSearchViewController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/1.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJKeyWordSearchViewController.h"
#import "LJNoDataMaskView.h"

@interface LJKeyWordSearchViewController ()<UITextFieldDelegate>
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
    
    [self p_addObserverNSNotification];
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
    searchTextField.delegate = self;
    [searchTextField becomeFirstResponder];
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

/**
 *  注册通知
 */
- (void)p_addObserverNSNotification {
    //注册键盘出现的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    //注册键盘消失的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - NSNotification
/**
 *  键盘弹出
 */
- (void)keyboardWasShown:(NSNotification*)notification {
    //键盘高度
    CGRect keyBoardFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"%@",NSStringFromCGRect(keyBoardFrame));
    
    [UIView animateWithDuration:3.0 animations:^{
        self.noDataMaskView.lj_height = self.noDataMaskView.lj_height - 50;
    }];
}

/**
 *  键盘消失
 */
-(void)keyboardWillBeHidden:(NSNotification*)notification {
    [UIView animateWithDuration:3.0 animations:^{
        self.noDataMaskView.lj_height = self.view.lj_height;
    }];
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


#pragma mark - Lazy
- (LJNoDataMaskView *)noDataMaskView {
    if (_noDataMaskView == nil) {
        _noDataMaskView = [LJNoDataMaskView viewFromXib];
        _noDataMaskView.frame = self.view.bounds;
    }
    return _noDataMaskView;
}

@end
