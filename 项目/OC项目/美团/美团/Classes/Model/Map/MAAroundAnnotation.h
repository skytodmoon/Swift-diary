//
//  MAAroundAnnotation.h
//  美团
//
//  Created by 金亮齐 on 2017/7/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "MAAroundModel.h"

@interface MAAroundAnnotation : MAPointAnnotation

@property(nonatomic, strong) MAAroundModel *maaroundM;

@end
