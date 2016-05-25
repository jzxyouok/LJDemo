//
//  LJMeViewController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/24.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJMyInfoViewController.h"
#import "LJAccountOverviewCell.h"
#import "LJMyInfoTableViewCell.h"

#import "LJMyInfoTopView.h"

#define ImageHight 200.0f

#define NavigationBarHight 64.0f

@interface LJMyInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 数据源 */
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@property (nonatomic, strong)  UIImageView *zoomImageView;//变焦图片做底层
@end

@implementation LJMyInfoViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_initData];
    
    //4.设置contentInset属性（上左下右 的值）
    self.tableView.contentInset = UIEdgeInsetsMake(ImageHight, 0, 0, 0);
    
    _zoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg"]];
    _zoomImageView.frame = CGRectMake(0, -ImageHight, self.view.frame.size.width, ImageHight);
    
    //contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
    
    [self.tableView addSubview:_zoomImageView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y+NavigationBarHight;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
    if (y < -ImageHight) {
        CGRect frame = _zoomImageView.frame;
        frame.origin.y = y;
        frame.size.height =  -y;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
        _zoomImageView.frame = frame;
    }
    
}

-(void)p_initData{
    
    self.dataSourceArray = [[NSMutableArray alloc] init];
    
    [self p_addData:@"我关注的新房" iconNameStr:@"myhome_icon_xinfang" numStr:@"0"];
    [self p_addData:@"我关注的二手房/租房" iconNameStr:@"myhome_icon_ershoufang" numStr:@"0"];
    [self p_addData:@"我关注的小区" iconNameStr:@"myhome-icon-community" numStr:@"0"];
    [self p_addData:@"我的看房记录" iconNameStr:@"myhome-icon-record" numStr:@"0"];
    [self p_addData:@"我的问答" iconNameStr:@"icon_wenda" numStr:@"0"];
    [self p_addData:@"我是卖家" iconNameStr:@"my_delegate" numStr:@"0"];
    [self p_addData:@"邀请好友" iconNameStr:@"wd_icon_Invitefriends" numStr:@""];
    [self p_addData:@"购房计算器" iconNameStr:@"myhome-icon-cal" numStr:@""];
    [self p_addData:@"用户反馈" iconNameStr:@"myhome-icon-feedback" numStr:@""];
    [self p_addData:@"客服电话" iconNameStr:@"ic_customerservice" numStr:@"10109666"];
    [self p_addData:@"设置" iconNameStr:@"myhome-icon-setting" numStr:@""];
}

- (void)p_addData:(NSString *)strTitle iconNameStr:(NSString *)iconNameStr numStr:(NSString *)numStr {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:strTitle forKey:@"title"];
    [dic setObject:iconNameStr forKey:@"image"];
    [dic setObject:numStr forKey:@"num"];
    [self.dataSourceArray addObject:dic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"InfoCell";
    
    LJMyInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[LJMyInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSDictionary *dic = self.dataSourceArray[indexPath.row];
    cell.textLabel.text = dic[@"title"];
    
    return cell;
}

@end
