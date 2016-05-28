//
//  LJTabBarController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/23.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJTabBarController.h"

/**
 *  该模块根控制器是否有导航栏
 */
typedef NS_ENUM(NSUInteger, LJMoudleNavState) {
    /**
     *  没有导航栏
     */
    LJMoudleNavStateNone,
    /**
     *  有导航栏
     */
    LJMoudleNavStateHave
};

@interface LJTabBarController ()

@end

@implementation LJTabBarController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.添加子控制器
    [self p_addChildViewControllers];
    
    //2.设置tabbar文字颜色
    self.tabBar.tintColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private
/**
 *  添加子控制器
 */
- (void)p_addChildViewControllers {
    // 首页
    [self p_addChildVCWithSBName:@"Home" title:@"首页" norImageName:@"bottom-bar-home-icon" selectedImageName:@"bottom-bar-home-icon-active" navState:LJMoudleNavStateNone];

    // 消息
    [self p_addChildVCWithSBName:@"Message" title:@"消息" norImageName:@"bottom-bar-messege-icon" selectedImageName:@"bottom-bar-messege-icon-active" navState:LJMoudleNavStateHave];

    // 我
    [self p_addChildVCWithSBName:@"Me" title:@"我" norImageName:@"bottom-bar-center-icon" selectedImageName:@"bottom-bar-center-icon-active" navState:LJMoudleNavStateNone];
}

/**
 *  通过一个SB创建控制器
 *
 *  @param sbName            StoryBoard名称
 *  @param title             tabBarItem标题
 *  @param norImageName      默认图片
 *  @param selectedImageName 选中图片
 *
 *  @return 根控制器
 */
- (UIViewController *)p_addChildVCWithSBName:(NSString *)sbName  title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName navState:(LJMoudleNavState)navState{
    // 1.加载Storyboard
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    // 2.创建Storyboard中的初始控制器
    if (navState == LJMoudleNavStateNone) {
        UIViewController *vc = sb.instantiateInitialViewController;
        // 3.调用addChildVCWithController
        [self p_addChildVCWithController:vc title:title norImageName:norImageName selectedImageName:selectedImageName  navState:LJMoudleNavStateNone];
        return vc;
    }
    else {
        UINavigationController *nav = sb.instantiateInitialViewController;
        // 3.调用addChildVCWithController
        [self p_addChildVCWithController:nav.topViewController title:title norImageName:norImageName selectedImageName:selectedImageName  navState:LJMoudleNavStateHave];
        return nav.topViewController;
    }
}

/**
 *  设置指定控制器的相关属性
 */
- (UIViewController *)p_addChildVCWithController:(UIViewController *)vc  title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName  navState:(LJMoudleNavState)navState{
    // 设置标题
    vc.tabBarItem.title = title;
    //导航栏标题
    if (navState == LJMoudleNavStateHave) {
        vc.navigationItem.title = title;
    }
    // 设置默认图片
    vc.tabBarItem.image = [UIImage imageNamed:norImageName];
    // 设置选中图片
    vc.tabBarItem.selectedImage =  [UIImage imageNamed:selectedImageName];
    // 添加到父控件
    if (navState == LJMoudleNavStateHave) {
        [self addChildViewController:vc.navigationController];
    }
    else {
        [self addChildViewController:vc];
    }
    return vc;
}

@end
