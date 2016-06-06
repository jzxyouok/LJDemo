//
//  LJCustomMoreHeaderView.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/5.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJCustomMoreHeaderView.h"

@interface LJCustomMoreHeaderView ()
@property (strong, nonatomic) UILabel *label;
@end

@implementation LJCustomMoreHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(15, 16, self.lj_width - 30, self.lj_height - 16);
        label.textColor = LJColor(0.2, 0.2, 0.2, 1);
        label.font = [UIFont systemFontOfSize:14];
        label.text = @"朝向";
        [self addSubview:label];
    }
    return self;
}

- (void)setLabelText:(NSString *)text {
    self.label.text = text;
}

@end
