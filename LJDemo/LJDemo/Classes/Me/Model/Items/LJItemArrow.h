//
//  LJItemArrow.h
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/26.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJItem.h"

@interface LJItemArrow : LJItem

// 为ArrowItem模型增加一个目标控制器类型的属性
@property (nonatomic, assign) Class targetVc;

- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon numStr:(NSString *)numStr targetVc:(Class)targetVc;

+ (instancetype)itemArrowWithTitle:(NSString *)title icon:(NSString *)icon numStr:(NSString *)numStr  targetVc:(Class)targetVc;

@end
