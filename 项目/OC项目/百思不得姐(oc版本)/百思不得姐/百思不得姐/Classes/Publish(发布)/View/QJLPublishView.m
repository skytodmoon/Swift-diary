//
//  QJLPublishView.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/6.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLPublishView.h"
#import "QJLVerticalButton.h"
#import "POP.h"
#import "QJLPublishViewController.h"
#import "UIView+QJLExtension.h"

static CGFloat const QJLAnimationDelay = 0.1;
static CGFloat const QJLAnimationSpringFactor = 8;

@interface QJLPublishView ()
/** */
@property (nonatomic, copy) void (^completionBlock)();
@end

@implementation QJLPublishView

static UIWindow *window_;

+(void)show {
    //1.创建窗口
    window_ = [[UIWindow alloc] init];
    window_.frame = [UIScreen mainScreen].bounds;
    window_.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    window_.hidden = NO;
    
    QJLPublishView *publishView = [QJLPublishView publishView];
    publishView.frame = window_.bounds;
    [window_ addSubview:publishView];
}

+(instancetype)publishView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    //设置控制器的view不能被点击
    self.userInteractionEnabled = NO;
    
    // 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    
    //中间6个按钮
    int maxCols = 3;
    CGFloat buttonW = 72;
    CGFloat buttonH = buttonW + 30;
    CGFloat butttonStartY = (SCREENH - 2 * buttonH) * 0.5;
    CGFloat buttonStartX = 25;
    CGFloat xMargin = (SCREENW - 2 * buttonStartX - maxCols * buttonW) / (maxCols - 1);
    for (int i = 0; i < 6; i++) {
        QJLVerticalButton *button = [[QJLVerticalButton alloc] init];
        [self addSubview:button];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        
        //计算X、Y
        int row = i / maxCols;
        int col = i % maxCols;
        CGFloat buttonX = buttonStartX + col * (xMargin + buttonW);
        CGFloat buttonEndY = butttonStartY + row * buttonH;
        CGFloat buttonBeginY = buttonEndY - SCREENH;
        
        //添加动画
        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        animation.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonBeginY, buttonW, buttonH)];
        animation.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonEndY, buttonW, buttonH)];
        animation.springSpeed = QJLAnimationSpringFactor;
        animation.springBounciness = QJLAnimationSpringFactor;
        animation.beginTime = CACurrentMediaTime() + QJLAnimationDelay * i;
        [button pop_addAnimation:animation forKey:nil];
    }
    
    //添加标语
    UIImageView *sloganView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
    [self addSubview:sloganView];
    
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    CGFloat centerX = SCREENW * 0.5;
    CGFloat centerEndY = SCREENH * 0.2;
    CGFloat centerBeginY = centerEndY - SCREENH;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerBeginY)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerEndY)];
    animation.beginTime = CACurrentMediaTime() + QJLAnimationDelay * images.count;
    [animation setCompletionBlock:^(POPAnimation *animation, BOOL finish) {
        //设置控制器的view不能被点击
        self.userInteractionEnabled = YES;
    }];
    [sloganView pop_addAnimation:animation forKey:nil];
    
}

-(void)buttonClick:(UIButton *)button {
    [self cancelWithCompletionBlock:^{
        if (button.tag == 2) { //发段子
            QJLPublishViewController *publishVC = [[QJLPublishViewController alloc] init];
            
        } else {
            
        }
    }];
    
}

- (IBAction)cancel {
    [self cancelWithCompletionBlock:nil];
}

#pragma mark 先执行退出动画，动画完成后执行completionBlock
-(void)cancelWithCompletionBlock:(void(^)())completionBlock {
    
    //设置控制器的view不能被点击
    self.userInteractionEnabled = NO;
    
    int beginIndex = 1;
    
    for (int i = beginIndex; i < self.subviews.count; i++) {
        UIView *subview = self.subviews[i];
        
        //添加动画
        POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        CGFloat centerY = subview.centerY + SCREENH;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        animation.toValue = [NSValue valueWithCGPoint:CGPointMake(subview.centerX, centerY)];
        animation.beginTime = CACurrentMediaTime() + QJLAnimationDelay * (i - beginIndex);
        [subview pop_addAnimation:animation forKey:nil];
        
        //监听最后一个动画
        if (i == self.subviews.count - 1) {
            [animation setCompletionBlock:^(POPAnimation *animation, BOOL finish) {
                //销毁窗口
                window_.hidden = YES;
                window_ = nil;
                !completionBlock ? : completionBlock();
            }];
        }
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self cancelWithCompletionBlock:nil];
}



@end
