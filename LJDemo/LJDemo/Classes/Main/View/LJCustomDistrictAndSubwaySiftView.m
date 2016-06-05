//
//  LJCustomDistrictAndSubwaySiftView.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/5.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJCustomDistrictAndSubwaySiftView.h"

@interface LJCustomDistrictAndSubwaySiftView ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *leftTableView;

@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@end

@implementation LJCustomDistrictAndSubwaySiftView

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isEqual:self.leftTableView]) {
        return 3;
    }
    else if ([tableView isEqual:self.rightTableView])
    {
        return 10;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.leftTableView]) {
        static NSString *identifier = @"lefCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = @"地铁";
        return cell;
    }
    else if ([tableView isEqual:self.rightTableView]) {
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
