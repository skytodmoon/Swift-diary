//
//  SearchBar.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "SearchBar.h"

@implementation SearchBar

-(id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        self.placeholder = @"请输入要搜索的内容";
        self.font = [UIFont systemFontOfSize:13];
        UIImageView *searchIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        
        searchIcon.width = 30;
        
        searchIcon.height = 30;
        
        self.leftView = searchIcon;
        
        searchIcon.contentMode = UIViewContentModeCenter;
        
        self.leftViewMode = UITextFieldViewModeAlways;
     
    }

    return self;    
}





+(instancetype)searchBar {
 
    return [[self alloc]init];
    
}
@end
