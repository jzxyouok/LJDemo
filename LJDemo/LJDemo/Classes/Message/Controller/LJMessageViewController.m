//
//  LJMessageViewController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/24.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJMessageViewController.h"
#import "LJErrorView.h"

@interface LJMessageViewController ()

@end

@implementation LJMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LJErrorView *errorView = [LJErrorView viewFromXib];
    errorView.frame = self.view.bounds;
    [self.view addSubview:errorView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
