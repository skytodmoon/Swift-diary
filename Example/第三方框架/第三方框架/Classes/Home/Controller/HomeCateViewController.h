//
//  HomeCateViewController.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCateViewController : UIViewController

@property(nonatomic, strong) UITableView *tableView;

//zhibo 和 feizhibo    时必须传的参数
@property(nonatomic, strong) NSString *cateType;/**< 课程类型 @"zhibo";@"feizhibo"*/

//feizhibo  时必须传的参数
@property(nonatomic, strong) NSMutableArray *cateNameArray;/**< 课程名数组 */
@property(nonatomic, strong) NSMutableArray *cateIDArray;/**< 课程ID数组 */


@end
