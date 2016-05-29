//
//  LJAssistantCell.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/28.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJAssistantCell.h"
#import "LJAssistantItemView.h"

@implementation LJAssistantCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView {
    static NSString *ID = @"AssistantCell";
    UINib *nib = [UINib nibWithNibName:@"LJAssistantCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    LJAssistantCell *cell = [[LJAssistantCell alloc] init];
    return cell;
}
@end
