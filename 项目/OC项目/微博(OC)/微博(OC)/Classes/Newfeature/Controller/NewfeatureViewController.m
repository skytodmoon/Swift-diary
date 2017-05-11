//
//  NewfeatureViewController.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NewfeatureViewController.h"
#import "Checkbox.h"
#import "MainViewController.h"

#define NewfeatureImageCount 4

@interface NewfeatureViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;

@end

@implementation NewfeatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIApplication sharedApplication].statusBarHidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self setupScrollView];
    
    [self setupPageControl];
}

//MARK: -  初始化scrollView
- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    CGFloat contentW = scrollView.bounds.size.width * NewfeatureImageCount;
    [self.view addSubview:scrollView];
    
    scrollView.contentSize = CGSizeMake(contentW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    
    CGFloat imageW = scrollView.bounds.size.width;
    CGFloat imageH = scrollView.bounds.size.height;
    for (int index = 0; index < NewfeatureImageCount; index++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d", index + 1];
        imageView.image = [UIImage imageNamed:imageName];
        CGFloat imageX = index * imageW;
        imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
        [scrollView addSubview:imageView];
        if (index == NewfeatureImageCount - 1) {
            imageView.userInteractionEnabled = YES;
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            UIImage *bg = [UIImage imageNamed:@"new_feature_finish_button"];
            [button setBackgroundImage:bg forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
            [button setTitle:@"进入小小微博" forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:14.0];
            [button addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
            
            CGFloat centerX = imageView.bounds.size.width * 0.5;
            CGFloat centerY = imageView.bounds.size.height - 88;
            button.center = CGPointMake(centerX, centerY);
            button.bounds = (CGRect){CGPointZero, bg.size};
            [imageView addSubview:button];
            
            Checkbox *checkbox = [Checkbox checkboxWithTitle:@"分享到我的微博"];
            checkbox.selected = YES;
            [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
            
            CGFloat checkX = imageView.bounds.size.width * 0.5;
            CGFloat checkY = centerY + 40;
            checkbox.center = CGPointMake(checkX, checkY);
            [imageView addSubview:checkbox];
        }
    }
}

- (void)checkboxClick:(Checkbox *)checkbox
{
    checkbox.selected = !checkbox.selected;
}

//MARK: -   跳转控制器
- (void)start
{
//MARK: -  帮用户分享一条新特性微博
    [UIView animateWithDuration:0.7 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, -self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        self.view.window.rootViewController = [[MainViewController alloc] init];
    }];
}

//MARK: -   初始化pageControl
- (void)setupPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = NewfeatureImageCount;
    pageControl.pageIndicatorTintColor = Color(189, 189, 189);
    pageControl.currentPageIndicatorTintColor = Color(241, 99, 43);
    
    CGFloat centerX = self.view.bounds.size.width * 0.5;
    CGFloat centerY = self.view.bounds.size.height - 20;
    pageControl.center = CGPointMake(centerX, centerY);
    pageControl.bounds = CGRectMake(0, 0, 100, 30);
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}

//MARK: - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    self.pageControl.currentPage = page;
}


@end
