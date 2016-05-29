//
//  UIView+LJExtension.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/28.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "UIView+LJExtension.h"

@implementation UIView (LJExtension)

- (void)setLj_x:(CGFloat)lj_x {
    CGRect frame = self.frame;
    frame.origin.x = lj_x;
    self.frame = frame;
}

- (void)setLj_y:(CGFloat)lj_y {
    CGRect frame = self.frame;
    frame.origin.y = lj_y;
    self.frame = frame;
}

- (CGFloat)lj_x {
    return self.frame.origin.x;
}

- (CGFloat)lj_y {
    return self.frame.origin.y;
}

- (void)setLj_centerX:(CGFloat)lj_centerX {
    CGPoint center = self.center;
    center.x = lj_centerX;
    self.center = center;
}

- (CGFloat)lj_centerX {
    return self.center.x;
}

- (void)setLj_centerY:(CGFloat)lj_centerY {
    CGPoint center = self.center;
    center.y = lj_centerY;
    self.center = center;
}

- (CGFloat)lj_centerY {
    return self.center.y;
}

- (void)setLj_width:(CGFloat)lj_width {
    CGRect frame = self.frame;
    frame.size.width = lj_width;
    self.frame = frame;
}

- (void)setLj_height:(CGFloat)lj_height {
    CGRect frame = self.frame;
    frame.size.height = lj_height;
    self.frame = frame;
}

- (CGFloat)lj_height {
    return self.frame.size.height;
}

- (CGFloat)lj_width {
    return self.frame.size.width;
}

- (void)setLj_size:(CGSize)lj_size {
    CGRect frame = self.frame;
    frame.size = lj_size;
    self.frame = frame;
}

- (CGSize)lj_size {
    return self.frame.size;
}

- (void)setLj_origin:(CGPoint)lj_origin {
    CGRect frame = self.frame;
    frame.origin = lj_origin;
    self.frame = frame;
}

- (CGPoint)lj_origin {
    return self.frame.origin;
}

+ (instancetype)viewFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
