//
//  ImageScrollView.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageScrollViewDelegate <NSObject>

-(void)didSelectImageAtIndex:(NSInteger)index;

@end

@interface ImageScrollView : UIView


@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIPageControl *pageControl;
@property(nonatomic, strong) NSArray *imgArray;
@property(nonatomic, assign) id<ImageScrollViewDelegate> delegate;

-(void)setImageArray:(NSArray *)imageArray;
-(ImageScrollView *)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imgArr;

@end
