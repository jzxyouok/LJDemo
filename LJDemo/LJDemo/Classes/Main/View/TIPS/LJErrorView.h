//
//  LJErrorView.h
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/29.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJErrorView : UIView
/**
 *  设置提示信息
 *
 *  @param imageNameStr 图片名称
 *  @param titleStr     提示信息
 *  @param guideInfoStr 指导信息
 */
- (void)setimageNameStr:(NSString *)imageNameStr titleStr:(NSString *)titleStr guideInfoStr:(NSString *)guideInfoStr;
@end
