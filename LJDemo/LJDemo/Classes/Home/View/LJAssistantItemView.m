//
//  LJAssistantItemView.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/29.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJAssistantItemView.h"

@implementation LJAssistantItemView

+ (instancetype)viewFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
