//
//  LRLLightView.h
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LRLLightView : UIView

@property (weak, nonatomic) IBOutlet UIView *lightBackView;

@property (nonatomic, strong) NSMutableArray * lightViewArr;

-(void)changeLightViewWithValue:(float)lightValue;

//-(void)hideTheLightViewWithHidden:(BOOL)hidden;

@end
