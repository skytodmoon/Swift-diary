//
//  CustomSearchBar.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomSearchBar;

@protocol CustomSearchBarDelegate <NSObject>

- (void)customSearchBar:(CustomSearchBar *)searchBar textDidChange:(NSString *)text;

- (void)customSearchBarNeedDisMiss:(CustomSearchBar *)searchBar;

- (void)customSearchBarDidBeginEditing:(CustomSearchBar *)searchBar;

@end

@interface CustomSearchBar : UIView

@property (nonatomic,weak) id<CustomSearchBarDelegate> delegate;


- (void)changeSearchText:(NSString *)text;

+ (instancetype)makeCustomSearchBar;

@end
