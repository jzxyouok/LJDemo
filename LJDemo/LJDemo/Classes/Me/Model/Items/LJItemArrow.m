//
//  LJItemArrow.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/26.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJItemArrow.h"

@implementation LJItemArrow

- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon targetVc:(Class)targetVc {
    if (self = [super initWithTitle:title icon:icon]) {
        self.targetVc = targetVc;
    }
    return self;
}

+ (instancetype)itemArrowWithTitle:(NSString *)title icon:(NSString *)icon targetVc:(Class)targetVc {
    return [[self alloc] initWithTitle:title icon:icon targetVc:targetVc];
}

@end
