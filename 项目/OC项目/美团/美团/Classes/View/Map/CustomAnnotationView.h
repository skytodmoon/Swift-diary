//
//  CustomAnnotationView.h
//  Created by 金亮齐 on 2017/7/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "CustomCalloutView.h"
#import "MAAroundAnnotation.h"

@interface CustomAnnotationView : MAAnnotationView

@property(nonatomic, strong) CustomCalloutView *calloutView;

/*!
 @brief 关联的annotation
 */
@property (nonatomic, strong) MAAroundAnnotation *Annotation;

@end
