//
//  FFTabBarViewModel.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFViewModel.h"
#import "FFSpecialViewModel.h"
#import "FFAuthorViewModel.h"
#import "FFShopViewModel.h"

@interface FFTabBarViewModel : FFViewModel

/// 专题模块的veiw model
@property (nonatomic, strong) FFSpecialViewModel *specialViewModel;
/// 作者模块的view model
@property (nonatomic, strong) FFAuthorViewModel *authorViewModel;
/// 商城模块的view model
@property (nonatomic, strong) FFShopViewModel *shopViewModel;

@end
