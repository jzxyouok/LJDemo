//
//  LJMyInfoTopView.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/25.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJMyInfoTopView.h"

@implementation LJMyInfoTopView
+ (instancetype)viewFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
@end
