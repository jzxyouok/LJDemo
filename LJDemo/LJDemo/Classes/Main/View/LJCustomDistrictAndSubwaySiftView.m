//
//  LJCustomDistrictAndSubwaySiftView.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/5.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJCustomDistrictAndSubwaySiftView.h"

/** tableView高度 */
static const CGFloat tableViewHeight = 308;
///** tableView个数 */
//static const NSUInteger tableViewCount = 2;

@interface LJCustomDistrictAndSubwaySiftView ()<UITableViewDelegate,UITableViewDataSource>
/** 一级菜单 区域 地铁  附近 */
@property (nonatomic, strong) UITableView *oneLevelTableView;
/** 二级菜单 */
@property (nonatomic, strong) UITableView *twoLevelTableView;
/** 三级菜单 */
@property (nonatomic, strong) UITableView *threeLevelTableView;
/** tableView个数 */
@property (nonatomic, assign) NSUInteger tableViewCount;

@end

@implementation LJCustomDistrictAndSubwaySiftView

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.tableViewCount = 3;
    
    for (int i = 0; i < self.tableViewCount; ++i) {
        CGFloat x = LJScreenW / self.tableViewCount;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake( x * i, 0, LJScreenW / self.tableViewCount, tableViewHeight) style:UITableViewStylePlain];
        tableView.tag = 100 + i;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.tableFooterView = [[UIView alloc] init];
        [self addSubview:tableView];
    }
    
    for (int i = 0; i < self.tableViewCount - 1; ++i) {
        CGFloat x = LJScreenW / self.tableViewCount;
        UIView *middleLineView = [[UIView alloc] initWithFrame:CGRectMake(x * (i + 1), 0, 0.5, tableViewHeight)];
        middleLineView.backgroundColor = LJColor(0.88, 0.88, 0.88, 1);
        [self addSubview:middleLineView];
    }
    
    UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, tableViewHeight, LJScreenW, 0.5)];
    bottomLineView.backgroundColor = LJColor(0.88, 0.88, 0.88, 1);
    [self addSubview:bottomLineView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 100) {
        return 3;
    }
    else if (tableView.tag == 101)
    {
        return 10;
    }
    else if (tableView.tag == 102)
    {
        return 10;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 100) {
        static NSString *identifier = @"lefCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = @"地铁";
        return cell;
    }
    else if (tableView.tag == 101) {
        static NSString *identifier = @"rightcell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = @"西二旗";
        return cell;
    }
    else if (tableView.tag == 102) {
        static NSString *identifier = @"rightcell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = @"西二旗";
        return cell;
    }
    return nil;
}

//选中table view的某行的时候执行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__func__);
}

@end
