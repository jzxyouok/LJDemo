//
//  LJItem.h
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/25.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJItem : NSObject
// 标题
@property (nonatomic,copy)NSString *title;
// 图片
@property (nonatomic,copy)NSString *icon;
// 子标题
@property (nonatomic,copy)NSString *subTitle;

// 增加一个用来保存一段代码的属性(block类型的属性)
// 点击某行完毕的时候, 执行这个block中的代码
@property (nonatomic, copy) void(^completion)();

// 自定义一个init方法
- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon subTitle:(NSString *)subtitle;

@end
