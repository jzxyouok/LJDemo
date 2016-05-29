//
//  LJKnowledgeInfoCell.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/29.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJKnowledgeInfoCell.h"

@implementation LJKnowledgeInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView {
    static NSString *ID = @"KnowledgeInfoCell";
    UINib *nib = [UINib nibWithNibName:@"LJKnowledgeInfoCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    LJKnowledgeInfoCell *cell = [[LJKnowledgeInfoCell alloc] init];
    return cell;
}

@end
