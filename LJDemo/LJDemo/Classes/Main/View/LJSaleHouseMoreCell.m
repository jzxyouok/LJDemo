//
//  LJSaleHouseMoreCell.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/6/5.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJSaleHouseMoreCell.h"

@interface LJSaleHouseMoreCell ()
@property (weak, nonatomic) IBOutlet UIView *borderView;

@end

@implementation LJSaleHouseMoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.borderView.layer.borderWidth = 0.5;
    self.borderView.layer.borderColor = [LJColor(0.4, 0.4, 0.4, 1) CGColor];
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView {
    static NSString *ID = @"saleHouseMoreCell";
    UINib *nib = [UINib nibWithNibName:@"LJSaleHouseMoreCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    LJSaleHouseMoreCell *cell = [[LJSaleHouseMoreCell alloc] init];
    return cell;
}

@end
