//
//  MerchantDetailViewController.h
//  美团
//
//  Created by 金亮齐 on 2017/7/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerchantDetailViewController : UIViewController

//商店ID
@property(nonatomic, strong) NSString *poiid;

@property(nonatomic, strong) UITableView *tableView;

@end
