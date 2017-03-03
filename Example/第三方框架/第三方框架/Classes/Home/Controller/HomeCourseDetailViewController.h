//
//  HomeCourseDetailViewController.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCourseDetailViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSString    *SID;/**< 接收传参 */
@property (nonatomic, strong) NSString    *courseId;/**< 接收传参 */

@end
