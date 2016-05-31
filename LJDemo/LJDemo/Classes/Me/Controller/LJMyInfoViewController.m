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
#import "LJFollowedBuildingListViewController.h"
#import "LJMyFollowedHouseListViewController.h"
#import "LJMyFollowedCommunityViewController.h"
#import "LJMySeenRecordViewController.h"
#import "LJMyAskViewController.h"
#import "LJSellerEntrancePageController.h"
#import "LJInviteFriendsViewController.h"
#import "LJCalculateViewController.h"
#import "LCUserFeedbackViewController.h"
#import "LJSettingViewController.h"
#import "LJGroup.h"
#import "LJItemArrow.h"

/** 顶部图片高度 */
static const CGFloat LJImageHeight = 235;

@interface LJMyInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 数据源 */
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
/** 变焦图片做底层 */
@property (nonatomic, strong)  UIImageView *zoomImageView;
/** 表示组的集合 */
@property (nonatomic, strong) NSMutableArray *groups;
/** 顶部view */
@property (nonatomic, weak) UIView *topView;
/** 头像图片 */
@property (nonatomic, weak) UIImageView *avatarImageView;
/** 登录按钮 */
@property (nonatomic, weak) UIButton *loginButton;
@end

@implementation LJMyInfoViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = YES;
    
    //设置contentInset属性（上左下右 的值）
    self.tableView.contentInset = UIEdgeInsetsMake(LJImageHeight, 0, 0, 0);
    
    //初始化顶部view
    [self p_initTopView];

    //初始化数据
    [self p_loadGroup0];
    [self p_loadGroup1];
    [self p_loadGroup2];
    [self p_loadGroup3];
    [self p_loadGroup4];
    [self p_loadGroup5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 *  初始化顶部view
 */
- (void)p_initTopView {
    self.zoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg"]];
    self.zoomImageView.frame = CGRectMake(0, -LJImageHeight, self.view.frame.size.width, LJImageHeight);
    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
    [self.tableView addSubview:self.zoomImageView];
    
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(0, -LJImageHeight, self.view.frame.size.width, LJImageHeight);
    
    topView.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
    [self.tableView addSubview:topView];
    self.topView = topView;
    
    UIImageView *avatarImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myhome-icon-avatar"]];
    avatarImageView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, LJImageHeight/2 + 10);
    [self.topView addSubview:avatarImageView];
    self.avatarImageView = avatarImageView;
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"action_btn_border"] forState:UIControlStateNormal];
    [loginButton setTitle:@"登录/注册" forState:UIControlStateNormal];
    [loginButton setTintColor:[UIColor whiteColor]];
    loginButton.lj_size = CGSizeMake(137, 35);
    loginButton.lj_centerX = avatarImageView.lj_centerX;
    loginButton.lj_centerY = CGRectGetMaxY(avatarImageView.frame) + 25;
    [self.topView addSubview:loginButton];
    self.loginButton = loginButton;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
    if (y < -LJImageHeight) {
        CGRect frame = _zoomImageView.frame;
        frame.origin.y = y;
        frame.size.height =  -y;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
        _zoomImageView.frame = frame;
        self.topView.frame = frame;

        self.avatarImageView.lj_centerY = -self.topView.lj_centerY + 10;
        self.loginButton.lj_centerY =  CGRectGetMaxY(self.avatarImageView.frame) + 25;
        
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.groups[section] items] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1. 获取模型数据
    LJGroup *group = self.groups[indexPath.section];
    LJItem *item = group.items[indexPath.row];
    
    // 2. 创建单元格
    if (indexPath.section == 0) {
        LJAccountOverviewCell *cell = [LJAccountOverviewCell cellWithTableView:tableView];
        return cell;
    }
    else {
        LJMyInfoTableViewCell *cell = [LJMyInfoTableViewCell settingCellWithTableView:tableView];
        // 3. 设置单元格数据
        cell.item = item;
        // 4. 返回单元格
        return cell;
    }
}

//选中table view的某行的时候执行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 让当前行变成非选中状态
    //[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 1. 获取当前被选中的单元格的模型对象
    LJItem *item = [self.groups[indexPath.section] items][indexPath.row];
    
    // 判断(模型对象)是否是Arrow类型的Item, 如果是, 然后再获取对应的target控制器, 然后执行跳转
    if ([item isKindOfClass:[LJItemArrow class]]) {
        // 获取当前模型中的target类型
        LJItemArrow *arrowItem = (LJItemArrow *)item;
        
        Class targetVc = arrowItem.targetVc;
        
        // 创建target的对象
        UIViewController *vc = [[targetVc alloc] init];
        if (vc != nil) {
            // 执行跳转
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    // 判断当前模型的block属性(completion)是否赋值了, 如果赋值了(不为nil), 那么就执行以下
    if (item.completion) {
        item.completion();
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 55;
    }
    return 44;
}

- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section {
    return 0.1;
}

#pragma mark - Private
- (void)p_loadGroup0 {
    // 创建组, 以及每组内的模型
    LJGroup *group0 = [[LJGroup alloc] init];
    group0.items = @[@"group0"];
    [self.groups addObject:group0];
}

- (void)p_loadGroup1 {
    // 创建组, 以及每组内的模型
    LJGroup *group1 = [[LJGroup alloc] init];
    
    LJItemArrow *item1_0 = [LJItemArrow itemArrowWithTitle:@"我关注的新房" icon:@"myhome_icon_xinfang" numStr:@"0" targetVc:[LJFollowedBuildingListViewController class]];
    LJItemArrow *item1_1 = [LJItemArrow itemArrowWithTitle:@"我关注的二手房/租房" icon:@"myhome_icon_ershoufang" numStr:@"0" targetVc:[LJMyFollowedHouseListViewController class]];
    LJItemArrow *item1_2 = [LJItemArrow itemArrowWithTitle:@"我关注的小区" icon:@"myhome-icon-community" numStr:@"0" targetVc:[LJMyFollowedCommunityViewController class]];
    LJItemArrow *item1_3 = [LJItemArrow itemArrowWithTitle:@"我的看房记录" icon:@"myhome-icon-record" numStr:@"0" targetVc:[LJMySeenRecordViewController class]];
    
    group1.items = @[item1_0, item1_1, item1_2, item1_3];
    [self.groups addObject:group1];
}

- (void)p_loadGroup2 {
    // 创建组, 以及每组内的模型
    LJGroup *group2 = [[LJGroup alloc] init];
    
    LJItemArrow *item2_0 = [LJItemArrow itemArrowWithTitle:@"我的问答" icon:@"icon_wenda" numStr:@"0" targetVc:[LJMyAskViewController class]];
    
    group2.items = @[item2_0];
    [self.groups addObject:group2];
}

- (void)p_loadGroup3 {
    // 创建组, 以及每组内的模型
    LJGroup *group3 = [[LJGroup alloc] init];
    
    LJItemArrow *item3_0 = [LJItemArrow itemArrowWithTitle:@"我是卖家" icon:@"my_delegate" numStr:@"0" targetVc:[LJSellerEntrancePageController class]];
    
    group3.items = @[item3_0];
    [self.groups addObject:group3];
}

- (void)p_loadGroup4 {
    // 创建组, 以及每组内的模型
    LJGroup *group4 = [[LJGroup alloc] init];
    
    LJItemArrow *item4_0 = [LJItemArrow itemArrowWithTitle:@"邀请好友" icon:@"wd_icon_Invitefriends" numStr:@"" targetVc:[LJInviteFriendsViewController class]];
    LJItemArrow *item4_1 = [LJItemArrow itemArrowWithTitle:@"购房计算器" icon:@"myhome-icon-cal" numStr:@"" targetVc:[LJCalculateViewController class]];
    LJItemArrow *item4_2 = [LJItemArrow itemArrowWithTitle:@"用户反馈" icon:@"myhome-icon-feedback" numStr:@"" targetVc:[LCUserFeedbackViewController class]];
    LJItemArrow *item4_3 = [LJItemArrow itemArrowWithTitle:@"客服电话" icon:@"ic_customerservice" numStr:@"10109666" targetVc:nil];
    
    group4.items = @[item4_0, item4_1, item4_2, item4_3];
    [self.groups addObject:group4];
}

- (void)p_loadGroup5 {
    // 创建组, 以及每组内的模型
    LJGroup *group5 = [[LJGroup alloc] init];
    
    LJItemArrow *item5_0 = [LJItemArrow itemArrowWithTitle:@"设置" icon:@"myhome-icon-setting" numStr:@"" targetVc:[LJSettingViewController class]];
    
    group5.items = @[item5_0];
    [self.groups addObject:group5];
}

#pragma mark - Lazy
- (NSMutableArray *)groups {
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

@end
