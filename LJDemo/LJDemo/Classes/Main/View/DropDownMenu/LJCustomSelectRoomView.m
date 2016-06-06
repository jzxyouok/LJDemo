//
//  LJCustomSelectRoomView.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/5.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJCustomSelectRoomView.h"

@interface LJCustomSelectRoomView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LJCustomSelectRoomView

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"roomCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"1室";
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = LJColor(0, 0, 0, 1);
    cell.textLabel.highlightedTextColor = LJColor(0.22, 0.67, 0.42, 1);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
