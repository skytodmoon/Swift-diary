//
//  AllPictureView.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "AllPictureView.h"
#import "ProgressView.h"
#import "TextItem.h"
#import "UIImageView+WebCache.h"
#import "ShowPictureViewController.h"
#import "UItem.h"
#import "GIFItem.h"
@interface AllPictureView()
//图片
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//gif标识
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
//查看大图按钮
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;
//进度条控件
@property (weak, nonatomic) IBOutlet ProgressView *progressView;


@end

@implementation AllPictureView

//加载xib
+ (instancetype)pictureView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass( self) owner:nil options:kNilOptions] lastObject];
}

- (void)awakeFromNib
{
    //设置图片可以与用户交互
    self.imageView.userInteractionEnabled = YES;
    
    //给图片添加点击手势
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)]];
    
    self.autoresizingMask = UIViewAutoresizingNone;

}


//点击图片会进行全屏显示
- (void)showPicture
{
    ShowPictureViewController *showPicture = [[ShowPictureViewController alloc]init];
    
    showPicture.textItem = self.textItems;
//用主窗口调用
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPicture animated:YES completion:nil];
}

- (void)setTextItems:(TextItem *)textItems
{
    _textItems = textItems;
 
    //立马显示最新的进度值(防止因为网速慢，导致显示的是其他图片的下载进度，说白了就是进度条的循环引用)
    [self.progressView setProgress:textItems.pictureProgress animated:NO];
    
    //设置图片
    NSString *url;
    if ([self.textItems.type isEqualToString:@"image"]) {
        url = self.textItems.image.download_url.firstObject;
    } else if ([self.textItems.type isEqualToString:@"gif"]) {
        url = self.textItems.gif.images.firstObject;
    }
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        //加载数据时显示进度条
        self.progressView.hidden = NO;
        
        //进度值
        textItems.pictureProgress = 1.0 * receivedSize / expectedSize;
        
        //显示进度值
        [self.progressView setProgress:textItems.pictureProgress animated:NO];
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        //加载成功后隐藏进度条
        self.progressView.hidden = YES;
        
        //如果是大图片，才要进行绘图处理
        if (textItems.isBigPicture == NO) return;
        
        //开启图形上下文
        UIGraphicsBeginImageContextWithOptions(textItems.pictureF.size, YES, 0.0);
        
        //将下载完的image对象绘制到图形上下文中
        
        CGFloat wight = textItems.pictureF.size.width;
        CGFloat height = wight *image.size.height / image.size.width;
        
        [image drawInRect:CGRectMake(0, 0, wight, height)];
        
        //获得图片
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        //结束图形上下文
        UIGraphicsEndImageContext();
    }];
        
    //判断是否为GIF

    self.gifView.hidden = [textItems.type isEqualToString:@"image"];
    
    //判断是否显示“点击查看全图”
    if (textItems.isBigPicture) {//大图
        self.seeBigButton.hidden = NO;
    }else{//非大图
        self.seeBigButton.hidden = YES;
        
    }
}
@end
