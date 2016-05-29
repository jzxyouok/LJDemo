//
//  LJHousePriceCell.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/29.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJHousePriceCell.h"

@implementation LJHousePriceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView {
    static NSString *ID = @"HousePriceCell";
    UINib *nib = [UINib nibWithNibName:@"LJHousePriceCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    LJHousePriceCell *cell = [[LJHousePriceCell alloc] init];
    return cell;
}
@end
