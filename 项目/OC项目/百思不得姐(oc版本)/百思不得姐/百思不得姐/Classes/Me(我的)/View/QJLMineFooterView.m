//
//  QJLMineFooterView.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/6.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLMineFooterView.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "QJLSquare.h"
#import "UIButton+WebCache.h"
#import "QJLSquareButton.h"
#import "UIView+QJLExtension.h"
#import "QJLWebViewController.h"

@implementation QJLMineFooterView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        //这个方法是加载网络数据到我的个人中心里面
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSArray *squares = [QJLSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            [self createSquares:squares];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    }
    return self;
}

-(void)createSquares:(NSArray *)squares {
    
    int maxCols = 4;
    
    CGFloat buttonW = SCREENW / maxCols;
    CGFloat buttonH = buttonW;
    
    for (int i = 0; i < squares.count; i++) {
        
        QJLSquareButton *button = [QJLSquareButton buttonWithType:UIButtonTypeCustom];
        button.square = squares[i];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents: UIControlEventTouchUpInside];
        [self addSubview:button];
        
        int col = i % maxCols;
        int row = i / maxCols;
        
        button.x = col * buttonW;
        button.y = row * buttonH;
        button.width = buttonW;
        button.height = buttonH;
    }
    
    NSUInteger rows = (squares.count + maxCols - 1) / maxCols;
    //计算 footer 的长度
    self.height = rows * buttonH;
    // 重绘
    [self setNeedsDisplay];
    
}

-(void)buttonClick:(QJLSquareButton *)button {
    if (![button.square.url hasPrefix:@"bttp"])
        return;
    
    QJLWebViewController *webVC = [[QJLWebViewController alloc]init];
    webVC.title = button.square.name;
    
    UITabBarController *tabBarVC = (UITabBarController * )[UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController *nav = (UINavigationController * )tabBarVC.selectedViewController;
    [nav pushViewController:webVC animated:YES];
}

@end
