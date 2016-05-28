//
//  LJHomeViewController.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/24.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJHomePageViewController.h"
#import "LJHouseEnterCell.h"

static NSString *cellId = @"houseCell";

/** 顶部图片高度 */
static const CGFloat LJImageHeight = 192;

@interface LJHomePageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong)  UIImageView *zoomImageView;//变焦图片做底层
@end

@implementation LJHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //隐藏导航栏
    self.navigationController.navigationBar.hidden = YES;
    
    // 注册cell、sectionHeader、sectionFooter
//    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];

    
    //4.设置contentInset属性（上左下右 的值）
    self.collectionView.contentInset = UIEdgeInsetsMake(LJImageHeight, 0, 0, 0);
    
    _zoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homepage_visual"]];
    _zoomImageView.frame = CGRectMake(0, -LJImageHeight, self.view.frame.size.width, LJImageHeight);
    
    //contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
    [self.collectionView addSubview:_zoomImageView];
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
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"houseCell";
    LJHouseEnterCell *cell = [LJHouseEnterCell cellWithCollectionView:collectionView];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    return cell;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(54, 92);
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 25;
}

//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor greenColor]];
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 25, 5, 25);//分别为上、左、下、右
}

@end
