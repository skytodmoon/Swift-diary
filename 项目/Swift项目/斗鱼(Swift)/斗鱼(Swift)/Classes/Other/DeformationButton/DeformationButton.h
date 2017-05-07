//
//  DeformationButton.h
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMMaterialDesignSpinner.h"

@interface DeformationButton : UIControl

@property(nonatomic, assign)BOOL isLoading;
@property(nonatomic, retain)MMMaterialDesignSpinner *spinnerView;
@property(nonatomic, retain)UIColor *contentColor;
@property(nonatomic, retain)UIColor *progressColor;

@property(nonatomic, retain)UIButton *forDisplayButton;
- (void)stopLoading;
@end
