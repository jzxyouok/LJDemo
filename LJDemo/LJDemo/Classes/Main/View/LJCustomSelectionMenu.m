//
//  LJCustomSelectionMenu.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/2.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJCustomSelectionMenu.h"
#import "LJButton.h"
#import "LJCustomDistrictAndSubwaySiftView.h"

static const NSUInteger count = 4;

@interface LJCustomSelectionMenu ()
@property (nonatomic, weak) UIView *controlView;
@end

@implementation LJCustomSelectionMenu

-(void)layoutSubviews {
    [super layoutSubviews];

    CGFloat w = (LJScreenW - count - 1) / count;
    CGFloat h = 44;
    
    for (int i = 0; i < count; ++i) {
        LJButton *btn = [LJButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(w * i + i, 0, w, h);
        [btn setTitle:@"区域" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"filter-dropdown-arrow"] forState:UIControlStateNormal];
        [self addSubview:btn];
  
        if (i != count - 1) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(w * (i + 1)+i, 11, 0.5, 22)];
            lineView.backgroundColor = LJColor(0.88, 0.88, 0.88, 1);
            [self addSubview:lineView];
        }
    }
    
    UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, LJScreenW, 0.5)];
    bottomLineView.backgroundColor = LJColor(0.88, 0.88, 0.88, 1);
    [self addSubview:bottomLineView];
    
    UIView *controlView = [[UIView alloc] init];
    self.controlView = controlView;
    controlView.frame = CGRectMake(0, h, self.lj_width, LJScreenH - 44);
    controlView.backgroundColor = [UIColor clearColor];
    [self addSubview:controlView];
}

- (void)btnClick:(UIButton *)sender {
    
    LJCustomDistrictAndSubwaySiftView *districtAndSubwaySiftView = [LJCustomDistrictAndSubwaySiftView viewFromXib];
    districtAndSubwaySiftView.frame = CGRectMake(0, 0, LJScreenW, 308);
    [self.controlView addSubview:districtAndSubwaySiftView];
}
@end
