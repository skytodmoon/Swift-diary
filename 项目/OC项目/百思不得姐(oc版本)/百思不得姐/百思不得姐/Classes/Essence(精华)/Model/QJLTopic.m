//
//  QJLTopic.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLTopic.h"
#import "NSDate+QJLExtension.h"
#import <MJExtension.h>
#import "QJLComment.h"
#import "QJLUser.h"

@implementation QJLTopic {
    CGFloat _cellHeight;
}

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID" : @"id",
             @"small_image" : @"image0",
             @"large_image" : @"image1",
             @"middle_image" : @"image2",
             @"top_cmt" : @"top_cmt[0]",
             @"qzone_uid" : @"top_cmt[0].user.qzone_uid"
             };
}

+(NSDictionary *)mj_objectClassInArray {
    return @{@"top_cmt" : @"QJLComment"};
}

-(NSString *)create_time  {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    //创建时间
    NSDate  *createDate = [fmt dateFromString:_create_time];
    //当前时间
    NSDate *now = [NSDate date];
    
    //日历
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *comps = [calender components:unit fromDate:createDate toDate:now options:0];
    
    if ([createDate isThisYear]) { //今年
        if ([createDate isYesterday]) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:createDate];
        } else if ([createDate isToday]) {
            if (comps.hour >= 1) {
                return [NSString stringWithFormat:@"%d小时前", (int)comps.hour];
            } else if (comps.minute >= 1) {
                return [NSString stringWithFormat:@"%d分钟前", (int)comps.minute];
            } else {
                return @"刚刚";
            }
        } else {
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:createDate];
        }
    } else { //不是今年
        fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        return [fmt stringFromDate:createDate];
    }
}

-(CGFloat)cellHeight {
    if (!_cellHeight) {
        // 文字的最大尺寸
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 4 * QJLTopicCellMargin, MAXFLOAT);
        // 计算文字的高度
        CGFloat textH = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        // 文字部分的高度
        _cellHeight = QJLTopicCellTextY + textH + QJLTopicCellMargin;
        //根据段子的类型来计算cell的高度
        if (self.type == QJLTopicTypePicture) { //图片帖子
            //图片显示出来的宽度
            CGFloat pictureW = maxSize.width;
            //图片显示出来的高度
            CGFloat pictureH = pictureW * self.height / self.width;
            if (pictureH >= QJLTopicCellPictureMaxH) { //图片高度过长
                pictureH = QJLTopicCellPictureBreakH;
                self.bigPicture = YES;
            }
            
            //计算图片控件的frame
            CGFloat pictureX = QJLTopicCellMargin;
            CGFloat pictureY = QJLTopicCellTextY + textH + QJLTopicCellMargin * 2;
            _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
            //图片的高度
            _cellHeight += pictureH + QJLTopicCellMargin;
        } else if (self.type == QJLTopicTypeVoice) { //声音帖子
            CGFloat voiceX = QJLTopicCellMargin;
            CGFloat voiceY = QJLTopicCellTextY + textH + QJLTopicCellMargin;
            CGFloat voiceW = maxSize.width;
            CGFloat voiceH = voiceW * self.height / self.width;
            _voiceF = CGRectMake(voiceX, voiceY, voiceW, voiceH);
            
            _cellHeight += voiceH + QJLTopicCellMargin;
        } else if (self.type == QJLTopicTypeVideo) { //视频帖子
            CGFloat videoX = QJLTopicCellMargin;
            CGFloat videoY = QJLTopicCellTextY + textH + QJLTopicCellMargin;
            CGFloat videoW = maxSize.width;
            CGFloat videoH = videoW * self.height / self.width;
            _videoF = CGRectMake(videoX, videoY, videoW, videoH);
            
            _cellHeight += videoH + QJLTopicCellMargin;
        }
        
        if (self.top_cmt) {
            NSString *content = [NSString stringWithFormat:@"%@:%@", self.top_cmt.user.username, self.top_cmt];
            CGFloat contentH = [content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
            _cellHeight += QJLTopicCellCmtTitleH + contentH + QJLTopicCellMargin;
        }
        
        //底部的高度
        _cellHeight += QJLTopicCellBottomBarH + QJLTopicCellMargin;
    }
    return _cellHeight;
}


@end
