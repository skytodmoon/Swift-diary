//
//  SettingCell.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "SettingCell.h"
#import "ArrowSettingItem.h"
#import "SwitchSettingItem.h"
#import "SegmentedSettingItem.h"

@interface SettingCell()
@property (nonatomic,strong) UIImageView *arrowView;
@property (nonatomic,strong) UISwitch *switchView;
@property (nonatomic,strong) UISegmentedControl *segmentedControl;

@end
@implementation SettingCell

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _arrowView;
}

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

- (UISegmentedControl *)segmentedControl
{
    if (_segmentedControl == nil) {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"小",@"中",@"大"]];
    }
    return _segmentedControl;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style
{
    static NSString *ID = @"cell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[SettingCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}

- (void)setItem:(SettingItem *)item
{
    _item = item;
    
    //设置控件上的内容
    [self setupData];

    //设置辅助视图
    [self setupAccessoyView];
}

- (void)setupData
{
    self.textLabel.text = _item.title;
}

- (void)setupAccessoyView{
    if ([_item isKindOfClass:[ArrowSettingItem class]]) {
        //箭头
        self.accessoryView = self.arrowView;
        self.accessoryType = UITableViewCellSelectionStyleDefault;
    }else if([_item isKindOfClass:[SwitchSettingItem class]]){self.accessoryView = self.switchView;
        //控制cell点击之后不变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if ([_item isKindOfClass:[SegmentedSettingItem class]]){
        self.accessoryView = self.segmentedControl;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else
    {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = nil;
    }
}
@end
