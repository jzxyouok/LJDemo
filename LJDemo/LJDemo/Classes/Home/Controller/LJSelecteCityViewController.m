//
//  LJSelecteCityViewController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/2.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJSelecteCityViewController.h"

@interface LJSelecteCityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation LJSelecteCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"选择城市";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
//    [self initNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNavigationBar{
    
    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, 64)];
    [bar setBackgroundImage:[UIImage imageNamed:@"pjdk_butten_tijiao"] forBarMetrics:UIBarMetricsDefault];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"选择城市"];
    
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [left setFrame:CGRectMake(0, 2, 28, 28)];
    [left setImage:[UIImage imageNamed:@"zhuche_back.png"] forState:UIControlStateNormal];
    
    [left addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:left];
    [item setLeftBarButtonItem:leftButton];
    [bar pushNavigationItem:item animated:NO];
    
    [self.view addSubview:bar];
}

//
//#pragma mark - Private
///**
// *  自定义导航栏
// */
//- (void)initNavigationBar{
//    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, 64)];
//    [bar setBackgroundImage:[UIImage imageNamed:@"pjdk_butten_tijiao"] forBarMetrics:UIBarMetricsDefault];
//    
//    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    cancelButton.frame = CGRectMake(LJScreenW - 56, 30, 40, 23);
//    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
//    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
//    [cancelButton addTarget:self action:@selector(p_back) forControlEvents:UIControlEventTouchUpInside];
//    [bar addSubview:cancelButton];
//    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(8, 26.5, LJScreenW - 70, 31)];
//    view.backgroundColor = [UIColor colorWithRed:0.18 green:0.55 blue:0.34 alpha:1];
//    [bar addSubview:view];
//    
//    UIButton *choiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    choiceButton.frame = CGRectMake(5, 1, 60, 28);
//    choiceButton.titleLabel.font = [UIFont systemFontOfSize:14];
//    [choiceButton setTitle:@"二手房 ▾" forState:UIControlStateNormal];
//    [choiceButton addTarget:self action:@selector(p_choiceHouseMode) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:choiceButton];
//    
//    
//    [self.view addSubview:bar];
//}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 设置 Cell...
    cell.textLabel.text = @"hello";
    
    return cell;
}

//返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"当前定位的城市";
    }
    else {
        return @"所有城市";
    }
}

@end
