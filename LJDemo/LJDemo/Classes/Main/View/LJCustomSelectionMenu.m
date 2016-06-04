//
//  LJCustomSelectionMenu.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/2.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJCustomSelectionMenu.h"
#import "LJButton.h"

static const NSUInteger count = 4;

@implementation LJCustomSelectionMenu

-(void)layoutSubviews {
    [super layoutSubviews];
    
//    self.backgroundColor = [UIColor redColor];
    
    CGFloat w = (LJScreenW - count - 1) / count;
    CGFloat h = 44;
    
    for (int i = 0; i < count; ++i) {
        LJButton *btn = [LJButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(w * i + i, 0, w, h);
        [btn setTitle:@"区域" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"filter-dropdown-arrow"] forState:UIControlStateNormal];
        [self addSubview:btn];
        
        NSLog(@"%@",NSStringFromCGRect(btn.frame));
        
        if (i != count - 1) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(w * (i + 1)+i, 11, 0.5, 22)];
            lineView.backgroundColor = LJColor(0.88, 0.88, 0.88, 1);
            [self addSubview:lineView];
        }
    }
    
    UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, LJScreenW, 0.5)];
    bottomLineView.backgroundColor = LJColor(0.88, 0.88, 0.88, 1);
    [self addSubview:bottomLineView];
}
@end
