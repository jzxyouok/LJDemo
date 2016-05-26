//
//  LJItem.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/25.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJItem.h"

@implementation LJItem

- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon subTitle:(NSString *)subtitle {
    if (self = [super init]) {
        self.title = title;
        self.icon = icon;
        self.subTitle = subtitle;
    }
    return self;
}

@end
