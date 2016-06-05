//
//  LJCustomMoreHeaderView.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/5.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJCustomMoreHeaderView.h"

@implementation LJCustomMoreHeaderView

-(void)layoutSubviews {
    [super layoutSubviews];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(15, 16, self.lj_width - 30, self.lj_height - 16);
    label.textColor = LJColor(0.2, 0.2, 0.2, 1);
    label.text = @"朝向";
    [self addSubview:label];
}

@end
