//
//  UIView+LJExtension.h
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/28.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LJExtension)
@property (nonatomic, assign) CGFloat lj_x;
@property (nonatomic, assign) CGFloat lj_y;
@property (nonatomic, assign) CGFloat lj_width;
@property (nonatomic, assign) CGFloat lj_height;
@property (nonatomic, assign) CGFloat lj_centerX;
@property (nonatomic, assign) CGFloat lj_centerY;
@property (nonatomic, assign) CGSize  lj_size;
@property (nonatomic, assign) CGPoint lj_origin;

+ (instancetype)viewFromXib;
@end
