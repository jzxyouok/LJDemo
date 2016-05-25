//
//  LJItem.h
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/25.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJItem : NSObject
/** 标题 */
@property (nonatomic, copy) NSString *name;
/** 图标 */
@property (nonatomic, copy) NSString *iconStr;
/** 数据 */
@property (nonatomic, copy) NSString *numStr;
@end
