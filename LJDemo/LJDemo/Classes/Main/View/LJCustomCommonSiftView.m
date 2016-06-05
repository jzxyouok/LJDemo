//
//  LJCustomCommonSiftView.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/5.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJCustomCommonSiftView.h"

@interface LJCustomCommonSiftView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LJCustomCommonSiftView

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"moneycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"100万以下";
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = LJColor(0, 0, 0, 1);
    cell.textLabel.highlightedTextColor = LJColor(0.22, 0.67, 0.42, 1);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
