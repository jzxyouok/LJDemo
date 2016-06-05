//
//  LJCustomMoreView.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/5.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJCustomMoreView.h"
#import "LJGroup.h"
#import "LJSaleHouseMoreCell.h"
#import "LJCustomMoreHeaderView.h"


static NSString *ID = @"saleHouseMoreCell";

@interface LJCustomMoreView ()<UICollectionViewDataSource,UICollectionViewDelegate>
/** 组的集合 */
@property (nonatomic, strong) NSMutableArray *groups;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation LJCustomMoreView

- (id)initWithCoder:(NSCoder*)coder {
    if (self =[super initWithCoder:coder]) {
        // 初始化代码
        [self initData];
    }
    return self;
}

- (IBAction)confirmClick:(UIButton *)sender {
    NSLog(@"%s",__func__);
}


- (void)initData {
    
//    [self.collectionView registerClass:[LJSaleHouseMoreCell class] forCellWithReuseIdentifier:ID];
    
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
    group0.items = @[@"0",@"1",@"2",@"3",@"4"];
    [self.groups addObject:group0];
}

- (void)loadGroup1 {
    // 创建组, 以及每组内的模型
    LJGroup *group1 = [[LJGroup alloc] init];
    group1.items = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    [self.groups addObject:group1];
}

- (void)loadGroup2 {
    // 创建组, 以及每组内的模型
    LJGroup *group2 = [[LJGroup alloc] init];
    group2.items = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    [self.groups addObject:group2];
}

- (void)loadGroup3 {
    // 创建组, 以及每组内的模型
    LJGroup *group3 = [[LJGroup alloc] init];
    group3.items = @[@"0",@"1",@"2",@"3"];
    [self.groups addObject:group3];
}

- (void)loadGroup4 {
    // 创建组, 以及每组内的模型
    LJGroup *group4 = [[LJGroup alloc] init];
    group4.items = @[@"0",@"1",@"2"];
    [self.groups addObject:group4];
}

- (void)loadGroup5 {
    // 创建组, 以及每组内的模型
    LJGroup *group5 = [[LJGroup alloc] init];
    group5.items = @[@"0",@"1",@"2"];
    [self.groups addObject:group5];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.groups.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.groups[section] items] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    LJSaleHouseMoreCell *cell = [LJSaleHouseMoreCell cellWithCollectionView:collectionView];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    return cell;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(77.25, 30);
}

//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 12.25;
}

//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}


//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20.5, 7.5, 20.5, 7.5);//分别为上、左、下、右
}
#pragma mark - Lazy
- (NSMutableArray *)groups {
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

@end
