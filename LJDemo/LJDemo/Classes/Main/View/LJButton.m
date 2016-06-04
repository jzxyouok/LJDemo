//
//  LJButton.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/3.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJButton.h"

@implementation LJButton

/**
 *  调换图片和文字的位置
 */
-(void)layoutSubviews {
    [super layoutSubviews];
    
    //上左下右
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.lj_width, 0, self.imageView.lj_width + 5)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.bounds.size.width + 5, 0, -self.titleLabel.bounds.size.width)];

    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:13];

}

@end
