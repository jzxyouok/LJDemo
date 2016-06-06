//
//  LJErrorView.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/29.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJErrorView.h"

@interface LJErrorView ()
/** 图片 */
@property (weak, nonatomic) IBOutlet UIImageView *tipImageView;
/** 提示信息 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/** 指导信息 */
@property (weak, nonatomic) IBOutlet UILabel *guideLabel;
@end

@implementation LJErrorView

- (void)setimageNameStr:(NSString *)imageNameStr titleStr:(NSString *)titleStr guideInfoStr:(NSString *)guideInfoStr {
    self.tipImageView.image = [UIImage imageNamed:imageNameStr];
    self.titleLabel.text = titleStr;
    self.guideLabel.text = guideInfoStr;
}

@end
