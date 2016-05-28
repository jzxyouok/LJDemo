//
//  LJHomeViewController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/24.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJHomePageViewController.h"

/** 顶部图片高度 */
static const CGFloat LJImageHeight = 192;

@interface LJHomePageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong)  UIImageView *zoomImageView;//变焦图片做底层
@end

@implementation LJHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //隐藏导航栏
    self.navigationController.navigationBar.hidden = YES;
    
    //4.设置contentInset属性（上左下右 的值）
    self.tableView.contentInset = UIEdgeInsetsMake(LJImageHeight, 0, 0, 0);
    
    _zoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homepage_visual"]];
    _zoomImageView.frame = CGRectMake(0, -LJImageHeight, self.view.frame.size.width, LJImageHeight);
    
    //contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
    [self.tableView addSubview:_zoomImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
    if (y < -LJImageHeight) {
        CGRect frame = _zoomImageView.frame;
        frame.origin.y = y;
        frame.size.height =  -y;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
        _zoomImageView.frame = frame;
    }
}

#pragma mark - UITableViewDataSource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return self.groups.count;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"ID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 设置 Cell...
    
    return cell;
}


@end
