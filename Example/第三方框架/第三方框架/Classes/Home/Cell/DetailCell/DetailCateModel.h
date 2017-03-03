//
//  DetailCateModel.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailCateModel : NSObject

@property(nonatomic, strong) NSString *CourseID;
@property(nonatomic, strong) NSString *CourseName;
@property(nonatomic, strong) NSString *SID;
@property(nonatomic, strong) NSString *SchoolName;
@property(nonatomic, strong) NSNumber *PrelectStartTime;

@property(nonatomic, strong) NSNumber *ClassNumber;
@property(nonatomic, strong) NSString *ExpiryTime;
@property(nonatomic, strong) NSString *PayEndTime;
@property(nonatomic, strong) NSString *Cost;
@property(nonatomic, strong) NSString *PhotoURL;

@property(nonatomic, strong) NSString *Brief;
@property(nonatomic, strong) NSString *StudentNumber;
@property(nonatomic, strong) NSString *PayStudentLimit;


@end
