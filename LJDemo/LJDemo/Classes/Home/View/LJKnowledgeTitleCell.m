//
//  LJKnowledgeTitleCell.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/29.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJKnowledgeTitleCell.h"

@implementation LJKnowledgeTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView {
    static NSString *ID = @"KnowledgeTitleCell";
    UINib *nib = [UINib nibWithNibName:@"LJKnowledgeTitleCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    LJKnowledgeTitleCell *cell = [[LJKnowledgeTitleCell alloc] init];
    return cell;
}
@end
