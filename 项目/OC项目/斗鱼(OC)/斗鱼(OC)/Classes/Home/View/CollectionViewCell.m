//
//  CollectionViewCell.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "CollectionViewCell.h"
#import <UIImageView+WebCache.h>

@interface CollectionViewCell ()

/**
 *  房间ImageView
 */
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

/**
 *  主播名字
 */
@property (strong, nonatomic) IBOutlet UILabel *nickNameLabel;

/**
 *  在线人数
 */
@property (strong, nonatomic) IBOutlet UILabel *onlinePeople;

/**
 *  标题
 */
@property (strong, nonatomic) IBOutlet UILabel *roomNameLabel;

@end

@implementation CollectionViewCell

- (void)awakeFromNib {
    self.imageView.layer.cornerRadius = 5;
    self.imageView.layer.masksToBounds = YES;
}

- (void)setRoom:(Room *)room {
    _room = room;
    
    /**
     *  房间图片
     */
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:room.room_src] placeholderImage:[UIImage imageNamed:@"live_cell_default_phone_103x103_"]];
    
    /**
     *  房间名
     */
    self.roomNameLabel.text = room.room_name;
    
    self.nickNameLabel.text = room.nickname;

    /**
     *  在线数量
     */
    int onlineNumber = room.online.intValue;
    if (onlineNumber < 10000) {
        self.onlinePeople.text = room.online;
    } else {
        self.onlinePeople.text = [NSString stringWithFormat:@"%0.1f万",[room.online doubleValue]/10000];
    }
}


@end
