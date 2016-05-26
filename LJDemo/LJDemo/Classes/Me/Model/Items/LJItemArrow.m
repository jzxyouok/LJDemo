//
//  LJItemArrow.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/26.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJItemArrow.h"

@implementation LJItemArrow

- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon numStr:(NSString *)numStr targetVc:(Class)targetVc {
    if (self = [super initWithTitle:title icon:icon subTitle:numStr]) {
        self.targetVc = targetVc;
    }
    return self;
}

+ (instancetype)itemArrowWithTitle:(NSString *)title icon:(NSString *)icon numStr:(NSString *)numStr targetVc:(Class)targetVc {
    return [[self alloc] initWithTitle:title icon:icon numStr:numStr targetVc:targetVc];
}

@end
