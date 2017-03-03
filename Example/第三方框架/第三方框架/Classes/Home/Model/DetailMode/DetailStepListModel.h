//
//  DetailStepListModel.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailStepListModel : NSObject


@property(nonatomic, strong) NSString *StepID;
@property(nonatomic, strong) NSString *StepIndex;
@property(nonatomic, strong) NSString *StepName;
@property(nonatomic, strong) NSMutableArray *ClassList;

@end
