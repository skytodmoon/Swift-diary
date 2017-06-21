//
//  WelcomeViewController.m
//  京东
//
//  Created by 金亮齐 on 2017/6/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "WelcomeViewController.h"
#import "ChangeFontWithLabel.h"
#import "ChangeFontWithButton.h"
#import "CusPageControlWithView.h"
#import "QJLTabBarController.h"

#define titleRatio [UIScreen mainScreen].bounds.size.width/320.0
#define showTitleLabelH 28*titleRatio
#define startButtonW  155*titleRatio
#define startButtonH  40*titleRatio
#define imageCount 4


@interface WelcomeViewController ()<UIScrollViewDelegate>{
    CusPageControlWithView *pageView;
}

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createScrollView];
//    [self addPageControl];

}
#pragma mark 创建UIScrollView
-(void)createScrollView{
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.frame=[UIScreen mainScreen].bounds;
    scrollView.pagingEnabled=YES;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.bounces=NO;
    scrollView.delegate=self;
    scrollView.contentSize=CGSizeMake(scrollView.frame.size.width*imageCount, 0);
    //添加图片
    for (int i=0; i<imageCount; i++) {
        UIImageView *imageView=[[UIImageView alloc]init];
        NSString *strImageName=[NSString stringWithFormat:@"startApp%zi",i];
        imageView.image=[UIImage imageNamed:strImageName];
        imageView.frame=CGRectMake(i*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        
        //在最后一个UIImageView上面添加开始App按钮
        if (i==imageCount-1) {
            [self addStartButton:imageView];
        }
        [scrollView addSubview:imageView];
    }
    [self.view addSubview:scrollView];
}
#pragma mark ScrollView的代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat  getNum=scrollView.contentOffset.x/scrollView.frame.size.width;
    NSInteger pageValue=(NSInteger)(getNum+0.5);
    
    pageView.indexNumWithSlide=pageValue;
    if(pageValue==(imageCount-1)){
        pageView.hidden=YES;
    }
    else{
        pageView.hidden=NO;
    }
}
#pragma mark 创建UIPageControl
-(void)addPageControl{
    CGRect rectValue=CGRectMake(0, self.view.frame.size.height*0.85, AppWidth, 33);
    UIImage *currentImage=[UIImage imageNamed:@"slidePoint"];
    UIImage *pageImage=[UIImage imageNamed:@"slideCirclePoint"];;
    pageView=[CusPageControlWithView cusPageControlWithView:rectValue pageNum:imageCount currentPageIndex:0 currentShowImage:currentImage pageIndicatorShowImage:pageImage];
    [self.view addSubview:pageView];
}
#pragma mark 在图片上面添加开始按钮
-(void)addStartButton:(UIImageView *)imageView{
    
    imageView.userInteractionEnabled=YES;
    ChangeFontWithButton *button=[[ChangeFontWithButton alloc]init];
    [button setTitle:@"立即体验" forState:UIControlStateNormal];
    button.cusFont=[UIFont systemFontOfSize:18];
    button.layer.cornerRadius=startButtonH/2;
    button.layer.masksToBounds=YES;
    button.layer.borderColor=[[UIColor whiteColor]CGColor];
    button.layer.borderWidth=1.5;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    button.frame=CGRectMake(AppWidth/2-startButtonW/2, AppHeight*0.86, startButtonW, startButtonH);
    [button addTarget:self action:@selector(startApp) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:button];
}
#pragma mark 开始App
-(void)startApp{
    QJLTabBarController *VC=[[QJLTabBarController alloc]initWithNibName:@"QJLTabBarController" bundle:nil];
    UIWindow *windows=[UIApplication sharedApplication].keyWindow;
    windows.rootViewController=VC;
    
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
