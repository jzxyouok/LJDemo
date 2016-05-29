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

/** 顶部图片高度 */
static const CGFloat LJImageHeight = 192;

@interface LJHomePageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong)  UIImageView *zoomImageView;//变焦图片做底层


/** 数据源 */
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
/** 表示组的集合 */
@property (nonatomic, strong) NSMutableArray *groups;
@end

@implementation LJHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //隐藏导航栏
    self.navigationController.navigationBar.hidden = YES;
    
    //4.设置contentInset属性（上左下右 的值）
    self.collectionView.contentInset = UIEdgeInsetsMake(LJImageHeight, 0, 0, 0);
    
    _zoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homepage_visual"]];
    _zoomImageView.frame = CGRectMake(0, -LJImageHeight, self.view.frame.size.width, LJImageHeight);
    
    //contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
    [self.collectionView addSubview:_zoomImageView];
    
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData {
    //第0组 8个
    //第1组 1个
    //第2组 1个
    //第3组 1个
    //第4组 1个
    //第5组 3个
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
        CGRect frame = _zoomImageView.frame;
        frame.origin.y = y;
        frame.size.height =  -y;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
        _zoomImageView.frame = frame;
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
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor greenColor]];
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (section == 0) {
        return UIEdgeInsetsMake(15, 25, 5, 25);//分别为上、左、下、右
    }
    else if (section == 1) {
        return UIEdgeInsetsMake(20, 0, 0, 0);//分别为上、左、下、右
    }
    else if (section == 2) {
        return UIEdgeInsetsMake(20, 0, 0, 0);//分别为上、左、下、右
    }
    else if (section == 3) {
        return UIEdgeInsetsMake(20, 0, 0, 0);//分别为上、左、下、右
    }
    else if (section == 4) {
        return UIEdgeInsetsMake(20, 0, 0, 0);//分别为上、左、下、右
    }
    else {
        return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
    }

}

#pragma mark - Lazy
- (NSMutableArray *)groups {
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

@end
