//
//  TextItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UItem,GIFItem,VideoItem,AudioItem,TopCommentItem;

@interface TextItem : NSObject

//ID
@property (nonatomic,strong) NSString *ID;

//时间
@property (nonatomic,strong) NSString *passtime;

//内容
@property (nonatomic,strong) NSString *text;

//赞
@property (nonatomic,assign) NSInteger up;

//损
@property (nonatomic,assign) NSInteger down;

//转发
@property (nonatomic,assign) NSInteger forward;

//评论
@property (nonatomic,assign) NSInteger comment;

//类型
@property (nonatomic,strong) NSString *type;

//姓名和头像模型
@property (nonatomic,strong) UItem *u;

//gif图片
@property (nonatomic,strong) GIFItem *gif;

//image图片
@property (nonatomic,strong) UItem *image;

//video
@property (nonatomic,strong) VideoItem *video;

//audio
@property (nonatomic,strong) AudioItem *audio;

//评论模型
@property (nonatomic,strong) TopCommentItem *top_comment;
/*********** 额外的辅助属性 ***********/

//cell的高度
@property (nonatomic,assign,readonly) CGFloat cellHeight;

//图片控件的frame
@property (nonatomic,assign,readonly) CGRect pictureF;

//声音控件的frame
@property (nonatomic, assign, readonly) CGRect soundF;

//视频空间的frame
@property (nonatomic,assign,readonly) CGRect videoF;

//图片是否太大
@property (nonatomic,assign,getter=isBigPicture) BOOL bigPicture;

//图片的下载进度
@property (nonatomic,assign) CGFloat pictureProgress;
@end
