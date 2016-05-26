//
//  LJMyInfoTableViewCell.m
//  LJDemo
//
//  Created by 蔡万鸿 on 16/5/24.
//  Copyright © 2016年 黄花菜. All rights reserved.
//

#import "LJMyInfoTableViewCell.h"
#import "LJItem.h"
#import "LJItemArrow.h"

@interface LJMyInfoTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageview;
@property (weak, nonatomic) IBOutlet UILabel *titileLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@end

@implementation LJMyInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setItem:(LJItem *)item {
    _item = item;
    
    // 设置控件数据
    if (item.icon != nil) {
        self.iconImageView.image = [UIImage imageNamed:item.icon];
    }
    self.titileLabel.text = item.title;
    self.numLabel.text = item.subTitle;

    // 设置单元格右侧的AccessoryView
    if ([item isKindOfClass:[LJItemArrow class]]) {
        self.arrowImageview.hidden = NO;
    }
//    else if ([item isKindOfClass:[HMItemSwitch class]]) {
//        self.accessoryView = self.switchAccessory;
//    } else if ([item isKindOfClass:[HMItemLabel class]]) {
//        self.accessoryView = self.lblAccessory;
//    } else {
//        self.accessoryView = nil; // 这句话是为了防止单元格重用的时候的混乱问题
//    }
}

// 创建单元格的时候使用默认的style
+ (instancetype)settingCellWithTableView:(UITableView *)tableview {
    static NSString *ID = @"item_cell";
    LJMyInfoTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    return cell;
}

// 创建Cell的时候, 手动指定一个style
+ (instancetype)settingCellWithTableView:(UITableView *)tableview withStyle:(UITableViewCellStyle)style {
    static NSString *ID = @"item_cell";
    LJMyInfoTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LJMyInfoTableViewCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}

@end
