//
//  LJHomeViewController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/24.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJHomePageViewController.h"
#import "LJHouseEnterCell.h"
#import "LJBannerCell.h"
#import "LJAssistantCell.h"
#import "LJHousePriceCell.h"
#import "LJKnowledgeTitleCell.h"
#import "LJKnowledgeInfoCell.h"
#import "LJGroup.h"
#import "LJKeyWordSearchViewController.h"
#import "LJSelecteCityViewController.h"

#import "LJSaleHouseListViewController.h"

/** 顶部图片高度 */
static const CGFloat LJImageHeight = 211;

@interface LJHomePageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
/** 顶部图片 */
@property (nonatomic, strong)  UIImageView *zoomImageView;
/** 数据源 */
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
/** 组的集合 */
@property (nonatomic, strong) NSMutableArray *groups;
/** 顶部view */
@property (nonatomic, weak) UIView *topView;
/** 搜索view */
@property (nonatomic, strong) UIView *searchView;
/** 搜索框绿色渐变背景视图 */
@property (nonatomic, strong) UIView *greenView;
/** 头部标题View */
@property (nonatomic, strong) UIImageView *titleImageView;
@end

@implementation LJHomePageViewController

#pragma mark - ViewLife
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = YES;
    
    //设置contentInset属性（上左下右的值）
    self.collectionView.contentInset = UIEdgeInsetsMake(LJImageHeight, 0, 0, 0);
    
    [self p_initTopView];
    [self p_initSearchView];
    
    //初始化数据
    [self initData];
    
    //注册collectionView组头
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kHeaderID"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private
/**
 *  初始化顶部视图view
 */
- (void)p_initTopView {
    self.zoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homepage_visual"]];
    self.zoomImageView.frame = CGRectMake(0, -LJImageHeight, self.view.frame.size.width, LJImageHeight);
    self.zoomImageView.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
    [self.collectionView addSubview:self.zoomImageView];
    
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(0, -LJImageHeight, self.view.frame.size.width, LJImageHeight);
    topView.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
    [self.collectionView addSubview:topView];
    self.topView = topView;
    
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homepage_biaoti"]];
    titleImageView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, LJImageHeight/2 - 20);
    [self.topView addSubview:titleImageView];
    self.titleImageView = titleImageView;
}

/**
 *  初始化搜索框view
 */
- (void)p_initSearchView {
    self.searchView = [[UIView alloc] init];
    self.searchView.frame = CGRectMake(15, 151, self.view.lj_width - 30, 40);
    [self.view addSubview:self.searchView];
    [self.view bringSubviewToFront:self.searchView];
    self.searchView.backgroundColor = [UIColor whiteColor];
    
    UIView *cityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 68, 40)];
    [self.searchView addSubview:cityView];
    
    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 11.5, 28, 17)];
    cityLabel.text = @"北京";
    cityLabel.font = [UIFont systemFontOfSize:14];
    cityLabel.textColor = LJColor(0.13, 0.13, 0.13, 1);
    [cityView addSubview:cityLabel];
    
    UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homepage_search_iconjiantou"]];
    arrowImageView.lj_origin = CGPointMake(43, 10);
    [cityView addSubview:arrowImageView];
    
    UIButton *cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cityButton.frame = CGRectMake(0, 0, 68, 40);
    [cityButton addTarget:self action:@selector(p_choiceCity) forControlEvents:UIControlEventTouchUpInside];
    [self.searchView addSubview:cityButton];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(68, 10, 1, 20)];
    lineView.backgroundColor = LJColor(0.88, 0.88, 0.88, 1);
    [self.searchView addSubview:lineView];
    
    UIView *searchTextView = [[UIView alloc] initWithFrame:CGRectMake(69, 0, self.searchView.lj_width - 68, 40)];
    [self.searchView addSubview:searchTextView];
    
    UIImageView *searchIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homepage_search_icon"]];
    searchIconView.lj_origin = CGPointMake(79, 10);
    [self.searchView addSubview:searchIconView];
    
    UILabel *searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(104, 11.5, 140, 17)];
    searchLabel.text = @"输入小区名或商圈名称";
    searchLabel.font = [UIFont systemFontOfSize:14];
    searchLabel.textColor = LJColor(0.6, 0.6, 0.6, 1);
    [self.searchView addSubview:searchLabel];
    
    UIButton *startSearchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    startSearchButton.frame = CGRectMake(69, 0, self.searchView.lj_width - 68, 40);
    [startSearchButton addTarget:self action:@selector(p_startSearch) forControlEvents:UIControlEventTouchUpInside];
    [self.searchView addSubview:startSearchButton];
}

/**
 *  选择城市点击方法
 */
- (void)p_choiceCity {
    NSLog(@"%s",__func__);
    
    LJSelecteCityViewController *selecteCityVC = [[LJSelecteCityViewController alloc] init];
//    [self.navigationController pushViewController:selecteCityVC animated:YES];
    
    CATransition* transition = [CATransition animation];
    transition.type = kCATransitionPush;//可更改为其他方式
    transition.subtype = kCATransitionFromTop;//可更改为其他方式
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    [self.navigationController pushViewController:selecteCityVC animated:YES];
}

/**
 *  点击搜索框事件
 */
- (void)p_startSearch {
    LJKeyWordSearchViewController *KeyWordSearchVc = [[LJKeyWordSearchViewController alloc] init];
    [self.navigationController pushViewController:KeyWordSearchVc animated:YES];
}

- (void)initData {
    [self loadGroup0];
    [self loadGroup1];
    [self loadGroup2];
    [self loadGroup3];
    [self loadGroup4];
    [self loadGroup5];
}

- (void)loadGroup0 {
    // 创建组, 以及每组内的模型
    LJGroup *group0 = [[LJGroup alloc] init];
    group0.items = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    [self.groups addObject:group0];
}

- (void)loadGroup1 {
    // 创建组, 以及每组内的模型
    LJGroup *group1 = [[LJGroup alloc] init];
    group1.items = @[@"0"];
    [self.groups addObject:group1];
}

- (void)loadGroup2 {
    // 创建组, 以及每组内的模型
    LJGroup *group2 = [[LJGroup alloc] init];
    group2.items = @[@"0"];
    [self.groups addObject:group2];
}

- (void)loadGroup3 {
    // 创建组, 以及每组内的模型
    LJGroup *group3 = [[LJGroup alloc] init];
    group3.items = @[@"0"];
    [self.groups addObject:group3];
}

- (void)loadGroup4 {
    // 创建组, 以及每组内的模型
    LJGroup *group4 = [[LJGroup alloc] init];
    group4.items = @[@"0"];
    [self.groups addObject:group4];
}

- (void)loadGroup5 {
    // 创建组, 以及每组内的模型
    LJGroup *group5 = [[LJGroup alloc] init];
    group5.items = @[@"0",@"1",@"2"];
    [self.groups addObject:group5];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
    
    if (y < -LJImageHeight) {
        CGRect frame = self.zoomImageView.frame;
        frame.origin.y = y;
        frame.size.height =  -y;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
        self.zoomImageView.frame = frame;
        
        self.titleImageView.lj_centerY = -self.topView.lj_centerY;
        
        self.topView.frame = frame;
        self.searchView.lj_centerY = -y + 20 - 50;
    }
    else if (y >= -80) {
        self.greenView.lj_height = 80;
        self.searchView.lj_centerY = 50;
        self.greenView.alpha = 1;
    }
    else if (y > -150) {
        self.greenView.frame = CGRectMake(0, 0,self.view.lj_width , -y);
        [self.view addSubview:self.greenView];
        [self.view bringSubviewToFront:self.searchView];
        
        //变色
        CGFloat colorMargin = -y - 80;
        CGFloat  f = colorMargin / 70;
        self.greenView.backgroundColor = LJColor(0.19, 0.63, 0.34, 1 - f);
        self.searchView.lj_centerY = -y + 20 - 50;
    }
    else if (y <= -150) {
        [self.greenView removeFromSuperview];
        
        self.searchView.lj_centerY = -y + 20 - 50;
    }
}

//拖动结束
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    CGFloat y = scrollView.contentOffset.y;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
    if (y >= -80) {
        self.greenView.frame = CGRectMake(0, 0, self.view.lj_width , 80);
        self.greenView.backgroundColor = LJColor(0.19, 0.63, 0.34, 1);
        [self.view addSubview:self.greenView];
        [self.view bringSubviewToFront:self.searchView];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.groups.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.groups[section] items] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        static NSString *ID = @"houseCell";
        LJHouseEnterCell *cell = [LJHouseEnterCell cellWithCollectionView:collectionView];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 1) {
        static NSString *ID = @"BannerCell";
        LJBannerCell *cell = [LJBannerCell cellWithCollectionView:collectionView];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 2) {
        static NSString *ID = @"AssistantCell";
        LJAssistantCell *cell = [LJAssistantCell cellWithCollectionView:collectionView];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 3) {
        static NSString *ID = @"HousePriceCell";
        LJHousePriceCell *cell = [LJHousePriceCell cellWithCollectionView:collectionView];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 4) {
        static NSString *ID = @"KnowledgeTitleCell";
        LJKnowledgeTitleCell *cell = [LJKnowledgeTitleCell cellWithCollectionView:collectionView];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        return cell;
    }
    else {
        static NSString *ID = @"KnowledgeInfoCell";
        LJKnowledgeInfoCell *cell = [LJKnowledgeInfoCell cellWithCollectionView:collectionView];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        return cell;
    }
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return CGSizeMake(54, 92);
    }
    else if (indexPath.section == 1) {
        return CGSizeMake(375, 110);
    }
    else if (indexPath.section == 2) {
        return CGSizeMake(375, 141);
    }
    else if (indexPath.section == 3) {
        return CGSizeMake(375, 144);
    }
    else if (indexPath.section == 4) {
        return CGSizeMake(375, 55);
    }
    else {
        return CGSizeMake(375, 114);
    }
    
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 25;
}

//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    if (section == 0) {
        return 10;
    }
    else if (section == 1) {
        return 10;
    }
    else if (section == 2) {
        return 10;
    }
    else if (section == 3) {
        return 10;
    }
    else if (section == 4) {
        return 10;
    }
    else {
        return 0;
    }
    
}

//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LJSaleHouseListViewController *vc = [[LJSaleHouseListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (section == 0) {
        return UIEdgeInsetsMake(15, 25, 5, 25);//分别为上、左、下、右
    }
    else if (section == 1) {
        return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
    }
    else if (section == 2) {
        return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
    }
    else if (section == 3) {
        return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
    }
    else if (section == 4) {
        return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
    }
    else {
        return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(0, 0);
    }
    else if (section == 1) {
        return CGSizeMake(375, 12);
    }
    else if (section == 2) {
        return CGSizeMake(375, 12);
    }
    else if (section == 3) {
        return CGSizeMake(375, 12);
    }
    else if (section == 4) {
        return CGSizeMake(375, 12);
    }
    else {
        return CGSizeMake(0, 0);
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    //如果是头部视图 (因为这里的kind 有头部和尾部所以需要判断  默认是头部,严谨判断比较好)
    /*
     JHHeaderReusableView 头部的类
     kHeaderID  重用标识
     */
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerRV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"kHeaderID" forIndexPath:indexPath];
        
        if (!headerRV) {
            headerRV = [[UICollectionReusableView alloc] init];
        }
        
        headerRV.backgroundColor = LJColor(0.9, 0.9, 0.9, 1);
        return headerRV;
        
    }else //有兴趣的也可以添加尾部视图
    {
        return nil;
    }
}

#pragma mark - Lazy
- (NSMutableArray *)groups {
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (UIView *)greenView {
    if (_greenView == nil) {
        _greenView = [[UIView alloc] init];
    }
    return _greenView;
}

@end
