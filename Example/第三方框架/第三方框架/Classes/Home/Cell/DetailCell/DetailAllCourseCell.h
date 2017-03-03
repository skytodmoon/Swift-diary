//
//  DetailAllCourseCell.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailAllCourseModel.h"
#import "DetailCateModel.h"

@interface DetailAllCourseCell : UITableViewCell

@property(nonatomic, strong) DetailAllCourseModel *jzAllCourseM;/**< 学校查看所有课程模块传参时用 */
@property(nonatomic, strong) DetailCateModel *jzCateM;/**< 课程分类模块传参时用 */

@end
