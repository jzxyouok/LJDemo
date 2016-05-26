//
//  LJNavigationController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/24.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJNavigationController.h"

@interface LJNavigationController ()

@end

@implementation LJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 这个方法, 只会在当前类, 第一次被使用的时候, 只调用一次
+ (void)initialize {
    // 设置所有的导航栏的背景图片和title的文字颜色,大小
    UINavigationBar *navBarProxy = [UINavigationBar appearance];
    // 设置导航栏的背景图片
    [navBarProxy setBackgroundImage:[UIImage imageNamed:@"pjdk_butten_tijiao"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航栏中的标题的文字外观
    NSDictionary *attrs = @{
                            NSFontAttributeName : [UIFont systemFontOfSize:18],
                            NSForegroundColorAttributeName : [UIColor whiteColor]
                            };
    [navBarProxy setTitleTextAttributes:attrs];
    
    
    [navBarProxy setTintColor:[UIColor whiteColor]];
}

// 重写导航控制器的push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 当这个控制器被push的时候, 把底部的TabBar隐藏掉。
    viewController.hidesBottomBarWhenPushed = YES;
    
    // 必须调用一下父类的push方法, 才会进行push
    [super pushViewController:viewController animated:animated];
}

@end
