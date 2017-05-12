//
//  StatusPhotosView.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


#import "StatusPhotosView.h"
#import "Photo.h"
#import "StatusPhotoView.h"

#define StatusPhotoWH 70
#define StatusPhotoMargin 10
#define StatusPhotoMaxCol(count) ((count==4)?2:3)

@implementation StatusPhotosView

-(id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    
    return self;
}


- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    
    int photosCount = (int)photos.count;
    
    
    // 创建足够数量的图片控件
    // 这里的self.subviews.count不要单独赋值给其他变量
    while (self.subviews.count < photosCount) {
        StatusPhotoView *photoView = [[StatusPhotoView alloc] init];
        [self addSubview:photoView];
    }
    
    // 遍历所有的图片控件，设置图片
    for (int i = 0; i<self.subviews.count; i++) {
        StatusPhotoView *photoView = self.subviews[i];
        
        if (i < photosCount) { // 显示
            photoView.photo = photos[i];
            photoView.hidden = NO;
        } else { // 隐藏
            photoView.hidden = YES;
        }
    }
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    //设置图片的尺寸和位置
    int photosCount = (int)self.photos.count;
    int maxCol = StatusPhotoMaxCol(photosCount);
    for (int i = 0; i<photosCount; i++) {
        StatusPhotoView *photoView = self.subviews[i];
        int col = i % maxCol;
        photoView.x = col * (StatusPhotoWH + StatusPhotoMargin);
        
        int row = i / maxCol;
        photoView.y = row * (StatusPhotoWH + StatusPhotoMargin);
        photoView.width = StatusPhotoWH;
        photoView.height = StatusPhotoWH;
    }
    
}

+ (CGSize)sizeWithCount:(int)count
{
    // 最大列数（一行最多有多少列）
    int maxCols = StatusPhotoMaxCol(count);
    
    int cols = (count >= maxCols)? maxCols : count;
    CGFloat photosW = cols * StatusPhotoWH + (cols - 1) * StatusPhotoMargin;
    
    // 行数
    int rows = (count + maxCols - 1) / maxCols;
    CGFloat photosH = rows * StatusPhotoWH + (rows - 1) * StatusPhotoMargin;
    
    return CGSizeMake(photosW, photosH);
}

@end
