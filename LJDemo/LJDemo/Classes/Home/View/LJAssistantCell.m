//
//  LJAssistantCell.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/28.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJAssistantCell.h"
#import "LJAssistantItemView.h"

@interface LJAssistantCell ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation LJAssistantCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self p_initScrollViewSubView];
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView {
    static NSString *ID = @"AssistantCell";
    UINib *nib = [UINib nibWithNibName:@"LJAssistantCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    LJAssistantCell *cell = [[LJAssistantCell alloc] init];
    return cell;
}

#pragma mark - Private
- (void)p_initScrollViewSubView {

    CGFloat w = 83;
    CGFloat h = 86;
    CGFloat y = 0;
    
    for (int i = 0; i < 7; ++i) {
        LJAssistantItemView *itemView = [LJAssistantItemView viewFromXib];
        itemView.frame = CGRectMake(w * i, y, w, h);
        [self.scrollView addSubview:itemView];
    }
    
    self.scrollView.contentSize = CGSizeMake(h * 7, 0);
}

@end
