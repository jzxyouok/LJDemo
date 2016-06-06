//
//  LJClearContentCell.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/6.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJClearContentCell.h"

@implementation LJClearContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView {
    static NSString *ID = @"clearCell";
    UINib *nib = [UINib nibWithNibName:@"LJClearContentCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    LJClearContentCell *cell = [[LJClearContentCell alloc] init];
    return cell;
}

@end
