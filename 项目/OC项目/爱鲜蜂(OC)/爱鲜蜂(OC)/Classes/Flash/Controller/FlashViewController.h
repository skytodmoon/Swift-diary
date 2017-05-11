//
//  FlashViewController.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectedAdressViewController.h"

@protocol FlashViewControllerDelegate <NSObject>

- (void)didTableView:(UITableView *)tableView clickIndexPath:(NSIndexPath *)indexPath;

@end

@interface FlashViewController : SelectedAdressViewController
@property (nonatomic, weak) id<FlashViewControllerDelegate>delegate;

@end
