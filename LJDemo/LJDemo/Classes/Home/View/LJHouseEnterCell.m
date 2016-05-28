//
//  LJHouseEnterCell.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/28.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJHouseEnterCell.h"

@implementation LJHouseEnterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView {
    static NSString *ID = @"houseCell";
    UINib *nib = [UINib nibWithNibName:@"LJHouseEnterCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    LJHouseEnterCell *cell = [[LJHouseEnterCell alloc] init];
    return cell;
}
@end
