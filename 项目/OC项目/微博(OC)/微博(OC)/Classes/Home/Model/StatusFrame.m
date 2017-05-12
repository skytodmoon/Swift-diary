//
//  StatusFrame.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "StatusFrame.h"
#import "Status.h"
#import "User.h"
#import "StatusPhotosView.h"


@implementation StatusFrame



-(void)setStatus:(Status *)status {
    
    _status  = status;
    
    User *user = status.user;
    // cell的宽度
    
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    /* 原创微博 */
    
    /** 头像 */
    CGFloat iconWH = 40;
    CGFloat iconX = StatusCellBorderW;
    CGFloat iconY = StatusCellBorderW;
    self.iconViewF = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    /** 昵称 */
    CGFloat nameX = CGRectGetMaxX(self.iconViewF) + StatusCellBorderW;
    CGFloat nameY = iconY;
    CGSize nameSize = [user.name sizeWithFont:StatusCellNameFont];
    self.nameLabelF = (CGRect){{nameX,nameY},nameSize};
    

    /** 会员图标 */
    if (user.isVip) {
        
        CGFloat vipX = CGRectGetMaxX(self.nameLabelF) + StatusCellBorderH;
        CGFloat vipY = nameY;
        CGFloat vipH = nameSize.height;
        CGFloat vipW = 14;
        self.vipViewF = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    /** 时间 */
    
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.nameLabelF) + StatusCellBorderH;
    CGSize timeSize = [status.created_at sizeWithFont:StatusCellTimeFont];
    self.timeLabelF = (CGRect){{timeX, timeY}, timeSize};
    
    
    /** 来源 */
    CGFloat sourceX = CGRectGetMaxX(self.timeLabelF) + StatusCellBorderW;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeWithFont:StatusCellSourceFont];
    self.sourceLabelF = (CGRect){{sourceX, sourceY}, sourceSize};

    
    /** 正文 */
    
    CGFloat contentX = StatusCellBorderW;
    CGFloat contentY = CGRectGetMaxY(self.iconViewF) + StatusCellBorderW;
    CGFloat maxW = cellW - 2 * contentX;
    CGSize contentSize = [status.text sizeWithFont:StatusCellContentFont maxW:maxW];
    self.contentLabelF = (CGRect){{contentX, contentY}, contentSize};
    
    
    /** 配图 */
     CGFloat originalH = 0;
    if (status.pic_urls.count) {
        CGFloat photosX = StatusCellBorderW;
        CGFloat photosY = CGRectGetMaxY(self.contentLabelF) + StatusCellBorderW;
        CGSize photosSize = [StatusPhotosView sizeWithCount:(int)status.pic_urls.count];
        self.photosViewF = (CGRect){{photosX, photosY}, photosSize};
        originalH = CGRectGetMaxY(self.photosViewF) + StatusCellBorderW;
    }else { // 没配图
        originalH = CGRectGetMaxY(self.contentLabelF) + StatusCellBorderW;
    }

    
    /** 原创微博整体 */
    CGFloat originalX = 0;
    CGFloat originalY = 0;
    CGFloat originalW = cellW;
    self.originalViewF = CGRectMake(originalX, originalY, originalW, originalH);

   
    
    CGFloat toolbarY = 0;
    /* 被转发微博 */
    if (status.retweeted_status) {
        Status *retweeted_status = status.retweeted_status;
        User *retweeted_status_user = retweeted_status.user;
        
        /** 被转发微博正文 */
        CGFloat retweetContentX = StatusCellBorderW;
        CGFloat retweetContentY = StatusCellBorderW;
        NSString *retweetContent = [NSString stringWithFormat:@"@%@ : %@", retweeted_status_user.name, retweeted_status.text];
        CGSize retweetContentSize = [retweetContent sizeWithFont:StatusCellRetweetContentFont maxW:maxW];
        self.retweetContentLabelF = (CGRect){{retweetContentX, retweetContentY}, retweetContentSize};
        
        /** 被转发微博配图 */
        CGFloat retweetH = 0;
        if (retweeted_status.pic_urls.count) { // 转发微博有配图
            CGSize retweetPhotosSize = [StatusPhotosView sizeWithCount:(int)retweeted_status.pic_urls.count];
            CGFloat retweetPhotosX = retweetContentX;
            CGFloat retweetPhotosY = CGRectGetMaxY(self.retweetContentLabelF) + StatusCellBorderW;
           self.retweetPhotosViewF = (CGRect){{retweetPhotosX, retweetPhotosY}, retweetPhotosSize};
            
            retweetH = CGRectGetMaxY(self.retweetPhotosViewF) + StatusCellBorderW;
        } else { // 转发微博没有配图
            retweetH = CGRectGetMaxY(self.retweetContentLabelF) + StatusCellBorderW;
        }
        
        /** 被转发微博整体 */
        CGFloat retweetX = 0;
        CGFloat retweetY = CGRectGetMaxY(self.originalViewF);
        CGFloat retweetW = cellW;
        self.retweetViewF = CGRectMake(retweetX, retweetY, retweetW, retweetH);
        
        toolbarY = CGRectGetMaxY(self.retweetViewF);
    } else {
        toolbarY = CGRectGetMaxY(self.originalViewF);
    }
    
    /** 工具条 */
    CGFloat toolbarX = 0;
    CGFloat toolbarW = cellW;
    CGFloat toolbarH = 35;
    self.toolbarF = CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);
    
    /* cell的高度 */
    self.cellHeight = CGRectGetMaxY(self.toolbarF) + StatusMargin;


}



@end
