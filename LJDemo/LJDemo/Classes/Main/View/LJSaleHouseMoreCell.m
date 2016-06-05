//
//  LJSaleHouseMoreCell.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/5.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJSaleHouseMoreCell.h"

@implementation LJSaleHouseMoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0.5, 0.5, self.lj_width - 1, self.lj_height - 1);
    label.text = @"南";
    label.textColor = LJColor(0.4, 0.4, 0.4, 1);
    [self addSubview:label];
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView {
    static NSString *ID = @"saleHouseMoreCell";
    UINib *nib = [UINib nibWithNibName:@"LJSaleHouseMoreCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    LJSaleHouseMoreCell *cell = [[LJSaleHouseMoreCell alloc] init];
    return cell;
}

@end
