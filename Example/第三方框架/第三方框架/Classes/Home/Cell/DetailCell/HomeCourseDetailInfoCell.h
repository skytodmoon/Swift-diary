//
//  HomeCourseDetailInfoCell.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCourseDetailModel.h"

@protocol HomeCourseDetailInfoDelegate <NSObject>

@optional
-(void)didSelectedSchool;

@end

@interface HomeCourseDetailInfoCell : UITableViewCell


@property(nonatomic, strong) HomeCourseDetailModel *jzCourseDM;/**< 数据 */

@property(nonatomic, assign) id<HomeCourseDetailInfoDelegate> delegate;

@end
